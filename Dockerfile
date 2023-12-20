# FROM ubuntu:22.04

# ENV DEBIAN_FRONTEND=noninteractive
# ARG GEOGRAPHICAL_AREA="Asia"
# RUN apt-get update && apt-get install -y software-properties-common && rm -rf /var/lib/apt/lists/*
# RUN add-apt-repository -y ppa:deadsnakes/ppa
# RUN apt-get update && apt-get install -y python3.9 python3.9-dev python3-pip && rm -rf /var/lib/apt/lists/*
# RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1
# RUN apt install python3-pip

# RUN apt update
# RUN apt-get update
# RUN apt install -y git

# RUN git clone https://github.com/deepfakes/faceswap.git

# RUN apt-get install python-distutils
# RUN apt-get install python-apt

# RUN pip install -r faceswap/requirements/requirements_cpu.txt

# COPY main.py /
# COPY test.py /

# CMD [ "uvicorn", "main:app", "--host", "0.0.0.0" ]

#============================================================================================

FROM python:3.10.13

WORKDIR /

RUN apt update
RUN apt-get update

COPY _requirements_base.txt /
COPY requirements_cpu.txt /
RUN pip install -r requirements_cpu.txt
RUN pip install fastapi[all]
RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

COPY faceswap /faceswap

COPY faceswap/main.py faceswap/
COPY faceswap/test.py faceswap/

WORKDIR /faceswap

CMD [ "uvicorn", "main:app", "--host", "0.0.0.0" ]


# # Install system dependencies (required for OpenCV)
# RUN apk --update --no-cache add build-base cmake jpeg-dev zlib-dev libjpeg-turbo-dev libpng-dev linux-headers

# # Install OpenCV dependencies
# RUN pip install numpy

# # Build and install OpenCV from source
# RUN apk --update --no-cache add --virtual .build-deps \
#         git \
#         && git clone --depth 1 https://github.com/opencv/opencv.git \
#         && mkdir -p opencv/build \
#         && cd opencv/build \
#         && cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_DOCS=OFF -DBUILD_EXAMPLES=OFF -DBUILD_opencv_python2=OFF -DBUILD_opencv_python3=ON -DWITH_FFMPEG=OFF .. \
#         && make -j$(nproc) \
#         && make install \
#         && cd / \
#         && rm -rf opencv \
#         && apk del .build-deps

# Install scikit-learn using apk
# RUN apk --update --no-cache add py3-scikit-learn