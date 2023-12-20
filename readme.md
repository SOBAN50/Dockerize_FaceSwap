Dockerize_FaceSwap
I have dockerized Deepfake's Faceswap software so that there are no dependency issues. The CPU mode has been used for this.

To run it You firt have to downlaod 2 models:
- Download [s3fd_keras_v2.h5](https://github.com/deepfakes-models/faceswap-models/releases/download/v11.2/s3fd_keras_v2.zip) and save if it as 'faceswap/.facache/s3fd_keras_v2.h5'
- Downlaod [face-alignment-network_2d4_keras_v2.h5](https://github.com/deepfakes-models/faceswap-models/releases/download/v13.2/face-alignment-network_2d4_keras_v2.zip) and save if it as 'faceswap/.facache/face-alignment-network_2d4_keras_v2.h5'

Otherwise I have also pushed the Docker image for this on dockerhub here: [faceswap_extract_face_api](https://hub.docker.com/repository/docker/soban5056/faceswap_extract_face_api)