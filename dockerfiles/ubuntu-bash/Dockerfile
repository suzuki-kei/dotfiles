#-------------------------------------------------------------------------------
# base image - install and setup OS packages only
#-------------------------------------------------------------------------------

FROM ubuntu:24.10 AS base

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update
RUN apt install -y unminimize
RUN yes | unminimize

RUN apt install -y apache2
RUN apt install -y apt-file
RUN apt install -y bash-completion
RUN apt install -y bc
RUN apt install -y curl
RUN apt install -y dnsutils
RUN apt install -y figlet
RUN apt install -y git
RUN apt install -y iputils-ping
RUN apt install -y jc
RUN apt install -y jq
RUN apt install -y knot-dnsutils
RUN apt install -y less
RUN apt install -y make
RUN apt install -y man
RUN apt install -y moreutils
RUN apt install -y net-tools
RUN apt install -y nkf
RUN apt install -y nodejs
RUN apt install -y npm
RUN apt install -y num-utils
RUN apt install -y php
RUN apt install -y plocate
RUN apt install -y pwgen
RUN apt install -y python3
RUN apt install -y python3-pip
RUN apt install -y rlwrap
RUN apt install -y ruby
RUN apt install -y rustc
RUN apt install -y sysstat
RUN apt install -y tig
RUN apt install -y tldr
RUN apt install -y tree
RUN apt install -y vim
RUN apt install -y wget

RUN apt upgrade
RUN apt dist-upgrade
RUN apt clean
RUN apt autoremove

# apt-file
RUN apt-file update

# npm
RUN npm install -g typescript

# tldr
RUN mkdir -p ~/.local/share
RUN tldr --update

# locate
RUN updatedb

#-------------------------------------------------------------------------------
# final image
#-------------------------------------------------------------------------------

FROM base AS final

WORKDIR /root

COPY files/dotfiles/.bash_profile /root/
COPY files/dotfiles/.bashrc /root/
COPY files/dotfiles/.bashrc.functions /root/
COPY files/dotfiles/.vimrc /root/

