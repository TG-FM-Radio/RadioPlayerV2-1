FROM python:latest

ENV VIRTUAL_ENV "/venv"
RUN python -m venv $VIRTUAL_ENV
ENV PATH "$VIRTUAL_ENV/bin:$PATH"

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y ffmpeg opus-tools bpm-tools
RUN python -m pip install --upgrade pip
RUN python -m pip install wheel tgintegration psutil
RUN python -m pip install pytgcalls[pyrogram] TgCrypto ffmpeg-python
RUN python -m pip install youtube-dl youtube_search requests

RUN wget -q https://github.com/AsmSafone/RadioPlayerV2/archive/safone.tar.gz && tar xf safone.tar.gz && rm safone.tar.gz

WORKDIR /RadioPlayerV2-safone
CMD python3 main.py

# docker build -t tgcalls .
# docker run -it --rm --env-file ./envfile --name tgvc-userbot tgcalls
