FROM python:3.8
EXPOSE 5000

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

COPY requirements.txt /app/

WORKDIR /app
RUN pip3 install -r requirements.txt --no-cache-dir 

COPY *.py /app/
COPY amz_captcha_model*.* /app/

CMD python solve_api.py