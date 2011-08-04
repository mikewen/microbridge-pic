#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
include Makefile

# Environment
MKDIR=mkdir -p
RM=rm -f 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.elf
else
IMAGE_TYPE=production
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.elf
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1463451266/Adb_pic.o ${OBJECTDIR}/_ext/1472/Delay.o ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o ${OBJECTDIR}/_ext/1472/main.o ${OBJECTDIR}/_ext/1472/usb_config.o ${OBJECTDIR}/_ext/1664993608/tprintf.o ${OBJECTDIR}/_ext/1664993608/tsprintf.o ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o ${OBJECTDIR}/_ext/221508487/uart2.o ${OBJECTDIR}/_ext/343710134/usb_host.o


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

# Path to java used to run MPLAB X when this makefile was created
MP_JAVA_PATH=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/bin/
OS_CURRENT="$(shell uname -s)"
############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
MP_CC=/Applications/microchip/mplabc30/v3.30b/bin/pic30-gcc
# MP_BC is not defined
MP_AS=/Applications/microchip/mplabc30/v3.30b/bin/pic30-as
MP_LD=/Applications/microchip/mplabc30/v3.30b/bin/pic30-ld
MP_AR=/Applications/microchip/mplabc30/v3.30b/bin/pic30-ar
# MP_BC is not defined
MP_CC_DIR=/Applications/microchip/mplabc30/v3.30b/bin
# MP_BC_DIR is not defined
MP_AS_DIR=/Applications/microchip/mplabc30/v3.30b/bin
MP_LD_DIR=/Applications/microchip/mplabc30/v3.30b/bin
MP_AR_DIR=/Applications/microchip/mplabc30/v3.30b/bin
# MP_BC_DIR is not defined

.build-conf: ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.elf

MP_PROCESSOR_OPTION=24FJ64GB002
MP_LINKER_FILE_OPTION=,-Tp24FJ64GB002.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1472/Delay.o: ../Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.ok ${OBJECTDIR}/_ext/1472/Delay.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/Delay.o.d -o ${OBJECTDIR}/_ext/1472/Delay.o ../Delay.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/Delay.o.d -o ${OBJECTDIR}/_ext/1472/Delay.o ../Delay.c   > ${OBJECTDIR}/_ext/1472/Delay.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/Delay.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/Delay.o.d > ${OBJECTDIR}/_ext/1472/Delay.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/Delay.o.tmp ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/Delay.o.d > ${OBJECTDIR}/_ext/1472/Delay.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/Delay.o.tmp ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1472/Delay.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/Delay.o.ok; else cat ${OBJECTDIR}/_ext/1472/Delay.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1664993608/tsprintf.o: ../tinymodules/tsprintf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1664993608 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok ${OBJECTDIR}/_ext/1664993608/tsprintf.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d -o ${OBJECTDIR}/_ext/1664993608/tsprintf.o ../tinymodules/tsprintf.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d -o ${OBJECTDIR}/_ext/1664993608/tsprintf.o ../tinymodules/tsprintf.c   > ${OBJECTDIR}/_ext/1664993608/tsprintf.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d > ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${CP} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d > ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${CP} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok; else cat ${OBJECTDIR}/_ext/1664993608/tsprintf.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.ok ${OBJECTDIR}/_ext/1472/main.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/main.o.d -o ${OBJECTDIR}/_ext/1472/main.o ../main.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/main.o.d -o ${OBJECTDIR}/_ext/1472/main.o ../main.c   > ${OBJECTDIR}/_ext/1472/main.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/main.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/main.o.d > ${OBJECTDIR}/_ext/1472/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/main.o.tmp ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/main.o.d > ${OBJECTDIR}/_ext/1472/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/main.o.tmp ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1472/main.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/main.o.ok; else cat ${OBJECTDIR}/_ext/1472/main.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/343710134/usb_host.o: ../Microchip/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/343710134 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.ok ${OBJECTDIR}/_ext/343710134/usb_host.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/343710134/usb_host.o.d -o ${OBJECTDIR}/_ext/343710134/usb_host.o ../Microchip/USB/usb_host.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/343710134/usb_host.o.d -o ${OBJECTDIR}/_ext/343710134/usb_host.o ../Microchip/USB/usb_host.c   > ${OBJECTDIR}/_ext/343710134/usb_host.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/343710134/usb_host.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/343710134/usb_host.o.d > ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${CP} ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/343710134/usb_host.o.d > ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${CP} ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/343710134/usb_host.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/343710134/usb_host.o.ok; else cat ${OBJECTDIR}/_ext/343710134/usb_host.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1899306274/usb_host_generic.o: ../Microchip/USB/Generic\ Host\ Driver/usb_host_generic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1899306274 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d -o ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o ../Microchip/USB/Generic\ Host\ Driver/usb_host_generic.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d -o ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o ../Microchip/USB/Generic\ Host\ Driver/usb_host_generic.c   > ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d > ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${CP} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d > ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${CP} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok; else cat ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1664993608/tprintf.o: ../tinymodules/tprintf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1664993608 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok ${OBJECTDIR}/_ext/1664993608/tprintf.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1664993608/tprintf.o.d -o ${OBJECTDIR}/_ext/1664993608/tprintf.o ../tinymodules/tprintf.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1664993608/tprintf.o.d -o ${OBJECTDIR}/_ext/1664993608/tprintf.o ../tinymodules/tprintf.c   > ${OBJECTDIR}/_ext/1664993608/tprintf.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1664993608/tprintf.o.d > ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${CP} ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1664993608/tprintf.o.d > ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${CP} ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok; else cat ${OBJECTDIR}/_ext/1664993608/tprintf.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/221508487/uart2.o: ../Microchip/Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/221508487 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.ok ${OBJECTDIR}/_ext/221508487/uart2.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/221508487/uart2.o.d -o ${OBJECTDIR}/_ext/221508487/uart2.o ../Microchip/Common/uart2.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/221508487/uart2.o.d -o ${OBJECTDIR}/_ext/221508487/uart2.o ../Microchip/Common/uart2.c   > ${OBJECTDIR}/_ext/221508487/uart2.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/221508487/uart2.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/221508487/uart2.o.d > ${OBJECTDIR}/_ext/221508487/uart2.o.tmp
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${CP} ${OBJECTDIR}/_ext/221508487/uart2.o.tmp ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/221508487/uart2.o.d > ${OBJECTDIR}/_ext/221508487/uart2.o.tmp
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${CP} ${OBJECTDIR}/_ext/221508487/uart2.o.tmp ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/221508487/uart2.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/221508487/uart2.o.ok; else cat ${OBJECTDIR}/_ext/221508487/uart2.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.ok ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/usb_config.o.d -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/usb_config.o.d -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c   > ${OBJECTDIR}/_ext/1472/usb_config.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/usb_config.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/usb_config.o.d > ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/usb_config.o.d > ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1472/usb_config.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/usb_config.o.ok; else cat ${OBJECTDIR}/_ext/1472/usb_config.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1472/PICADKMiniboard.o: ../PICADKMiniboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.ok ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d -o ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o ../PICADKMiniboard.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d -o ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o ../PICADKMiniboard.c   > ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d > ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d > ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.ok; else cat ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1463451266/Adb_pic.o: ../microbridge/Adb_pic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1463451266 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d -o ${OBJECTDIR}/_ext/1463451266/Adb_pic.o ../microbridge/Adb_pic.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d -o ${OBJECTDIR}/_ext/1463451266/Adb_pic.o ../microbridge/Adb_pic.c   > ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d > ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${CP} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d > ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${CP} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok; else cat ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.err; exit 1; fi
	
else
${OBJECTDIR}/_ext/1472/Delay.o: ../Delay.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.ok ${OBJECTDIR}/_ext/1472/Delay.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/Delay.o.d -o ${OBJECTDIR}/_ext/1472/Delay.o ../Delay.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/Delay.o.d -o ${OBJECTDIR}/_ext/1472/Delay.o ../Delay.c   > ${OBJECTDIR}/_ext/1472/Delay.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/Delay.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/Delay.o.d > ${OBJECTDIR}/_ext/1472/Delay.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/Delay.o.tmp ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/Delay.o.d > ${OBJECTDIR}/_ext/1472/Delay.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/Delay.o.tmp ${OBJECTDIR}/_ext/1472/Delay.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/Delay.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1472/Delay.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/Delay.o.ok; else cat ${OBJECTDIR}/_ext/1472/Delay.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1664993608/tsprintf.o: ../tinymodules/tsprintf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1664993608 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok ${OBJECTDIR}/_ext/1664993608/tsprintf.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d -o ${OBJECTDIR}/_ext/1664993608/tsprintf.o ../tinymodules/tsprintf.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d -o ${OBJECTDIR}/_ext/1664993608/tsprintf.o ../tinymodules/tsprintf.c   > ${OBJECTDIR}/_ext/1664993608/tsprintf.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d > ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${CP} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d > ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${CP} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp ${OBJECTDIR}/_ext/1664993608/tsprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tsprintf.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1664993608/tsprintf.o.ok; else cat ${OBJECTDIR}/_ext/1664993608/tsprintf.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1472/main.o: ../main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.ok ${OBJECTDIR}/_ext/1472/main.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/main.o.d -o ${OBJECTDIR}/_ext/1472/main.o ../main.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/main.o.d -o ${OBJECTDIR}/_ext/1472/main.o ../main.c   > ${OBJECTDIR}/_ext/1472/main.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/main.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/main.o.d > ${OBJECTDIR}/_ext/1472/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/main.o.tmp ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/main.o.d > ${OBJECTDIR}/_ext/1472/main.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/main.o.tmp ${OBJECTDIR}/_ext/1472/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/main.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1472/main.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/main.o.ok; else cat ${OBJECTDIR}/_ext/1472/main.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/343710134/usb_host.o: ../Microchip/USB/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/343710134 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.ok ${OBJECTDIR}/_ext/343710134/usb_host.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/343710134/usb_host.o.d -o ${OBJECTDIR}/_ext/343710134/usb_host.o ../Microchip/USB/usb_host.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/343710134/usb_host.o.d -o ${OBJECTDIR}/_ext/343710134/usb_host.o ../Microchip/USB/usb_host.c   > ${OBJECTDIR}/_ext/343710134/usb_host.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/343710134/usb_host.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/343710134/usb_host.o.d > ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${CP} ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/343710134/usb_host.o.d > ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${CP} ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp ${OBJECTDIR}/_ext/343710134/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/343710134/usb_host.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/343710134/usb_host.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/343710134/usb_host.o.ok; else cat ${OBJECTDIR}/_ext/343710134/usb_host.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1899306274/usb_host_generic.o: ../Microchip/USB/Generic\ Host\ Driver/usb_host_generic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1899306274 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d -o ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o ../Microchip/USB/Generic\ Host\ Driver/usb_host_generic.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d -o ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o ../Microchip/USB/Generic\ Host\ Driver/usb_host_generic.c   > ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d > ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${CP} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d > ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${CP} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.ok; else cat ${OBJECTDIR}/_ext/1899306274/usb_host_generic.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1664993608/tprintf.o: ../tinymodules/tprintf.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1664993608 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok ${OBJECTDIR}/_ext/1664993608/tprintf.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1664993608/tprintf.o.d -o ${OBJECTDIR}/_ext/1664993608/tprintf.o ../tinymodules/tprintf.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1664993608/tprintf.o.d -o ${OBJECTDIR}/_ext/1664993608/tprintf.o ../tinymodules/tprintf.c   > ${OBJECTDIR}/_ext/1664993608/tprintf.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1664993608/tprintf.o.d > ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${CP} ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1664993608/tprintf.o.d > ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${CP} ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp ${OBJECTDIR}/_ext/1664993608/tprintf.o.d 
	@${RM} ${OBJECTDIR}/_ext/1664993608/tprintf.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1664993608/tprintf.o.ok; else cat ${OBJECTDIR}/_ext/1664993608/tprintf.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/221508487/uart2.o: ../Microchip/Common/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/221508487 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.ok ${OBJECTDIR}/_ext/221508487/uart2.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/221508487/uart2.o.d -o ${OBJECTDIR}/_ext/221508487/uart2.o ../Microchip/Common/uart2.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/221508487/uart2.o.d -o ${OBJECTDIR}/_ext/221508487/uart2.o ../Microchip/Common/uart2.c   > ${OBJECTDIR}/_ext/221508487/uart2.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/221508487/uart2.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/221508487/uart2.o.d > ${OBJECTDIR}/_ext/221508487/uart2.o.tmp
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${CP} ${OBJECTDIR}/_ext/221508487/uart2.o.tmp ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/221508487/uart2.o.d > ${OBJECTDIR}/_ext/221508487/uart2.o.tmp
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${CP} ${OBJECTDIR}/_ext/221508487/uart2.o.tmp ${OBJECTDIR}/_ext/221508487/uart2.o.d 
	@${RM} ${OBJECTDIR}/_ext/221508487/uart2.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/221508487/uart2.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/221508487/uart2.o.ok; else cat ${OBJECTDIR}/_ext/221508487/uart2.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1472/usb_config.o: ../usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.ok ${OBJECTDIR}/_ext/1472/usb_config.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/usb_config.o.d -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/usb_config.o.d -o ${OBJECTDIR}/_ext/1472/usb_config.o ../usb_config.c   > ${OBJECTDIR}/_ext/1472/usb_config.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/usb_config.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/usb_config.o.d > ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/usb_config.o.d > ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp ${OBJECTDIR}/_ext/1472/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/usb_config.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1472/usb_config.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/usb_config.o.ok; else cat ${OBJECTDIR}/_ext/1472/usb_config.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1472/PICADKMiniboard.o: ../PICADKMiniboard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1472 
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.ok ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d -o ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o ../PICADKMiniboard.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d -o ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o ../PICADKMiniboard.c   > ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d > ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d > ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${CP} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.d 
	@${RM} ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.ok; else cat ${OBJECTDIR}/_ext/1472/PICADKMiniboard.o.err; exit 1; fi
	
${OBJECTDIR}/_ext/1463451266/Adb_pic.o: ../microbridge/Adb_pic.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1463451266 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.err 
	@echo ${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d -o ${OBJECTDIR}/_ext/1463451266/Adb_pic.o ../microbridge/Adb_pic.c  
	@-${MP_CC} $(MP_EXTRA_CC_PRE)  -omf=elf -x c -c -mcpu=$(MP_PROCESSOR_OPTION) -Wall -I"../Microchip/Include" -I"../Microchip" -I"../.." -I".." -I"../C:/home/svn_unfuddle/repos/MPLAB/PIC_microbridge/firmware" -I"../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../../../USB Host - MCHPUSB - Generic Driver Demo/firmware" -I"../../../../Include" -I"../../../../Microchip/Include" -I"../microbridge" -MMD -MF ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d -o ${OBJECTDIR}/_ext/1463451266/Adb_pic.o ../microbridge/Adb_pic.c   > ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.err 2>&1  ; if [ $$? -eq 0 ] ; then touch ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok ; fi 
ifneq (,$(findstring MINGW32,$(OS_CURRENT))) 
	@sed -e 's/\"//g' -e 's/\\$$/__EOL__/g' -e 's/\\ /__ESCAPED_SPACES__/g' -e 's/\\/\//g' -e 's/__ESCAPED_SPACES__/\\ /g' -e 's/__EOL__$$/\\/g' ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d > ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${CP} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp}
else 
	@sed -e 's/\"//g' ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d > ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${CP} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.d 
	@${RM} ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.tmp
endif
	@if [ -f ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok ] ; then rm -f ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.ok; else cat ${OBJECTDIR}/_ext/1463451266/Adb_pic.o.err; exit 1; fi
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf  -mcpu=$(MP_PROCESSOR_OPTION)  -D__DEBUG -D__MPLAB_DEBUGGER_PK3=1 -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--heap=4096,--no-check-sections,-L"../C:/Program Files/Microchip/MPLAB C30/lib",-Map="$(BINDIR_)$(TARGETBASE).map",--report-mem,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__ICD2RAM=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PK3=1
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.elf: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -omf=elf  -mcpu=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.elf ${OBJECTFILES}        -Wl,--defsym=__MPLAB_BUILD=1,--heap=4096,--no-check-sections,-L"../C:/Program Files/Microchip/MPLAB C30/lib",-Map="$(BINDIR_)$(TARGETBASE).map",--report-mem,--report-mem$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION)
	${MP_CC_DIR}/pic30-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PIC_microbridge.X.${IMAGE_TYPE}.elf -omf=elf
endif


# Subprojects
.build-subprojects:

# Clean Targets
.clean-conf:
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

include .dep.inc
