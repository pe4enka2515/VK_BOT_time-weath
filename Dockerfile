FROM python:3

RUN apt-get update && \
    apt-get install -y locales && \
    sed -i -e 's/# ru_RU.UTF-8 UTF-8/ru_RU.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales


COPY /VK_BOT /VK_BOT
WORKDIR /VK_BOT
RUN pip install -r requirements.txt
CMD ["python", "VK_BOT.py"]
