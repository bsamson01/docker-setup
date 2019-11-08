FROM ubuntu:latest
RUN mkdir /home/app
RUN apt-get update && apt-get install -y vim g++ x11-apps gcc build-essential zsh wget git curl \
     maven nodejs npm pkg-config libncurses5-dev libncursesw5-dev \
     xorg openbox xauth xserver-xorg-core xserver-xorg xorg openbox \
     ubuntu-desktop kde-plasma-desktop slim lightdm tasksel \
     software-properties-common apt-transport-https code
RUN apt-get upgrade
RUN npm install -g nodemon gulp-cli
RUN chsh -s /usr/bin/zsh root
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
WORKDIR /home/app
RUN tasksel install lubuntu-core
RUN service slim start

#docker build -t ubuntu .
#docker run -dit -P -p 5000:8080 -v $PWD:/home/app ubuntu
#su