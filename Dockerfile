FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Vienna
RUN apt update && apt install --no-install-recommends -y \
    tzdata \
    python3 \
    python3-absl \
    python3-astunparse \
    python3-flatbuffers \
    python3-gast \
    python3-grpcio \
    python3-html5lib \
    python3-joblib \
    python3-matplotlib \
    python3-numpy \
    python3-markdown \
    python3-markdown-it \
    python3-requests \
    python3-scipy \
    python3-soupsieve \
    python3-tk \
    python3-pandas \
    python3-peewee \
    python3-pip \
    python3-platformdirs \
    python3-prometheus-client \
    python3-protobuf \
    python3-pygments \
    python3-rich \
    python3-setuptools \
    python3-termcolor \
    python3-threadpoolctl \
    python3-webencodings \
    python3-werkzeug \
    python3-wrapt \
    python3-yaml \
    libx11-6 \
    xterm \
    pyflakes3 \
    pylama \
    pylint \
    flake8 \
    vim

WORKDIR /usr/src/app
## install python modules
# COPY ./build/requirements.txt ./
RUN pip3 install --break-system-packages --disable-pip-version-check --no-cache-dir keras
RUN pip3 install --break-system-packages --disable-pip-version-check --no-cache-dir tensorflow
# RUN pip3 install --break-system-packages --disable-pip-version-check --no-cache-dir pandas
RUN pip3 install --break-system-packages --disable-pip-version-check --no-cache-dir scikit-learn
# RUN pip3 install --break-system-packages --disable-pip-version-check --no-cache-dir matplotlib
# RUN pip3 install --break-system-packages --disable-pip-version-check --no-cache-dir yfinance
# RUN pip3 install --break-system-packages --disable-pip-version-check --no-cache-dir atproto
# to access mikrotik router OS
RUN pip3 install --break-system-packages --disable-pip-version-check --no-cache-dir librouteros
RUN pip3 freeze
# this changes very often so put it at the end of the main section

# as of ubuntu:24.04 there is a ubuntu user preinstalled
USER ubuntu
CMD ["python3", "-u", "/usr/src/app/main.py"]
