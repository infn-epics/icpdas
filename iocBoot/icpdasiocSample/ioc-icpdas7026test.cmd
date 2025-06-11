#!../../bin/linux-x86_64/icpdas

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/icpdas.dbd"
icpdas_registerRecordDeviceDriver(pdbbase)


drvAsynIPPortConfigure("ICPDAS_IP", "192.168.104.62:502", 0, 0, 0)
modbusInterposeConfig("ICPDAS_IP",0,0,0)

drvModbusAsynConfigure ("ICP_get_port", "ICPDAS_IP", 1, 1, 0,  6, 0, 1000, "ICPDAS7026")
drvModbusAsynConfigure ("ICP_set_port", "ICPDAS_IP", 1, 5, 0,  6, 0, 1000, "ICPDAS7026")

drvModbusAsynConfigure("RANGE_OUT", "ICPDAS_IP", 1, 6, 459, 2, 0, 1000, "ICPDAS7026")
drvModbusAsynConfigure("RANGE_IN", "ICPDAS_IP", 1, 6, 427, 6, 0, 1000, "ICPDAS7026")
drvModbusAsynConfigure("DO_OUTPUT", "ICPDAS_IP", 1, 5, 0, 2, 0, 1000, "ICPDAS7026")
drvModbusAsynConfigure("DI_OUTPUT", "ICPDAS_IP", 1, 2, 0, 2, 0, 1000, "ICPDAS7026")
drvModbusAsynConfigure("PORTMIN", "ICPDAS_IP", 1, 3, 0, 6, 0, 1000, "ICPDAS7026")



dbLoadRecords("$(TOP)/db/icp7026.db","P=ICPDAS, R=Test7026, get_port=ICP_get_port, set_port=ICP_set_port, PORTRANGEIN=RANGE_IN, PORTRANGEOUT=RANGE_OUT, PORTINFO=ICP_info_port,DOPORT=DO_OUTPUT,CNTPORT=DI_OUTPUT, PORTMIN=PORTMIN")


iocInit()
dbl 
