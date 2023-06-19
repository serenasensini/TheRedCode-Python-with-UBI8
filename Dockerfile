FROM registry.access.redhat.com/ubi8/ubi

RUN yum install -y python3.11-pip-wheel  python3.11-wheel python3.11-pip;

WORKDIR /app

COPY ./requirements.txt ./app ./

RUN mkdir -p /.local; \
    chown -R 1001:0 /.local; \
    chmod -R ug+rwX /.local; \
	pip3 install -r requirements.txt; 

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]