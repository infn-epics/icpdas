#!../../bin/linux-x86_64/icpdas

< envPaths

## Register all support components
dbLoadDatabase "../../dbd/icpdas.dbd"
icpdas_registerRecordDeviceDriver(pdbbase)


drvAsynIPPortConfigure("ICPDAS_IP", "ddcgicp12di6do002.lnf.infn.it:502", 0, 0, 0)
modbusInterposeConfig("ICPDAS_IP",0,0,0)

drvModbusAsynConfigure("ICP_DI", "ICPDAS_IP", 1, 2, 0, 12,   0,1000, "ICPDAS7250")
drvModbusAsynConfigure("ICP_DICNT", "ICPDAS_IP", 1, 4, 16,24, 5,1000, "ICPDAS7250")
drvModbusAsynConfigure("ICP_DO", "ICPDAS_IP", 1, 5, 0, 6, 0, 1000, "ICPDAS7250")

drvModbusAsynConfigure ("ICP_info_port", "ICPDAS_IP", 1, 4, 150, 4, 0, 1000, "ICPDAS7250")



#dbLoadRecords("$(TOP)/db/icp7250.db","P=ICPDAS,R=Test7250,DIPORT=ICP_DI,CNTPORT=ICP_DICNT,DOPORT=ICP_DO, PORTINFO=ICP_info_port")

dbLoadRecords("$(TOP)/db/icpdi.template","P=ICPDAS,R=Test7267,PORT=ICP_DI,PORTCNT=ICP_DICNT, ID=0,IDX2=0")
dbLoadRecords("$(TOP)/db/icpdo.template","P=ICPDAS,R=Test7267,PORT=ICP_DO, ID=0")
dbLoadRecords("$(TOP)/db/icpdasVersion.template","P=ICPDAS,R=Test7267, PORT=ICP_info_port")


iocInit()

