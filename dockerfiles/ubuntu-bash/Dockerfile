#-------------------------------------------------------------------------------
# base image - install and setup OS packages only
#-------------------------------------------------------------------------------

FROM ubuntu:23.10 as base

ENV DEBIAN_FRONTEND=noninteractive

RUN yes | unminimize

RUN apt update

RUN apt install \
        apache2         \
        apt-file        \
        bash-completion \
        bc              \
        curl            \
        dnsutils        \
        figlet          \
        gauche          \
        git             \
        iputils-ping    \
        jc              \
        jq              \
        knot-dnsutils   \
        less            \
        make            \
        man             \
        moreutils       \
        net-tools       \
        nkf             \
        num-utils       \
        php             \
        plocate         \
        pwgen           \
        python3         \
        python3-pip     \
        rlwrap          \
        ruby            \
        sysstat         \
        tig             \
        tldr            \
        tree            \
        vim             \
        wget            \
        -y

# apt-file
RUN apt-file update

# tldr
RUN mkdir -p ~/.local/share
RUN tldr --update

# locate
RUN updatedb

#-------------------------------------------------------------------------------
# final image
#-------------------------------------------------------------------------------

FROM base as final

WORKDIR /root

COPY files/dotfiles/.bash_profile /root/
COPY files/dotfiles/.bashrc /root/
COPY files/dotfiles/.bashrc.functions /root/
COPY files/dotfiles/.vimrc /root/

