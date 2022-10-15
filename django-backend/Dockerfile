FROM python:3.10
ENV PYTHONDONTWRITEBYTECODE 1

WORKDIR /TareaAltaDisp

RUN python -m venv .env
# Enable venv
ENV PATH="/.env/bin:$PATH"

COPY requirements.txt /TareaAltaDisp/requirements.txt
RUN pip install -Ur requirements.txt

COPY . /TareaAltaDisp/