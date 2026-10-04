FROM b4bz/homer:latest

# Instalar soporte para scripts de ejecución de Home Assistant
RUN apk add --no-cache bash

# Configurar el script ejecutable
COPY run.sh /run.sh
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
