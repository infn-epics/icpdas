#!../../bin/linux-x86_64/icpdas

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/icpdas.dbd"
icpdas_registerRecordDeviceDriver(pdbbase)

#epicsEnvSet ("STREAM_PROTOCOL_PATH", "$(TOP)/agilentXgs600App/protocol")



#drvAsynIPPortConfigure ("MOXA1","192.168.190.55:4002",0,0,0)
drvAsynIPPortConfigure("ICPDAS_IP", "ddcgicp006.lnf.infn.it:502", 0, 0, 0)
modbusInterposeConfig("ICPDAS_IP",0,0,0)

 drvModbusAsynConfigure("PORT", "ICPDAS_IP", 1, 4, 0, 7, 0, 1000, "ICPDAS7215")

drvModbusAsynConfigure("PORT_MIN", "ICPDAS_IP", 1, 4, 268, 7, 0, 1000, "ICPDAS7215")
## Read Input Registers MAX histo
drvModbusAsynConfigure("PORT_MAX", "ICPDAS_IP", 1, 4, 236, 7, 0, 1000, "ICPDAS7215")
#read once or epics events
drvModbusAsynConfigure("PORT_INFO", "ICPDAS_IP", 1, 4, 350, 4, 0,10000, "ICPDAS7215")


dbLoadRecords("$(TOP)/db/icp7215.db","P=ICPDAS,R=Test7267,PORT=PORT,PORTMAX=PORT_MAX,  PORTMIN=PORT_MIN,PORTINFO=PORT_INFO")
dbLoadRecords("$(TOP)/db/icprtdsensor.template","P=ICPDAS,R=Test7267,PORT=PORT,PORTMAX=PORT_MAX, ID=CICCIO, REGOFFSET=0,PORTMIN=PORT_MIN,PORTINFO=PORT_INFO")


iocInit()

