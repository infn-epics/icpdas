TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

# Use typed rset structure (see 3.16.1 release notes)
USR_CPPFLAGS += -DUSE_TYPED_RSET

# Build an IOC support library
# LIBRARY_IOC += icpdasSupport

# Link locally-provided code into the support library,
# rather than directly into the IOC application, that
# causes problems on Windows DLL builds
#icpdasSupport_SRCS += dbSubExample.c
#icpdasSupport_SRCS += devicpdasVersion.c
#icpdasSupport_SRCS += icpdasHello.c
#icpdasSupport_SRCS += initTrace.c

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
icpdas_DBD += modbusSupport.dbd
icpdas_DBD += asyn.dbd
icpdas_DBD += drvAsynIPPort.dbd
icpdas_SRCS += icpdas_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
icpdas_SRCS_DEFAULT += icpdasMain.cpp
icpdas_SRCS_vxWorks += -nil-

# Link in the code from our support library
icpdas_LIBS += asyn
icpdas_LIBS += modbus
# To build SNL programs, SNCSEQ must be defined
# in the <top>/configure/RELEASE file

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
