FROM ghcr.io/karakeep-app/karakeep:release

ENV DATA_DIR="/share/karakeep"
ENV PORT="3000"

# Al arrancar, genera una clave única en memoria y lanza Karakeep
CMD export NEXTAUTH_SECRET=$(openssl rand -base64 32) && yarn start
