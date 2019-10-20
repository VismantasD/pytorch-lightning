FROM python:3.7-slim

RUN mkdir /root/stuff
COPY requirements.txt /root/stuff
COPY tests/requirements.txt /root/stuff/test_requirements.txt
RUN pip install -r /root/stuff/requirements.txt
RUN pip install -r ./tests/requirements.txt
COPY entrypoint.sh /entrypoint/entrypoint.sh
RUN chmod +x /entrypoint/entrypoint.sh
WORKDIR /github/workspace
ENTRYPOINT ["/entrypoint/entrypoint.sh"]
