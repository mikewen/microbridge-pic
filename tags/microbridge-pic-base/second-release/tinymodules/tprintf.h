#ifndef _TPRINTF_H_
#define _TPRINTF_H_

/*
  Tiny printf module
   for Embedded microcontrollers
*/

extern int tprintf(const char* , ...);
extern void tprintf_SetCallBack(void (*)(char*));

#ifndef NULL
#define NULL	((void*)0)
#endif

#endif /* _TPRINTF_H_ */

