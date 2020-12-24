FROM python:3.6

MAINTAINER bitfly <ddag6714@gmail.com>

RUN apt-get update 

RUN mkdir home/mom_site


COPY ./mom_site/ /home/mom_site/
WORKDIR home/mom_site/app

RUN pip install -r requirements.txt
ENTRYPOINT ["gunicorn", "--bind", "0.0.0.0:8000", "app.wsgi:application"]
