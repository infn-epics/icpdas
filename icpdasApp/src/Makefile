TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# xxxRecord.h will be created from xxxRecord.dbd
DBDINC += xxxRecord

# Install xxxSupport.dbd into <top>/dbd
DBD += xxxSupport.dbd

# Build an IOC support library
LIBRARY_IOC += icpdasSupport

# Compile and add code to the support library
icpdasSupport_SRCS += xxxRecord.c
icpdasSupport_SRCS += devXxxSoft.c

# Link locally-provided code into the support library,
# rather than directly into the IOC application, that
# causes problems on Windows DLL builds
icpdasSupport_SRCS += dbSubExample.c
icpdasSupport_SRCS += devicpdasVersion.c
icpdasSupport_SRCS += icpdasHello.c
icpdasSupport_SRCS += initTrace.c

icpdasSupport_LIBS += $(EPICS_BASE_IOC_LIBS)

# Auto-generate a header file containing a version string.
# Version comes from the VCS if available, else date+time.
GENVERSION = icpdasVersion.h
# Macro name
GENVERSIONMACRO = icpdasVERSION

# Build the IOC application
PROD_IOC = icpdas

# icpdas.dbd will be created and installed
DBD += icpdas.dbd

# icpdas.dbd will include these files:
icpdas_DBD += base.dbd
icpdas_DBD += xxxSupport.dbd
icpdas_DBD += dbSubExample.dbd
icpdas_DBD += devicpdasVersion.dbd
icpdas_DBD += icpdasHello.dbd
icpdas_DBD += initTrace.dbd

# icpdas_registerRecordDeviceDriver.cpp derives from icpdas.dbd
icpdas_SRCS += icpdas_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
icpdas_SRCS_DEFAULT += icpdasMain.cpp
icpdas_SRCS_vxWorks += -nil-

# Link in the code from our support library
icpdas_LIBS += icpdasSupport

# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file
ifneq ($(SNCSEQ),)
    # Build sncExample into icpdasSupport
    sncExample_SNCFLAGS += +r
    icpdas_DBD += sncExample.dbd
    # A .stt sequence program is *not* pre-processed:
    icpdasSupport_SRCS += sncExample.stt
    icpdasSupport_LIBS += seq pv
    icpdas_LIBS += seq pv

    # Build sncProgram as a standalone program
    PROD_HOST += sncProgram
    sncProgram_SNCFLAGS += +m
    # A .st sequence program *is* pre-processed:
    sncProgram_SRCS += sncProgram.st
    sncProgram_LIBS += seq pv
    sncProgram_LIBS += $(EPICS_BASE_HOST_LIBS)
endif

# Link QSRV (pvAccess Server) if available
ifdef EPICS_QSRV_MAJOR_VERSION
    icpdas_LIBS += qsrv
    icpdas_LIBS += $(EPICS_BASE_PVA_CORE_LIBS)
    icpdas_DBD += PVAServerRegister.dbd
    icpdas_DBD += qsrv.dbd
endif

# Finally link IOC to the EPICS Base libraries
icpdas_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

# Explicit dependency needed for generated header file
devicpdasVersion$(DEP): $(COMMON_DIR)/$(GENVERSION)
