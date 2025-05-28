#!../../bin/linux-x86_64/icpdas

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/icpdas.dbd"
icpdas_registerRecordDeviceDriver(pdbbase)


drvAsynIPPortConfigure("ICPDAS_IP", "192.168.104.62:502", 0, 0, 0)
modbusInterposeConfig("ICPDAS_IP",0,0,0)

drvModbusAsynConfigure ("ICP_get_port", "ICPDAS_IP", 1, 1, 0,  6, 0, 1000, "ICPDAS7026")
drvModbusAsynConfigure ("ICP_set_port", "ICPDAS_IP", 1, 5, 0,  6, 0, 1000, "ICPDAS7026")

drvModbusAsynConfigure("RANGE_MAX_RB", "ICPDAS_IP", 1, 6, 459, 6, 0, 1000, "ICPDAS7026")
drvModbusAsynConfigure("RANGE_MIN_RB", "ICPDAS_IP", 1, 6, 427, 6, 0, 1000, "ICPDAS7026")



drvModbusAsynConfigure ("ICP_info_port", "ICPDAS_IP", 1, 4, 150, 4, 0, 1000, "ICPDAS")



dbLoadRecords("$(TOP)/db/icp7026.db","P=ICPDAS, R=Test7026, get_port=ICP_get_port, set_port=ICP_set_port, PORTMIN=RANGE_MIN_RB, PORTMAX=RANGE_MAX_RB, PORTINFO=ICP_info_port, PORT=ICP_info_port")


iocInit()
