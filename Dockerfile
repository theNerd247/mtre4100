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
 texlive-bin

RUN mkdir build && cd build && cmake .. && make
