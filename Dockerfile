FROM python:3.7-slim

RUN mkdir /root/stuff
COPY requirements.txt /root/stuff
COPY tests/requirements.txt /root/stuff/test_requirements.txt
SHELL ["/bin/bash", "-c"]
RUN pip install virtualenv
RUN virtualenv -p python3 ~/venv
RUN source ~/venv/bin/activate
RUN source ~/venv/bin/activate && pip install -r /root/stuff/requirements.txt
RUN source ~/venv/bin/activate && pip install -r /root/stuff/test_requirements.txt
COPY entrypoint.sh /entrypoint/entrypoint.sh
RUN chmod +x /entrypoint/entrypoint.sh
WORKDIR /github/workspace
ENTRYPOINT ["/entrypoint/entrypoint.sh"]
