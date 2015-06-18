rem Note: If you run Tomcat as a Service, settings in this file have no effect

set JAVA_OPTS=%JAVA_OPTS% -server -Xms1024m -Xmx1024m -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -Djava.awt.headless=true -Dorg.apache.jasper.runtime.BodyContentImpl.LIMIT_BUFFER=true -Dmail.mime.decodeparameters=true -XX:+PrintGCDateStamps -XX:-OmitStackTraceInFastThrow

rem Checks if the JAVA_HOME has a space in it (can cause issues)

SET _marker=%JAVA_HOME: =%
IF NOT "%_marker%" == "%JAVA_HOME%" ECHO JAVA_HOME "%JAVA_HOME%" contains spaces. Please change to a location without spaces if this causes problems.
