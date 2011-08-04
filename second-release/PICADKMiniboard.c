#include "HardwareProfile.h"
#include "tinymodules/tprintf.h"
#include "tinymodules/tsprintf.h"

void uart2_puts(char* str);

void PAM_initPeripherals(void)
{
	unsigned int pll_startup_counter = 600;

	CLKDIV = 0;
	CLKDIVbits.PLLEN = 1;
	while(pll_startup_counter--);

	// Configure U2RX - put on pin 17 (RP8)
	RPINR19bits.U2RXR = 8;
	// Configure U2TX - put on pin 16 (RP7)
	RPOR3bits.RP7R = 5;

	TRISAbits.TRISA0 = 1;		// PORT A0 -> INPUT

	UART2Init();

    tprintf_SetCallBack(uart2_puts);
}

void uart2_puts(char* str)
{
    UART2PrintString(str);
}
