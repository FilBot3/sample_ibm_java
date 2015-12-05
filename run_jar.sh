#!/bin/bash
#
#
#

JAVA_OPTS="-jar -Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.port=1099 -Dcom.sun.management.jmxremote.local.only=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.ssl=false"
JAVA_EXE="java"
JAVA_BIN="./build/jars/HelloWorld.jar"

$JAVA_EXE $JAVA_OPTS $JAVA_BIN &

