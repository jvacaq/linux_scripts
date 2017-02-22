#!/bin/bash
#Script de finalización de Jboss-eap-6.4
#
. ./shutdown.conf

export PATH=$JAVA_HOME/bin:$PATH

#echo JBOSS_DIR=${JBOSS_DIR}
#echo JAVA_HOME=${JAVA_HOME}
#echo PATH=${PATH}

echo "Este comando ejecuta una finalización segura del servidor Jboss-eap 6.4.  El proceso puede tardar varios minutos dependiendo de la carga que tenga el servidor"
error_count=`${JBOSS_DIR}/bin/jboss-cli.sh --connect command=shutdown 2>&1>/dev/null|grep 'Failed to connect to the controller'|wc -l`

if [ $error_count -eq 0 ] 
then 
    echo "Se ha solicitado la finalización del proceso del servidor jboss ${JBOSS_DIR}. El proceso de finalización puede tardar varios minutos.  Verifique el resultado de esta solicitud en el log del servidor"
else
    echo "Jboss no se encuentra en ejecución"
fi
