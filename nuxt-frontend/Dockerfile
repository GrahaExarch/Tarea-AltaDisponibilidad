FROM node:12.22.12

WORKDIR /TareaAltaDisp

COPY . /TareaAltaDisp/
#Se instalan los requerimientos de Vue y Nuxt
RUN npm install
#Se expone el puerto 3000 para que se puedan conectar entre Containers
EXPOSE 3000
#Se define la variable de entorno del HOST y su puerto
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
#Comando para correr la aplicacion en modo dev
CMD [ "npm", "run", "dev" ]