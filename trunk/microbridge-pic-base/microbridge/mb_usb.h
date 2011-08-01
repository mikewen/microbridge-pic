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

	***
	originally this is created as usb.h and I picked some of the items up and put into this code,Yasuhiro ISHII
	***
*/

#ifndef __mb_usb__
#define __mb_usb__

#define ADB_CLASS		0xff
#define ADB_SUBCLASS	0x42
#define ADB_PROTOCOL	0x1

// Device descriptor.
typedef struct
{
	uint8_t bLength;				// Length of this descriptor.
	uint8_t bDescriptorType;		// DEVICE descriptor type (USB_DESCRIPTOR_DEVICE).
	uint16_t bcdUSB;				// USB Spec Release Number (BCD).
	uint8_t bDeviceClass;			// Class code (assigned by the USB-IF). 0xFF-Vendor specific.
	uint8_t bDeviceSubClass;		// Subclass code (assigned by the USB-IF).
	uint8_t bDeviceProtocol;		// Protocol code (assigned by the USB-IF). 0xFF-Vendor specific.
	uint8_t bMaxPacketSize0;		// Maximum packet size for endpoint 0.
	uint16_t idVendor;				// Vendor ID (assigned by the USB-IF).
	uint16_t idProduct;				// Product ID (assigned by the manufacturer).
	uint16_t bcdDevice;				// Device release number (BCD).
	uint8_t iManufacturer;			// Index of String Descriptor describing the manufacturer.
	uint8_t iProduct;				// Index of String Descriptor describing the product.
	uint8_t iSerialNumber;			// Index of String Descriptor with the device's serial number.
	uint8_t bNumConfigurations;		// Number of possible configurations.
} usb_deviceDescriptor;

// Configuration descriptor.
typedef struct
{
	uint8_t bLength;				// Length of this descriptor.
	uint8_t bDescriptorType;		// CONFIGURATION descriptor type (USB_DESCRIPTOR_CONFIGURATION).
	uint16_t wTotalLength;			// Total length of all descriptors for this configuration.
	uint8_t bNumInterfaces;			// Number of interfaces in this configuration.
	uint8_t bConfigurationValue;	// Value of this configuration (1 based).
	uint8_t iConfiguration;			// Index of String Descriptor describing the configuration.
	uint8_t bmAttributes;			// Configuration characteristics.
	uint8_t bMaxPower;				// Maximum power consumed by this configuration.
} usb_configurationDescriptor;

// Interface descriptor.
typedef struct
{
	uint8_t bLength;				// Length of this descriptor.
	uint8_t bDescriptorType;		// INTERFACE descriptor type (USB_DESCRIPTOR_INTERFACE).
	uint8_t bInterfaceNumber;		// Number of this interface (0 based).
	uint8_t bAlternateSetting;		// Value of this alternate interface setting.
	uint8_t bNumEndpoints;			// Number of endpoints in this interface.
	uint8_t bInterfaceClass;		// Class code (assigned by the USB-IF).  0xFF-Vendor specific.
	uint8_t bInterfaceSubClass;		// Subclass code (assigned by the USB-IF).
	uint8_t bInterfaceProtocol;		// Protocol code (assigned by the USB-IF).  0xFF-Vendor specific.
	uint8_t iInterface;				// Index of String Descriptor describing the interface.
} usb_interfaceDescriptor;

/* Endpoint descriptor structure */
typedef struct
{
	uint8_t bLength;				// Length of this descriptor.
	uint8_t bDescriptorType;		// ENDPOINT descriptor type (USB_DESCRIPTOR_ENDPOINT).
	uint8_t bEndpointAddress;		// Endpoint address. Bit 7 indicates direction (0=OUT, 1=IN).
	uint8_t bmAttributes;			// Endpoint transfer type.
	uint16_t wMaxPacketSize;		// Maximum packet size.
	uint8_t bInterval;				// Polling interval in frames.
} usb_endpointDescriptor;

// USB Setup Packet.
typedef struct
{
	uint8_t bmRequestType;			// 0 Bit-map of request type
	uint8_t bRequest;				// 1 Request
	uint16_t wValue;				// 2 Depends on bRequest
	uint16_t wIndex;				// 4 Depends on bRequest
	uint16_t wLength;				// 6 Depends on bRequest
} usb_setupPacket;

/**
 * USB endpoint.
 */
typedef struct
{
    // Endpoint address. Bit 7 indicates direction (out=0, in=1).
	uint8_t address;

	// Endpoint transfer type.
	uint8_t attributes;

	// Maximum packet size.
    uint16_t maxPacketSize;

    // The max3421e uses these bits to toggle between DATA0 and DATA1.
    uint8_t sendToggle;
    uint8_t receiveToggle;

} usb_endpoint;



#endif /* ifdef __mb_usb__ */


