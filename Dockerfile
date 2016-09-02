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

RUN cd $HOME 
RUN git clone --recursive https://github.com/theNerd247/mtre4100.git
RUN cd $HOME/mtre4100 && mkdir build && cd build && cmake .. && make
