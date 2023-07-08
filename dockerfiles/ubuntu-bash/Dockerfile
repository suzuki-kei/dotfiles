FROM ubuntu:23.10

ENTRYPOINT bash

ENV DEBIAN_FRONTEND=noninteractive

RUN yes | unminimize

RUN apt update
RUN apt install -y apache2          # Apache HTTP Server
RUN apt install -y apt-file         # apt-file
RUN apt install -y bash-completion  # bash-completion
RUN apt install -y bc               # bc
RUN apt install -y curl             # curl
RUN apt install -y dnsutils         # nslookup
RUN apt install -y figlet           # figlet
RUN apt install -y gauche           # gauche
RUN apt install -y git              # git
RUN apt install -y iputils-ping     # ping
RUN apt install -y jc               # jc
RUN apt install -y jq               # jq
RUN apt install -y knot-dnsutils    # dig
RUN apt install -y less             # less
RUN apt install -y make             # make
RUN apt install -y man              # man
RUN apt install -y mlocate          # locate
RUN apt install -y moreutils        # https://joeyh.name/code/moreutils/
RUN apt install -y net-tools        # netstat
RUN apt install -y nkf              # nkf
RUN apt install -y num-utils        # https://suso.suso.org/programs/num-utils/index.phtml
RUN apt install -y php              # php
RUN apt install -y pwgen            # pwgen
RUN apt install -y python3          # python3
RUN apt install -y python3-pip      # python3-pip
RUN apt install -y rlwrap           # rlwrap
RUN apt install -y ruby             # ruby
RUN apt install -y sysstat          # sysstat
RUN apt install -y tig              # tig
RUN apt install -y tldr             # tldr
RUN apt install -y tree             # tree
RUN apt install -y vim              # vim
RUN apt install -y wget             # wget

# apt-file
RUN apt-file update

# tldr
RUN mkdir -p ~/.local/share
RUN tldr --update

