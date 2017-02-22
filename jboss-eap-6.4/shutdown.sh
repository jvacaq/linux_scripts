#!/bin/bash
#Script de finalización de Jboss-eap-6.4
#
. ./shutdown.conf

export PATH=$JAVA_HOME/bin:$PATH

#echo JBOSS_DIR=${JBOSS_DIR}
#echo JAVA_HOME=${JAVA_HOME}
#echo PATH=${PATH}

echo "Este comando ejecuta una finalización segura del servidor Jboss-eap 6.4."
echo "El proceso puede tardar varios minutos dependiendo de la carga que tenga el servidor"

read -p "Desea iniciar el proceso de finalización de jboss-eap 6.4 que se ejecuta en este servidor S/N? [N]: " _continue

if [[ "$_continue" == *[Ss]* ]]; then
    error_count=`${JBOSS_DIR}/bin/jboss-cli.sh --connect command=shutdown 2>&1>/dev/null|grep 'Failed to connect to the controller'|wc -l`

    if [ $error_count -eq 0 ] 
    then 
        echo "Se ha solicitado la finalización del proceso del servidor jboss ${JBOSS_DIR}."
        echo "El proceso de finalización puede tardar varios minutos."
        echo "Verifique el resultado de esta solicitud en el log del servidor"
    else
        echo "Jboss no se encuentra en ejecución"
    fi
else
    echo "No se realizó ninguna acción."
fi

