FROM pritunl/archlinux:latest

SHELL ["/bin/bash","-c"]

RUN pacman --noconfirm -S\
 base-devel\
 git\
 cmake\
 texlive-core\
 texlive-science\
 texlive-latexextra\
 make\
 texlive-bin\
 octave

ENV BUILD_ROOT $HOME/build

COPY . $BUILD_ROOT
RUN cd $BUILD_ROOT && mkdir build && cd build && cmake .. && make
