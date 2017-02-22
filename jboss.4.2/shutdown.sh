#!/bin/bash
#Script de finalización de Jboss 4.2.2
#
. ./shutdown.conf

export PATH=$JAVA_HOME/bin:$PATH

#echo JBOSS_DIR=${JBOSS_DIR}
#echo JAVA_HOME=${JAVA_HOME}
#echo PATH=${PATH}

echo "Este comando ejecuta una finalización segura del servidor Jboss 4.2.2"
echo "El proceso puede tardar varios minutos dependiendo de la carga que tenga el servidor"
echo -n "Desea bajar jboss 4.2.2 levantado en este servidor S/N? [N]: "
read _continue

if [[ "$_continue" == *[Ss]* ]]; then
    error_count=`${JBOSS_DIR}/bin/shutdown.sh -S 2>&1>/dev/null | grep 'Failed to connect to server' | wc -l`

    if [ $error_count -eq 0 ] 
    then 
        echo "Se ha solicitado la finalización del proceso del servidor jboss ${JBOSS_DIR}."
        echo "El proceso de finalización puede tardar varios minutos."
        echo "Verifique el resultado de esta solicitud en el log del servidor."
    else
        echo "Jboss no se encontraba en ejecución, no se realizó ninguna acción"
    fi
else
    echo "No se ha realizado ninguna acción."
fi
