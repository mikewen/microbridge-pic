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
	limitations under the License.#include <string.h>

	------------------------------------------------------------

	Microbridge/PIC
	Microbridge/PIC is based on Microbridge originally for Arduino+USB Host shield
	platform by Niels Brouwers.Ported to PIC by Yasuhiro ISHII
	The license for Microbridge/PIC is inherited from original Micribridge,so
	is licensed also under Apache License, Version 2.0.
	Yasuhiro ISHII <ishii.yasuhiro@gmail.com>
*/

#ifndef __adb_h__
#define __adb_h__

typedef	unsigned char	uint8_t;
typedef unsigned short	uint16_t;
typedef	unsigned long	uint32_t;
typedef int				boolean;
typedef void*			adb_eventHandler;

#define true			1
#define false			0


#define MAX_PAYLOAD 4096;
#define USB_NAK_LIMIT       32000

#define A_SYNC 0x434e5953
#define A_CNXN 0x4e584e43
#define A_OPEN 0x4e45504f
#define A_OKAY 0x59414b4f
#define A_CLSE 0x45534c43
#define A_WRTE 0x45545257

#define ADB_CLASS 0xff
#define ADB_SUBCLASS 0x42
#define ADB_PROTOCOL 0x1

#define ADB_USB_PACKETSIZE 0x40
#define ADB_CONNECTION_RETRY_TIME 1000


typedef struct
{
	uint8_t address;
	uint8_t configuration;
	uint8_t interface;
	uint8_t inputEndPointAddress;
	uint8_t outputEndPointAddress;
} adb_usbConfiguration;

typedef struct
{
	// Command identifier constant
	uint32_t command;

	// First argument
	uint32_t arg0;

	// Second argument
	uint32_t arg1;

	// Payload length (0 is allowed)
	uint32_t data_length;

	// Checksum of data payload
	uint32_t data_check;

	// Command ^ 0xffffffff
	uint32_t magic;

} adb_message;

typedef enum
{
	ADB_UNUSED = 0,
	ADB_CLOSED,
	ADB_OPEN,
	ADB_OPENING,
	ADB_RECEIVING,
	ADB_WRITING
} ConnectionStatus;

typedef enum
{
	ADB_CONNECT = 0,
	ADB_DISCONNECT,
	ADB_CONNECTION_OPEN,
	ADB_CONNECTION_CLOSE,
	ADB_CONNECTION_FAILED,
	ADB_CONNECTION_RECEIVE
} adb_eventType;

typedef struct sConnection {
	char * connectionString;
	uint32_t localID, remoteID;
	uint32_t lastConnectionAttempt;
	uint16_t dataSize, dataRead;
	ConnectionStatus status;
	boolean reconnect;
	//yishii adb_eventHandler * eventHandler;
	struct sConnection * next;

} Connection;


void ADB_init();
void ADB_poll();
Connection * ADB_addConnection(const char * connectionString,boolean reconnect);
void ADB_delConnection(Connection* c);

#endif

