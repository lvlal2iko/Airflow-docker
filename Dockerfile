FROM apache/airflow:master-python3.8
LABEL maintainer "Apisit"
USER root

RUN sudo apt update && sudo apt install nodejs npm -y && \
    npm install elasticdump -g && \
    sudo apt-get install -y unzip vim && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64-2.0.30.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    sudo ./aws/install
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
