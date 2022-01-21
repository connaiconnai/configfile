FROM ubuntu:latest

RUN apt-get update  && apt-get install git -y && apt-get install vim -y && apt-get install tmux -y && apt-get install fish -y 
RUN apt-get install -y fonts-powerline &&  apt-get install -y python3 && apt-get install -y curl && apt-get install -y peco && apt-get install -y ghq



