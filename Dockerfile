FROM python:3.10

# RUN pip install pgsync
RUN pip install pgsync==2.4.0

ENV PYTHONPATH "/usr/local"
ADD schema.json schema.json
ADD entrypoint.sh entrypoint.sh

ENTRYPOINT ["sh", "entrypoint.sh"]
