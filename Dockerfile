FROM python:3.9-alpine

RUN apk --no-cache add bash
RUN pip3 install \ 
    pyyaml \
    boto3 \
    pytest \
    build \
    twine \
    black
