/*
  Microbridge/PIC sample program

  Coded by Yasuhiro ISHII,2011

  About this sample code:
  1.Connect to Android device via ADB to retrieve logcat stream right after the device is attached.
  2.Then,output the retrieved data to UART.

  This code is suitable to run on PIC24FJ64GB002(PIC ADK Miniboard rev.1).
  About PIC ADK Miniboard,please contact to Japan Android Group Kobe or Twitter: @yishii.

  UART : 57600 [bps]

 */

#include <stdlib.h>
#include "GenericTypeDefs.h"
#include "HardwareProfile.h"
#include "Delay.h"
#include "usb_config.h"
#include "USB/usb.h"
#include "USB/usb_host_generic.h"
#include "user.h"
#include "timer.h"
#include "tinymodules/tprintf.h"
#include "tinymodules/tsprintf.h"
#include "microbridge/Adb_pic.h"

#define PLL_96MHZ_OFF   0xFFFF
#define PLL_96MHZ_ON    0xF7FF

// for PIC24FJ64GB002
_CONFIG1(WDTPS_PS1 & FWPSA_PR32 & WINDIS_OFF & FWDTEN_OFF & ICS_PGx1 & GWRP_OFF & GCP_OFF & JTAGEN_OFF)
_CONFIG2(OSCIOFNC_OFF & POSCMOD_NONE & I2C1SEL_PRI & IOL1WAY_OFF & OSCIOFNC_ON & FCKSM_CSDCMD & FNOSC_FRCPLL & PLL96MHZ_ON & PLLDIV_DIV2 & IESO_OFF)
_CONFIG3(WPFP_WPFP0 & SOSCSEL_IO & WUTSEL_LEG & WPDIS_WPDIS & WPCFG_WPCFGDIS & WPEND_WPENDMEM)
_CONFIG4(DSWDTPS_DSWDTPS3 & DSWDTOSC_LPRC & RTCOSC_SOSC & DSBOREN_OFF & DSWDTEN_OFF)

void output_logcat(char* ,int );

#define ADB_STRING_LOGCAT		"shell:exec logcat"

int main ( void )
{
    Connection* c;

	// PIC ADK Miniboard hardware initialize
	PAM_initPeripherals();

	// Microbridge/PIC (including Microchip's USB MW) initialize
    ADB_init();

    DelayMs(1000);

	// Connect to Android device
	c = ADB_addConnection(ADB_STRING_LOGCAT, true);

    while (1){
		// Run ADB job
        ADB_poll(c);
    }

	// Release resources allocated
	ADB_delConnection(c);

    return 0;
}

void adbEventHandler(Connection * connection, adb_eventType event, uint16_t length, uint8_t * data)
{
    switch(event){
    case ADB_CONNECTION_RECEIVE:
		output_logcat(data,length);
        break;
    case ADB_CONNECTION_OPEN:
        break;
	case ADB_CONNECTION_FAILED:
		break;
	case ADB_CONNECTION_CLOSE:
		break;
    default:
        break;
    }
}

void output_logcat(char* str,int len)
{
    char* buff;
    buff = malloc(len+1);
	if(buff == NULL){
		tprintf("insufficient memory area\r\n");
		return;
	}
    memcpy(buff,str,len);
    *(buff+len)=0x00;
    tprintf("\x1b[31m%s\x1b[m",buff);
    free(buff);
}
