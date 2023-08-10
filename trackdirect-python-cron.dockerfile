FROM ubuntu:20.04
RUN apt-get update && apt-get install -y \
  python3 \
  python3-dev \
  python3-pip \
  python-is-python3 \
  git \
  cron \
  && rm -rf /var/lib/apt/lists/*

COPY . /root/trackdirect

RUN pip install -r /root/trackdirect/requirements.txt
RUN crontab /root/trackdirect/server/scripts/trackdirect-cron
CMD cron -f -L 15
