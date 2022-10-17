FROM python:3.10
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /TareaAltaDisp

RUN python -m venv .env
# Se Activa el .env
ENV PATH="/.env/bin:$PATH"
#Se copian los requerimientos para poder ser instalados con pip
COPY requirements.txt /TareaAltaDisp/requirements.txt
RUN pip install -Ur requirements.txt
#Se copia el djang-backend a /TareaAltaDisp
COPY . /TareaAltaDisp/