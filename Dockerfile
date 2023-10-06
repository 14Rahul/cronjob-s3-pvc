#docker build --build-arg tenant=value .

FROM ubuntu:20.04
FROM python:3.8
ARG tenant

RUN mkdir /s3-cleanup-scripts
RUN groupadd s3User
RUN useradd -g s3User -d /s3-cleanup-scripts -s /bin/bash -m s3User
RUN chown -R s3User:s3User /s3-cleanup-scripts

RUN mkdir /mnt/data/
RUN chown -R s3User:s3User /mnt/data/
RUN chmod 755 /mnt/data

WORKDIR /s3-cleanup-scripts

COPY ./requirements.txt /s3-cleanup-scripts/requirements.txt
RUN pip3 install -r /s3-cleanup-scripts/requirements.txt

#COPY . /s3-cleanup-scripts/
COPY --chown=s3User:s3User ./scripts/* /s3-cleanup-scripts/
USER s3User
