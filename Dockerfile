FROM shikari11/29dec2022:latest

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt -qq update --fix-missing && \
    apt -qq install -y \
    mediainfo

RUN apt install wget unzip -y

RUN wget -O config.env https://github.com/Botmirror69/telestreamer/raw/heroku/config.env
RUN wget -O token.pickle https://github.com/MirroBot6996/mirror-leech-telegram-bot/blob/heroku/token.pickle?raw=true
RUN wget https://raw.githubusercontent.com/Botmirror69/slam-mirrorbot/master/accounts.zip

RUN unzip accounts.zip -d accounts/

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt
RUN apt-get update && apt-get upgrade -y

CMD ["bash", "start.sh"]
