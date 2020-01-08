FROM ubuntu:latest
RUN mkdir /home/app
RUN apt-get update && apt-get install -y vim g++ gcc build-essential zsh wget git curl \
     maven nodejs npm pkg-config libncurses5-dev libncursesw5-dev python3 python3-pip software-properties-common openjdk-8-jdk
RUN apt-get upgrade update
RUN npm install -g nodemon gulp-cli
RUN chsh -s /usr/bin/zsh root
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
WORKDIR /home/app

#docker build -t brandonsetup .
#docker run -dit -P -p 5000:8080 -v $PWD:/home/app brandonsetup
#su