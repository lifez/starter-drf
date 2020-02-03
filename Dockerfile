FROM python:3.6

RUN pip install pipenv

RUN apt-get update && apt-get install -y netcat xfonts-thai libssl-dev

RUN curl -L#o wk.tar.xz https://downloads.wkhtmltopdf.org/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz \
    && tar xf wk.tar.xz \
    && cp wkhtmltox/bin/wkhtmltopdf /usr/bin \
    && cp wkhtmltox/bin/wkhtmltoimage /usr/bin \
    && rm wk.tar.xz \
    && rm -r wkhtmltox

ENV APPLICATION_ROOT /app/

RUN mkdir $APPLICATION_ROOT
ADD . $APPLICATION_ROOT
WORKDIR $APPLICATION_ROOT

RUN pipenv run pip install pip==18.0
RUN pipenv run pip install -r requirements.txt
