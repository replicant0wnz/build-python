FROM python:3.9-slim-bullseye

RUN pip3 install \ 
    pyyaml \
    boto3 \
    pytest \
    build \
    black \
    twine
