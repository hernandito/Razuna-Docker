CATALINA_OPTS="$CATALINA_OPTS -server -Xss1M -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -Djava.awt.headless=true -Dorg.apache.jasper.runtime.BodyContentImpl.LIMIT_BUFFER=true -Dmail.mime.decodeparameters=true -XX:+PrintGCDateStamps -XX:-OmitStackTraceInFastThrow -Djava.security.egd=file:/dev/./urandom"

# Perm Gen size needs to be increased if encountering OutOfMemoryError: PermGen problems. Specifying PermGen size is not valid on IBM JDKs

PRGDIR=`dirname $0`
RAZUNA_MAX_PERM_SIZE=512m
if [ -f "${PRGDIR}/permgen.sh" ]; then
    echo "Detecting JVM PermGen support..."
    . ${PRGDIR}/permgen.sh
    if [ $JAVA_PERMGEN_SUPPORTED = "true" ]; then
        echo "PermGen switch is supported. Setting to ${RAZUNA_MAX_PERM_SIZE}"
        CATALINA_OPTS="-XX:PermSize=${RAZUNA_MAX_PERM_SIZE} -XX:MaxPermSize=${RAZUNA_MAX_PERM_SIZE} ${CATALINA_OPTS}"
    else
        echo "PermGen switch is NOT supported and will NOT be set automatically."
    fi
fi

export CATALINA_OPTS

