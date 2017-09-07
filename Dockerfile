FROM continuumio/anaconda3:4.4.0 
LABEL maintainer="Alexander Panin <justheuristic@gmail.com>"
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y htop unzip cmake zlib1g-dev libjpeg-dev xvfb libav-tools xorg-dev \
    python-opengl libav-tools swig psmisc

RUN conda install pytorch torchvision=0.1.8 -c soumith

RUN pip install --upgrade --ignore-installed setuptools
# #RUN pip install --upgrade pip==9.0.1
RUN pip install --upgrade tensorflow==1.2.0
RUN pip install --upgrade keras==2.0.6
RUN pip install --upgrade nltk==3.2.4
RUN pip install h5py==2.7.0
RUN pip install opencv-python==3.3.0.9
RUN pip install --upgrade https://github.com/Theano/Theano/archive/1271c0bc0d00fdcd7ad447fd2cad99b4b32fb676.zip
RUN pip install --upgrade https://github.com/Lasagne/Lasagne/archive/ed79bc4e379c82e3c25cff68b8dd4f17a371c314.zip
RUN pip install --upgrade https://github.com/yandexdataschool/AgentNet/archive/c2a5c58612596640a6bb8726dcb01981b0c14d6b.zip
RUN conda install -c conda-forge ffmpeg
RUN conda install tqdm
# RUN pip install --upgrade http://download.pytorch.org/whl/cu75/torch-0.1.12.post2-cp27-none-linux_x86_64.whl
# RUN pip install --upgrade torchvision

# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade --ignore-installed setuptools
# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade pip==9.0.1
# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade tensorflow==1.2.0
# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade keras==2.0.6
# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade nltk==3.2.4
# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade https://github.com/Theano/Theano/archive/1271c0bc0d00fdcd7ad447fd2cad99b4b32fb676.zip
# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade https://github.com/Lasagne/Lasagne/archive/ed79bc4e379c82e3c25cff68b8dd4f17a371c314.zip
# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade https://github.com/yandexdataschool/AgentNet/archive/c2a5c58612596640a6bb8726dcb01981b0c14d6b.zip
# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade http://download.pytorch.org/whl/cu75/torch-0.1.12.post2-cp35-cp35m-linux_x86_64.whl
# RUN /home/main/anaconda/envs/python3/bin/pip install --upgrade torchvision

RUN useradd -m learner
USER learner
WORKDIR /home/learner
EXPOSE 8080
CMD ["jupyter", "notebook", "--no-browser", "--port", "8080", "--ip", "0.0.0.0"]

