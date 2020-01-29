FROM tensorflow/tensorflow:latest-gpu-py3
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:THEPASSWORDYOUCREATED' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
RUN echo PermitRootLogin yes >> /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

WORKDIR /home/usr/app/

ENV PYTHON_ROOT $HOME/local/python-$PYTHON_VERSION
ENV PATH $PYTHON_ROOT/bin:$PATH
ENV PYENV_ROOT $HOME/.pyenv
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y git 
RUN apt-get install -y make 
RUN apt-get install -y build-essential 
RUN apt-get install -y libssl-dev 
RUN apt-get install -y zlib1g-dev 
RUN apt-get install -y libbz2-dev 
RUN apt-get install -y libreadline-dev 
RUN apt-get install -y libsqlite3-dev 
RUN apt-get install -y wget
RUN apt-get install -y curl 
RUN apt-get install -y llvm 
RUN apt-get install -y libncurses5-dev 
RUN apt-get install -y libncursesw5-dev 
RUN apt-get install -y xz-utils 
RUN apt-get install -y tk-dev 
RUN apt-get install -y libffi-dev 
RUN apt-get install -y liblzma-dev
RUN apt install build-essential -y

RUN apt-get install python3.7 python-pip python3-pip python3-tk -y
RUN pip install --upgrade pip
RUN pip install --upgrade pipenv
RUN pip install git+https://github.com/pypa/pipenv.git
RUN pipenv update --pre --dev 
RUN apt install xserver-xorg -y
RUN apt-get install -y x11-apps
RUN apt-get install  xorg -y
RUN apt-get install vim -y
COPY Pipfile* ./
RUN pipenv install
