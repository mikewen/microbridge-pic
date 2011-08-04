/*
	Copyright 2011 Niels Brouwers

	Licensed under the Apache License, Version 2.0 (the "License");
	you may not use this file except in compliance with the License.
	You may obtain a copy of the License at

	   http://www.apache.org/licenses/LICENSE-2.0

	Unless required by applicable law or agreed to in writing, software
	distributed under the License is distributed on an "AS IS" BASIS,
	WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	See the License for the specific language governing permissions and
	limitations under the License.

	------------------------------------------------------------

	Microbridge/PIC
	Microbridge/PIC is based on Microbridge originally for Arduino+USB Host shield
	platform by Niels Brouwers.Ported to PIC by Yasuhiro ISHII
	The license for Microbridge/PIC is inherited from original Micribridge,so
	is licensed also under Apache License, Version 2.0.
	Yasuhiro ISHII <ishii.yasuhiro@gmail.com>
*/

#include <stdlib.h>
#include <string.h>
#include <microbridge/Adb_pic.h>
#include <microbridge/mb_usb.h>
#include "usb_config.h"
#include "USB/usb.h"
#include "USB/usb_host_generic.h"
#include "GenericTypeDefs.h"
#include "HardwareProfile.h"
#include "Delay.h"
#include "tinymodules/tprintf.h"

//#define DEBUG

#define serialPrintf	tprintf
#define serialPrint		UART2PrintString
#define delay			DelayMs

#define MAX_BUF_SIZE 256

//static usb_device * adbDevice; //yishii
static Connection * firstConnection; //yishii
static boolean connected;
static int connectionLocalId = 1;
BYTE deviceAddress;  // Address of the device on the USB yishii
static adb_usbConfiguration mUsbConfiguration;
boolean _USB_parseDescriptor(BYTE address,adb_usbConfiguration* handle);
static DWORD _USB_waitUntilCompleteTransaction(BYTE addr,BYTE ep,BYTE* ercode);
boolean device_attached = false;

// fake function for PIC platform,TODO)need to fix it
// to use arduino-based software on pic // yishii
unsigned long millis(void)
{

	static unsigned long c;

	c++;

	return(c);
}

/**
 * Initialises the ADB protocol. This function initialises the USB layer underneath so no further setup is required.
 */
void ADB_init()
{

	tprintf("[%s()]\r\r\n",__func__);

	// Signal that we are not connected.

	//yishii	adbDevice = NULL;

	connected = false;
	memset((void*)&mUsbConfiguration,0,sizeof(mUsbConfiguration));	// yishii add

	// Initialise the USB layer and attach an event handler.

	//yishii	USB::setEventHandler(usbEventHandler);
	//yishii	USB::init();

	if ( USBHostInit(0) == TRUE ){
		tprintf("USB Host initialize finished.\r\n" );
	} else {
		tprintf("Failed to initialize USB Host.\r\nHalt system.\r\n");
		while (1);
	}

	while(device_attached == false){
		USBHostTasks();
		delay(5);
	}
	tprintf("%s : Connected \r\n",__func__);
}

/**
 * Adds a new ADB connection. The connection string is per ADB specs, for example "tcp:1234" opens a
 * connection to tcp port 1234, and "shell:ls" outputs a listing of the phone root filesystem. Connections
 * can be made persistent by setting reconnect to true. Persistent connections will be automatically
 * reconnected when the USB cable is re-plugged in. Non-persistent connections will connect only once,
 * and should never be used after they are closed.
 *
 * The connection string is copied into the Connection record and may not exceed ADB_CONNECTIONSTRING_LENGTH-1
 * characters.
 *
 * @param connectionString ADB connectionstring. I.e. "tcp:1234" or "shell:ls".
 * @param reconnect true for automatic reconnect (persistent connections).
 * @param handler event handler.
 * @return an ADB connection record or NULL on failure (not enough slots or connection string too long).
 */
Connection * ADB_addConnection(const char * connectionString,
							   boolean reconnect)//,
							   //adb_eventHandler * handler)
{

	tprintf("[%s] connectionString=[%s] reconnect=%s\r\r\n",
			__func__,
			connectionString,
			reconnect == TRUE ? "True" : "False");

	// Allocate a new ADB connection object
	Connection * connection = (Connection*)malloc(sizeof(Connection));
	if (connection == NULL){
		tprintf("Allocate memory failed(%s:%s:%d)\r\r\n",__FILE__,__func__,__LINE__);
		while(1);
	}

#if 0
	// Allocate memory for the connection string
	connection->connectionString = (char*)strdup(connectionString);
#else
	// for PIC
	connection->connectionString = malloc(strlen(connectionString)+1);
	strcpy(connection->connectionString,connectionString);
#endif
	if (connection->connectionString==NULL){
		// Free the connection object and return null
		free(connection);
		return NULL;
	}


	// Initialise the newly created object.
	connection->localID = connectionLocalId ++;
	connection->status = ADB_CLOSED;
	connection->lastConnectionAttempt = 0;
	connection->reconnect = reconnect;
	//yishii noneed for PIC pf / connection->eventHandler = handler;

	// Add the connection to the linked list. Note that it's easier to just insert
	// at position 0 because you don't have to traverse the list :)
	connection->next = firstConnection;
	firstConnection = connection;

	// Unable to find an empty spot, all connection slots in use.
	return connection;
}

// Release resources for each connections
// After the connection is closed,call this function with the pointer to Connection as a parameter
// before starting another connection.
// Added this function for Microbridge/PIC yishii
void ADB_delConnection(Connection* c)
{
	if(c != NULL){
		if(c->connectionString != NULL){
			free(c->connectionString);
		}
		free(c);
	}
}

/**
 * Prints an ADB_message, for debugging purposes.
 * @param message ADB message to print.
 */
#ifdef DEBUG
static void adb_printMessage(adb_message * message)
{
	switch(message->command)
	{
	case A_OKAY:
		serialPrintf("OKAY message [%lx] %ld %ld\r\n", message->command, message->arg0, message->arg1);
		break;
	case A_CLSE:
		serialPrintf("CLSE message [%lx] %ld %ld\r\n", message->command, message->arg0, message->arg1);
		break;
	case A_WRTE:
		serialPrintf("WRTE message [%lx] %ld %ld, %ld bytes\r\n", message->command, message->arg0, message->arg1, message->data_length);
		break;
	case A_CNXN:
		serialPrintf("CNXN message [%lx] %ld %ld\r\n", message->command, message->arg0, message->arg1);
		break;
	case A_SYNC:
		serialPrintf("SYNC message [%lx] %ld %ld\r\n", message->command, message->arg0, message->arg1);
		break;
	case A_OPEN:
		serialPrintf("OPEN message [%lx] %ld %ld\r\n", message->command, message->arg0, message->arg1);
		break;
	default:
		serialPrintf("WTF message [%lx] %ld %ld\r\n", message->command, message->arg0, message->arg1);
		break;
	}
}
#endif

/**
 * Writes an empty message (without payload) to the ADB device.
 *
 * @param device USB device handle.
 * @param command ADB command.
 * @param arg0 first ADB argument (command dependent).
 * @param arg0 second ADB argument (command dependent).
 * @return error code or 0 for success.
 */
//int ADB_writeEmptyMessage(usb_device * device, uint32_t command, uint32_t arg0, uint32_t arg1)
int ADB_writeEmptyMessage(/*yishii usb_device * device,*/ uint32_t command, uint32_t arg0, uint32_t arg1)
{
	adb_message message;
	adb_message* msgp;
	BYTE result;

	msgp = malloc(sizeof(adb_message));
	if(msgp == NULL){
		tprintf("Memory allocation error\r\n");
		while(1);
	}
	
	message.command = command;
	message.arg0 = arg0;
	message.arg1 = arg1;
	message.data_length = 0;
	message.data_check = 0;
	message.magic = command ^ 0xffffffff;

#ifdef DEBUG
	serialPrint("OUT << "); adb_printMessage(&message);
#endif

#if 0	//yishii
	return USB::bulkWrite(device, sizeof(adb_message), (uint8_t*)&message);
#else
	
	memcpy((void*)msgp,(void*)&message,sizeof(adb_message));

	result = USBHostWrite(
		mUsbConfiguration.address,
		mUsbConfiguration.outputEndPointAddress,
		(BYTE*)msgp,sizeof(adb_message));

	if(result != USB_SUCCESS){
		tprintf("[%s] USBHostWrite result = %d(%s)\r\n",__func__,result,
			result == USB_SUCCESS ? "USB_SUCCESS" : "Not USB_SUCCESS");
	}

	_USB_waitUntilCompleteTransaction(
		mUsbConfiguration.address,
		mUsbConfiguration.outputEndPointAddress,
		NULL);

	free(msgp);

	return(result == USB_SUCCESS ? 0 : 1);
#endif
}

/**
 * Writes an ADB message with payload to the ADB device.
 *
 * @param device USB device handle.
 * @param command ADB command.
 * @param arg0 first ADB argument (command dependent).
 * @param arg0 second ADB argument (command dependent).
 * @param length payload length.
 * @param data command payload.
 * @return error code or 0 for success.
 */
//int ADB_writeMessage(usb_device * device, uint32_t command, uint32_t arg0, uint32_t arg1, uint32_t length, uint8_t * data)
int ADB_writeMessage(/*usb_device * device,*/ uint32_t command, uint32_t arg0, uint32_t arg1, uint32_t length, uint8_t * data)
{
	adb_message message;
	adb_message* msgp;
	uint32_t count, sum = 0;
	uint8_t * x;
	//uint8_t rcode;
	BYTE result;
	BYTE* data_buffer;

	data_buffer = malloc(length);
	if(data_buffer == NULL){
		tprintf("memory allocation error in %s():%s(%d)\r\n",__func__,__FILE__,__LINE__);
		while(1);
	}

	msgp = malloc(sizeof(adb_message));
	if(msgp == NULL){
		tprintf("memory allocation error in %s():%s(%d)\r\n",__func__,__FILE__,__LINE__);
		while(1);
	}

	memcpy(data_buffer,data,length);
	// Calculate data checksum
    count = length;
    x = data;
    while(count-- > 0) sum += *x++;

	// Fill out the message record.
	message.command = command;
	message.arg0 = arg0;
	message.arg1 = arg1;
	message.data_length = length;
	message.data_check = sum;
	message.magic = command ^ 0xffffffff;

	memcpy((void*)msgp,(void*)&message,sizeof(adb_message));

#ifdef DEBUG
	serialPrint("OUT << "); adb_printMessage(msgp);
#endif

#if 0 // yishii
	rcode = USB::bulkWrite(device, sizeof(adb_message), (uint8_t*)&message);
	if (rcode) return rcode;

	rcode = USB::bulkWrite(device, length, data);
	return rcode;
#else
	result = USBHostWrite(
		mUsbConfiguration.address,
		mUsbConfiguration.outputEndPointAddress,
		(BYTE*)msgp,
		sizeof(adb_message));

	_USB_waitUntilCompleteTransaction(
		mUsbConfiguration.address,
		mUsbConfiguration.outputEndPointAddress,
		NULL);

	delay(100);

	result = USBHostWrite(
		mUsbConfiguration.address,
		mUsbConfiguration.outputEndPointAddress,
		data_buffer,
		length);

	_USB_waitUntilCompleteTransaction(
		mUsbConfiguration.address,
		mUsbConfiguration.outputEndPointAddress,
		NULL);

	free(msgp);
	free(data_buffer);

	return(result == USB_SUCCESS ? 0 : 1);
#endif // yishii
}

/**
 * Writes an ADB command with a string as payload.
 *
 * @param device USB device handle.
 * @param command ADB command.
 * @param arg0 first ADB argument (command dependent).
 * @param arg0 second ADB argument (command dependent).
 * @param str payload string.
 * @return error code or 0 for success.
 */
//int ADB_writeStringMessage(usb_device * device, uint32_t command, uint32_t arg0, uint32_t arg1, char * str)
int ADB_writeStringMessage(/*usb_device * device, */uint32_t command, uint32_t arg0, uint32_t arg1, char * str)
{
	tprintf("[%s] string=[%s]\r\n",__func__,str);
	return ADB_writeMessage(/*device,*/ command, arg0, arg1, strlen(str) + 1, (uint8_t*)str);
}

/**
 * Poll an ADB message.
 * @param message on success, the ADB message will be returned in this struct.
 * @param poll true to poll for a packet on the input endpoint, false to wait for a packet. Use false here when a packet is expected (i.e. OKAY in response to WRTE)
 * @return true iff a packet was successfully received, false otherwise.
 */
#if 1
boolean ADB_pollMessage(adb_message * message, boolean poll)
{
	int bytesRead=0; // yishii
//	uint8_t buf[ADB_USB_PACKETSIZE];
	BYTE result;
	BYTE* buffer;

	buffer = malloc(ADB_USB_PACKETSIZE);
	if(buffer == NULL){
		tprintf("Memory allocation failed(%s:%d)\r\n",__FILE__,__LINE__);
		while(1);
	}

	// Poll a packet from the USB

#if 0 // yishii
	bytesRead = USB::bulkRead(adbDevice, ADB_USB_PACKETSIZE, buf, poll);
	// Check if the USB in transfer was successful.
	if (bytesRead<0) return false;
#else

	if(poll == true){
		USBHostSetNAKTimeout(
			mUsbConfiguration.address,
			mUsbConfiguration.inputEndPointAddress,
			1,
			1);
	}

	result = USBHostRead(
		mUsbConfiguration.address,
		mUsbConfiguration.inputEndPointAddress,
		buffer,
		ADB_USB_PACKETSIZE);

	if(result != USB_SUCCESS){
		tprintf("[%s] USBHostRead result = %d(%s)\r\n",__func__,result,
			result == USB_SUCCESS ? "USB_SUCCESS" : "Not USB_SUCCESS");
		free(buffer);

		if(poll == true){
			USBHostSetNAKTimeout(
				mUsbConfiguration.address,
				mUsbConfiguration.inputEndPointAddress,
				1,
				USB_NAK_LIMIT);
		}

		return false;
	}

	bytesRead = _USB_waitUntilCompleteTransaction(
		mUsbConfiguration.address,
		mUsbConfiguration.inputEndPointAddress,
		NULL);
//	tprintf("bytesRead = %d\r\n",bytesRead);

	if(poll == true){
		USBHostSetNAKTimeout(
			mUsbConfiguration.address,
			mUsbConfiguration.inputEndPointAddress,
			1,
			USB_NAK_LIMIT);
	}

#endif

	// Check if the buffer contains a valid message
	memcpy((void*)message, (void*)buffer, sizeof(adb_message));

	free(buffer);

	// tprintf("message->magic = %08lXh\r\n",message->magic);

	// If the message is corrupt, return.
	if (message->magic != (message->command ^ 0xffffffff))
	{
		serialPrintf("Broken message, magic mismatch, %d bytes\r\n", bytesRead);
		tprintf("number %08lX != %08lX\r\n",message->magic,(message->command ^ 0xffffffff));
		return false; // zantei
#ifdef DEBUG
		serialPrintf("Broken message, magic mismatch, %d bytes\r\n", bytesRead);
		return false;
#endif
	}

	// Check if the received number of bytes matches our expected 24 bytes of ADB message header.
	if (bytesRead != sizeof(adb_message)){
		tprintf("size mismatch\r\n");
		return false;
	}

	return true;
}
#else
boolean ADB_pollMessage(adb_message * message, boolean poll)
{
	int bytesRead=0; // yishii
//	uint8_t buf[ADB_USB_PACKETSIZE];
	BYTE result;
	BYTE* buffer;

	buffer = malloc(ADB_USB_PACKETSIZE);
	if(buffer == NULL){
		tprintf("Memory allocation failed(%s:%d)\r\n",__FILE__,__LINE__);
		while(1);
	}

	// Poll a packet from the USB

#if 0 // yishii
	bytesRead = USB::bulkRead(adbDevice, ADB_USB_PACKETSIZE, buf, poll);
	// Check if the USB in transfer was successful.
	if (bytesRead<0) return false;
#else
	result = USBHostRead(
		mUsbConfiguration.address,
		mUsbConfiguration.inputEndPointAddress,
		buffer,
		ADB_USB_PACKETSIZE);

	if(result != USB_SUCCESS){
		tprintf("[%s] USBHostRead result = %d(%s)\r\n",__func__,result,
			result == USB_SUCCESS ? "USB_SUCCESS" : "Not USB_SUCCESS");
		free(buffer);
		return false;
	}

	bytesRead = _USB_waitUntilCompleteTransaction(
		mUsbConfiguration.address,
		mUsbConfiguration.inputEndPointAddress,
		NULL);

//	tprintf("bytesRead = %d\r\n",bytesRead);
#endif

	// Check if the buffer contains a valid message
	memcpy((void*)message, (void*)buffer, sizeof(adb_message));

	free(buffer);

//	tprintf("message->magic = %08lXh\r\n",message->magic);

	// If the message is corrupt, return.
	if (message->magic != (message->command ^ 0xffffffff))
	{
		serialPrintf("Broken message, magic mismatch, %d bytes\r\n", bytesRead);
		tprintf("number %08lX != %08lX\r\n",message->magic,(message->command ^ 0xffffffff));
		return false; // zantei
#ifdef DEBUG
		serialPrintf("Broken message, magic mismatch, %d bytes\r\n", bytesRead);
		return false;
#endif
	}

	// Check if the received number of bytes matches our expected 24 bytes of ADB message header.
	if (bytesRead != sizeof(adb_message)){
		tprintf("size mismatch\r\n");
		return false;
	}

	return true;
}
#endif

/**
 * Sends an ADB OPEN message for any connections that are currently in the CLOSED state.
 */
void ADB_openClosedConnections(Connection* connection)
{
	uint32_t timeSinceLastConnect;
//	Connection * connection;

	// Iterate over the connection list and send "OPEN" for the ones that are currently closed.
#if 0 // yishii
	for (connection = firstConnection; connection!=NULL; connection = connection->next)
	{
		timeSinceLastConnect = millis() - connection->lastConnectionAttempt;
		if (connection->status==ADB_CLOSED && timeSinceLastConnect>ADB_CONNECTION_RETRY_TIME)
		{
			// Issue open command.
			ADB::writeStringMessage(adbDevice, A_OPEN, connection->localID, 0, connection->connectionString);

			// Record the last attempt time
			connection->lastConnectionAttempt = millis();
			connection->status = ADB_OPENING;

		}
	}
#else
	// Issue open command.

	if (connection->status==ADB_CLOSED/* && timeSinceLastConnect>ADB_CONNECTION_RETRY_TIME*/){

		ADB_writeStringMessage(/*adbDevice, */A_OPEN, connection->localID, 0, connection->connectionString);

		// Record the last attempt time
		connection->lastConnectionAttempt = millis();
		connection->status = ADB_OPENING;
	}


#endif

}

/**
 * Fires an ADB event.
 * @param connection ADB connection. May be NULL in case of global connect/disconnect events.
 * @param type event type.
 * @param length payload length or zero if no payload.
 * @param data payload data if relevant or NULL otherwise.
 */
void ADB_fireEvent(Connection * connection, adb_eventType type, uint16_t length, uint8_t * data)
{

#if 0 // yishii
	// Fire the global event handler, if set.
	if (eventHandler!=NULL)
		eventHandler(connection, type, length, data);

	// Fire the event handler of the connection in question, if relevant
	if (connection!=NULL && connection->eventHandler!=NULL)
		connection->eventHandler(connection, type, length, data);
#endif // yishii
	adbEventHandler(connection,type,length,data);

}

/**
 * Handles and ADB OKAY message, which represents a transition in the connection state machine.
 *
 * @param connection ADB connection
 * @param message ADB message struct.
 */
void ADB_handleOkay(Connection * connection, adb_message * message)
{

	// Check if the OKAY message was a response to a CONNECT message.
	if (connection->status==ADB_OPENING)
	{
		connection->status = ADB_OPEN;
		connection->remoteID = message->arg0;

		ADB_fireEvent(connection, ADB_CONNECTION_OPEN, 0, NULL);
	}

	// Check if the OKAY message was a response to a WRITE message.
	if (connection->status == ADB_WRITING){
		connection->status = ADB_OPEN;
	}
}

/**
 * Handles an ADB CLOSE message, and fires an ADB event accordingly.
 *
 * @param connection ADB connection
 */
void ADB_handleClose(Connection * connection)
{
	// Check if the CLOSE message was a response to a CONNECT message.
	
	tprintf("%s : connection->status = %d\r\n",__func__,connection->status);
	/*
	  typedef enum
	  {
	  ADB_UNUSED = 0,
	  ADB_CLOSED,
	  ADB_OPEN,
	  ADB_OPENING,
	  ADB_RECEIVING,
	  ADB_WRITING
	  } ConnectionStatus;
	 */

	if (connection->status==ADB_OPENING){
		ADB_fireEvent(connection, ADB_CONNECTION_FAILED, 0, NULL);
	} else {
		ADB_fireEvent(connection, ADB_CONNECTION_CLOSE, 0, NULL);
	}

	// Connection failed
	if (connection->reconnect){
		connection->status = ADB_CLOSED;
	} else {
		connection->status = ADB_UNUSED;
	}

}

/**
 * Handles an ADB WRITE message.
 *
 * @param connection ADB connection
 * @param message ADB message struct.
 */
void ADB_handleWrite(Connection * connection, adb_message * message)
{
	uint32_t bytesLeft = message->data_length;
//	uint8_t buf[ADB_USB_PACKETSIZE];
	uint8_t* buf;
	ConnectionStatus previousStatus;
	int bytesRead;
	BYTE result;

	buf = malloc(ADB_USB_PACKETSIZE);
	if(buf == NULL){
		tprintf("Memory allocation error\r\n");
		while(1);
	}

	previousStatus = connection->status;

	connection->status = ADB_RECEIVING;
	connection->dataRead = 0;
	connection->dataSize = message->data_length;

	while (bytesLeft>0)
	{
		int len = bytesLeft < ADB_USB_PACKETSIZE ? bytesLeft : ADB_USB_PACKETSIZE;

		// Read payload
#if 0	// yishii
		bytesRead = USB::bulkRead(adbDevice, len, buf, false);

		if (len != bytesRead)
			serialPrintf("bytes read mismatch: %d expected, %d read, %ld left\r\n", len, bytesRead, bytesLeft);
#else
		result = USBHostRead(
			mUsbConfiguration.address,
			mUsbConfiguration.inputEndPointAddress,
			buf,
			len);

		if(result != USB_SUCCESS){
			tprintf("[%s] USBHostRead error code = %08Xh\r\n",__func__,result);
			while(1);
		}

		bytesRead = _USB_waitUntilCompleteTransaction(
			mUsbConfiguration.address,
			mUsbConfiguration.inputEndPointAddress,
			NULL);

		if(len != bytesRead){
			tprintf("bytes read mismatch: %d expected, %d read, %ld left\r\n",len,bytesRead,bytesLeft);
			while(1);
		}
#endif
		// Break out of the read loop if there's no data to read :(
		//if (bytesRead==-1) break;

		connection->dataRead += len;
		
		ADB_fireEvent(connection, ADB_CONNECTION_RECEIVE, len, buf);
		bytesLeft -= bytesRead;

	}
	free(buf);

	// Send OKAY message in reply.
	//yishii
	bytesRead = ADB_writeEmptyMessage(/*adbDevice, */A_OKAY, message->arg1, message->arg0);

	connection->status = previousStatus;

}

// for debug func
void lprintf(char* str,int len)
{
	char* buff;
	buff = malloc(len+1);
	if(buff == NULL){
		tprintf("%s:%d Memory allocation failed\r\n",__FILE__,__LINE__);
		while(1);
	}

	memcpy(buff,str,len);
	*(buff+len)=0x00;
	tprintf("\x1b[31m%s\x1b[m",buff);
	free(buff);
}


/**
 * Close all ADB connections.
 *
 * @param connection ADB connection
 * @param message ADB message struct.
 */
void ADB_closeAll()
{
	Connection * connection;

	tprintf("\r\nMicroBridge/PIC system halted\r\n");
	while(1);

	// Iterate over all connections and close the ones that are currently open.
#if 0 // yishii
	for (connection = firstConnection; connection != NULL; connection = connection->next){
		if (!(connection->status==ADB_UNUSED || connection->status==ADB_CLOSED)){
			ADB::handleClose(connection);
		}
	}
#else
	if (!(connection->status==ADB_UNUSED || connection->status==ADB_CLOSED)){
		ADB_handleClose(connection);
	}
#endif // yishii

}

/**
 * Handles an ADB connect message. This is a response to a connect message sent from our side.
 * @param message ADB message.
 */
void ADB_handleConnect(adb_message * message)
{
	unsigned int bytesRead;
//	uint8_t buf[MAX_BUF_SIZE];
	uint8_t* buf;
	uint16_t len;
	BYTE result;

	buf = malloc(MAX_BUF_SIZE);
	if(buf == NULL){
		tprintf("%s:%d Memory allocation failed\r\n",__FILE__,__LINE__);
		while(1);
	}

	// Read payload (remote ADB device ID)
	len = message->data_length < MAX_BUF_SIZE ? message->data_length : MAX_BUF_SIZE;
#if 0	// yishii
	bytesRead = USB::bulkRead(adbDevice, len, buf, false);
#else

	result = USBHostRead(
		mUsbConfiguration.address,
		mUsbConfiguration.inputEndPointAddress,
		buf,
		len);

	if(result != USB_SUCCESS){
		tprintf("USBHostRead fail\r\n");
	}

	_USB_waitUntilCompleteTransaction(
		mUsbConfiguration.address,
		mUsbConfiguration.inputEndPointAddress,
		NULL);

#endif

	// Signal that we are now connected to an Android device (yay!)
	connected = true;
	tprintf("*************************************\r\n");
	tprintf(" CONNECTED\r\n");
	tprintf("*************************************\r\n");

	// Fire event.
	ADB_fireEvent(NULL, ADB_CONNECT, len, buf);

	free(buf);
}

/**
 * This method is called periodically to check for new messages on the USB bus and process them.
 */
void ADB_poll(Connection* connection)
{
//	Connection * connection;
	adb_message message;

	BYTE result;

	// Poll the USB layer.
	USBHostTasks();

	if(mUsbConfiguration.address == 0){
		return;
	}

	// If no USB device, there's no work for us to be done, so just return.
//yishii	if (adbDevice==NULL) return;

	// If not connected, send a connection string to the device.
	tprintf("[%s] connected = %s\r\n",__func__,connected == true ? "true" : "false");

	if (!connected)
	{
		ADB_writeStringMessage(/*adbDevice,*/A_CNXN, 0x01000000, 4096, (char*)"host::microbridge");
		delay(500); // Give the device some time to respond.
	}

	if(connected) {
		ADB_openClosedConnections(connection);
	}

	// Check for an incoming ADB message.
	if (!ADB_pollMessage(&message, true)){
		return;
	}

	// Handle a response from the ADB device to our CONNECT message.
	if (message.command == A_CNXN){
		ADB_handleConnect(&message);
	}

	// Handle messages for specific connections
#if 0 //yishii
	for (connection = firstConnection; connection != NULL; connection = connection->next){
		if (connection->status!=ADB_UNUSED && connection->localID==message.arg1){
			while(1);
			switch(message.command){
			case A_OKAY:
				ADB_handleOkay(connection, &message);
				break;
			case A_CLSE:
				ADB_handleClose(connection);
				break;
			case A_WRTE:
				ADB_handleWrite(connection, &message);
				break;
			default:
				break;
			}
		}
	}
#else
	tprintf("connection->status = %d,connection->localID=%ld,message.arg1=%ld\r\n",
			(int)connection->status,connection->localID,message.arg1);

	if (connection->status!=ADB_UNUSED && connection->localID==message.arg1){
		switch(message.command){
		case A_OKAY:
			tprintf("[%s] A_OKAY\r\n",__func__);
			ADB_handleOkay(connection, &message);
			break;
		case A_CLSE:
			tprintf("[%s] A_CLSE\r\n",__func__);
			ADB_handleClose(connection);

			if(connection->status == ADB_UNUSED){
				tprintf("ADB_UNUSED\r\n");
			} else if(connection->status == ADB_CLOSED){
				tprintf("ADB_CLOSED\r\n");
			} else {
				tprintf("ADB_??? value is %d\r\n",connection->status);
			}

			break;
		case A_WRTE:
			tprintf("[%s] A_WRTE\r\n",__func__);
			ADB_handleWrite(connection, &message);
			break;
		default:
			tprintf("[%s] Unknown\r\n",__func__);
			break;
		}
	}

#endif //yishii

}


/**
 * Write a set of bytes to an open ADB connection.
 *
 * @param connection ADB connection to write the data to.
 * @param length number of bytes to transmit.
 * @param data data to send.
 * @return number of transmitted bytes, or -1 on failure.
 */
int ADB_write(Connection * connection, uint16_t length, uint8_t * data)
{
	int ret;

	// First check if we have a working ADB connection
	if (/*adbDevice==NULL ||*/ !connected) return -1;

	// Check if the connection is open for writing.
	if (connection->status != ADB_OPEN) return -2;

	// Write payload
	ret = ADB_writeMessage(/*adbDevice, */A_WRTE, connection->localID, connection->remoteID, length, data);
	if (ret==0){
		connection->status = ADB_WRITING;
	}

	return ret;
}

/**
 * Write a string to an open ADB connection. The trailing zero is not transmitted.
 *
 * @param connection ADB connection to write the data to.
 * @param length number of bytes to transmit.
 * @param data data to send.
 * @return number of transmitted bytes, or -1 on failure.
 */
int ADB_writeString(Connection * connection, char * str)
{
	int ret;

	// First check if we have a working ADB connection
	if (/*adbDevice==NULL ||*/ !connected) return -1;

	// Check if the connection is open for writing.
	if (connection->status != ADB_OPEN) return -2;

	// Write payload
	ret = ADB_writeStringMessage(/*adbDevice, */A_WRTE, connection->localID, connection->remoteID, str);
	if (ret==0)
		connection->status = ADB_WRITING;

	return ret;
}


/*************************************************************************
 * Function:        USB_ApplicationEventHandler
 *
 * Preconditions:   The USB must be initialized.
 *
 * Input:           event       Identifies the bus event that occured
 *
 *                  data        Pointer to event-specific data
 *
 *                  size        Size of the event-specific data
 *
 * Output:          deviceAddress (global)
 *                  Updates device address when an attach or detach occurs.
 *
 *                  DemoState (global)
 *                  Updates the demo state as appropriate when events occur.
 *
 * Returns:         TRUE if the event was handled, FALSE if not
 *
 * Side Effects:    Event-specific actions have been taken.
 *
 * Overview:        This routine is called by the Host layer or client
 *                  driver to notify the application of events that occur.
 *                  If the event is recognized, it is handled and the
 *                  routine returns TRUE.  Otherwise, it is ignored (or
 *                  just "sniffed" and the routine returns FALSE.
 *************************************************************************/
// added yishii
BOOL USB_ApplicationEventHandler ( BYTE address, USB_EVENT event, void *data, DWORD size )
{
#ifdef USB_GENERIC_SUPPORT_SERIAL_NUMBERS
    BYTE i;
#endif

	if(event != EVENT_VBUS_REQUEST_POWER){
		tprintf("[%s] addr=%d,event=%d,size=%d\r\n",
			__func__,
			address,
			(int)event,
			/*((char*)data)[0],((char*)data)[1],((char*)data)[2],((char*)data)[3],*/size);
	}

	// Handle specific events.
	switch (event){
		case EVENT_GENERIC_ATTACH:
			if (size == sizeof(GENERIC_DEVICE_ID)){
				deviceAddress   = ((GENERIC_DEVICE_ID *)data)->deviceAddress;
				tprintf("Device Attached addr=%d,vid=%04Xh,pid=%04Xh\r\n",
					deviceAddress,
					((GENERIC_DEVICE_ID *)data)->vid,
					((GENERIC_DEVICE_ID *)data)->pid);

				mUsbConfiguration.address = deviceAddress;

#ifdef USB_GENERIC_SUPPORT_SERIAL_NUMBERS
				for (i=1; i<((GENERIC_DEVICE_ID *)data)->serialNumberLength; i++){
					UART2PutChar( ((GENERIC_DEVICE_ID *)data)->serialNumber[i] );
				}
#endif
				_USB_parseDescriptor(deviceAddress,&mUsbConfiguration);

				device_attached = true;
				return TRUE;
            }
            break;

        case EVENT_GENERIC_DETACH:
			device_attached = false;
            deviceAddress   = 0;

			// Check if the device that was disconnected is the ADB device we've been using.
//			if (device == adbDevice){
				// Close all open ADB connections.
			ADB_closeAll();

				// Signal that we're no longer connected by setting the global device handler to NULL;
				//adbDevice = NULL;
			connected = false;
//			}

			
			tprintf( "EVENT_GENERIC_DETACH\r\n" );
			while(1);

			return TRUE;
			break;

        case EVENT_GENERIC_TX_DONE:           // The main state machine will poll the driver.
            return TRUE;
			break;
		case EVENT_GENERIC_RX_DONE:
            return TRUE;
			break;

        case EVENT_VBUS_REQUEST_POWER:
            // We'll let anything attach.
            return TRUE;
			break;

        case EVENT_VBUS_RELEASE_POWER:
            // We aren't keeping track of power.
            return TRUE;
			break;

        case EVENT_HUB_ATTACH:
            UART2PrintString( "\r\r\n***** USB Error - hubs are not supported *****\r\r\n" );
            return TRUE;
            break;

        case EVENT_UNSUPPORTED_DEVICE:
            UART2PrintString( "\r\r\n***** USB Error - device is not supported *****\r\r\n" );
            return TRUE;
            break;

        case EVENT_CANNOT_ENUMERATE:
            UART2PrintString( "\r\r\n***** USB Error - cannot enumerate device *****\r\r\n" );
            return TRUE;
            break;

        case EVENT_CLIENT_INIT_ERROR:
            UART2PrintString( "\r\r\n***** USB Error - client driver initialization error *****\r\r\n" );
            return TRUE;
            break;

        case EVENT_OUT_OF_MEMORY:
            UART2PrintString( "\r\r\n***** USB Error - out of heap memory *****\r\r\n" );
            return TRUE;
            break;

        case EVENT_UNSPECIFIED_ERROR:   // This should never be generated.
            UART2PrintString( "\r\r\n***** USB Error - unspecified *****\r\r\n" );
            return TRUE;
            break;

        case EVENT_SUSPEND:
        case EVENT_DETACH:
        case EVENT_RESUME:
        case EVENT_BUS_ERROR:
            return TRUE;
            break;

        default:
            break;
    }

    return FALSE;

} // USB_ApplicationEventHandler


/*
  Parse descriptor
  Yasuhiro ISHII
*/
boolean _USB_parseDescriptor(BYTE address,adb_usbConfiguration* handle)
{
	BYTE* descriptor;
	WORD i;
	BYTE endpointIN = 0;
	BYTE endpointOUT = 0;
	usb_interfaceDescriptor* pIdesc;
	usb_endpointDescriptor* pEdesc;
	boolean adbFound = false;
	BYTE descriptorType;

	descriptor = USBHostGetCurrentConfigurationDescriptor( address );

	i = 0;
	while(i < ((USB_CONFIGURATION_DESCRIPTOR*)descriptor)->wTotalLength){
		descriptorType = descriptor[i+1];
		if(descriptorType == USB_DESCRIPTOR_INTERFACE){
			pIdesc = &(descriptor[i]);

#if 0
			tprintf("bDescriptorType = 0x%02x\r\n",pIdesc->bDescriptorType);
			tprintf("bInterfaceNumber = 0x%02x\r\n",pIdesc->bInterfaceNumber);
			tprintf("bAlternateSetting = 0x%02x\r\n",pIdesc->bAlternateSetting);
			tprintf("bNumEndpoints = 0x%02x\r\n",pIdesc->bNumEndpoints);
			tprintf("bInterfaceClass = 0x%02x\r\n",pIdesc->bInterfaceClass);
			tprintf("bInterfaceSubClass = 0x%02x\r\n",pIdesc->bInterfaceSubClass);
			tprintf("bInterfaceProtocol = 0x%02x\r\n",pIdesc->bInterfaceProtocol);
			tprintf("iInterface = 0x%02x\r\n",pIdesc->iInterface);
#endif

			if((pIdesc->bInterfaceProtocol == ADB_PROTOCOL) &&
			   (pIdesc->bInterfaceClass == ADB_CLASS) &&
			   (pIdesc->bInterfaceSubClass == ADB_SUBCLASS)){
				// tprintf(" is ADB interface\r\n");
				adbFound = true;
			} else {
				// tprintf(" is NOT ADB interface\r\n");
				adbFound = false;
			}
		} else if(descriptorType == USB_DESCRIPTOR_ENDPOINT){
			if(adbFound == true){
				pEdesc = &(descriptor[i]);
				{
					BYTE addr;
					addr = pEdesc->bEndpointAddress;
					if((addr & 0x80) == 0x80){
						// retrieve IN EP
						endpointIN = addr;
					} else {
						// retrieve OUT EP
						endpointOUT = addr;
					}
				}

				if(endpointIN && endpointOUT){
					handle->inputEndPointAddress = endpointIN;
					handle->outputEndPointAddress = endpointOUT;
					tprintf(" Endpoint[IN]  = %02Xh\r\n",endpointIN);
					tprintf(" Endpoint[OUT] = %02Xh\r\n",endpointOUT);
#if 1
					USBHostSetNAKTimeout( address, endpointIN,  1, USB_NUM_BULK_NAKS*10 );
					USBHostSetNAKTimeout( address, endpointOUT, 1, USB_NUM_BULK_NAKS*10 );
#else
					USBHostSetNAKTimeout( address, endpointIN,  0, USB_NUM_BULK_NAKS );
					USBHostSetNAKTimeout( address, endpointOUT, 0, USB_NUM_BULK_NAKS );
#endif
					return TRUE;
				}
			}
		}
		i += descriptor[i];
	}
	return FALSE;
}

/*
  Wait until the requested transaction is finished for PIC
*/
static DWORD _USB_waitUntilCompleteTransaction(BYTE addr,BYTE ep,BYTE* ercode)
{
	BYTE local_errcode;
	DWORD bytecount = 0;

	while(USBHostTransferIsComplete(addr,ep,&local_errcode,&bytecount) == FALSE){
		USBHostTasks();
		delay(5);
	}

	if(local_errcode != USB_SUCCESS){
		if (local_errcode == USB_ENDPOINT_STALLED){
			// clear the internal error state
			// USBHostClearEndpointErrors(addr,ep);
			tprintf("*** USB ENDPOINT STALLED -> Error cleared\r\n");
		} else if(local_errcode == USB_ENDPOINT_NOT_FOUND){
			tprintf("*** USB_ENDPOINT_NOT_FOUND\r\n");
			tprintf("addr=%d,EP=%02Xh,resolve code=%02Xh\r\n",
				addr,
				ep,
				local_errcode);
		} else if(local_errcode == USB_ENDPOINT_NAK_TIMEOUT){
			tprintf("USB_ENDPOINT_NAK_TIMEOUT\r\n");
			tprintf("addr=%d,EP=%02Xh,resolve code=%02Xh\r\n",
				addr,
				ep,
				local_errcode);
		} else {
			tprintf("*** Error occurred,but cannot resolve.addr=%d,EP=%02Xh,code=%02Xh\r\n",
				addr,
				ep,
				local_errcode);
		}
		USBHostClearEndpointErrors(addr,ep);

	}
#if 0
	tprintf("--> [%s(%2d,%02X)] Completed,errcode=%02Xh,bytecount=%04Xh\r\n",
		__func__,
		addr,
		ep,
		*ercode,
		bytecount);
#endif

	if(ercode != NULL){
		*ercode = local_errcode;
	}

	return(bytecount);
}
