#!../../bin/linux-x86_64/AMI1800

## You may have to change AMI1800 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/AMI1800.dbd"
AMI1800_registerRecordDeviceDriver pdbbase

# Define protocol path
epicsEnvSet("STREAM_PROTOCOL_PATH", "$(AMI1800)/protocol")


#AMI1800
asynSetAutoConnectTimeout(1.0)
drvAsynIPPortConfigure( "AMI1800One", "10.112.128.40:7180 tcp", 0, 0, 0 )


## Load record instances
#dbLoadRecords("db/xxx.db","user=zmaHost")
dbLoadRecords("db/AMI18001.db")




cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncxxx,"user=zmaHost"
