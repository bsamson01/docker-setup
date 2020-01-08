FROM ubuntu:latest
RUN mkdir /home/app
RUN apt-get update && apt-get install -y vim g++ gcc build-essential zsh wget git curl \
     maven pkg-config libncurses5-dev libncursesw5-dev python3 python3-pip software-properties-common
RUN apt-get upgrade -y
RUN apt-get update -y

# node setup
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash
RUN export NVM_DIR="$HOME/.nvm" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
RUN command -v nvm
RUN nvm install node

RUN npm install -g nodemon gulp-cli
RUN chsh -s /usr/bin/zsh root

# oh-myzsh setup
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# java setup
RUN wget --no-check-certificate -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/13.0.1+9/cec27d702aa74d5a8630c65ae61e4305/jdk-13.0.1_linux-x64_bin.tar.gz
RUN mkdir /usr/lib/jvm
RUN tar -xvzf /home/app/jdk-13.0.1_linux-x64_bin.tar.gz -C /usr/lib/jvm
RUN export PATH="$PATH:/usr/lib/jvm/jdk-13.0.1/bin"
RUN export JAVA_HOME="/usr/lib/jvm/jdk-13.0.1"
RUN update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/jdk-13.0.1/bin/java" 0 
RUN update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/jdk-13.0.1/bin/javac" 0 
RUN update-alternatives --set java /usr/lib/jvm/jdk-13.0.1/bin/java
RUN update-alternatives --set javac /usr/lib/jvm/jdk-13.0.1/bin/javac
RUN update-alternatives --list java
RUN update-alternatives --list javac

RUN java -version
RUN node -v
RUN npm -v
WORKDIR /home/app

#docker build -t docker-setup .
#docker run -dit -P -p 5000:8080 -v $PWD:/home/app docker-setup
#su

