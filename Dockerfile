FROM texlive/texlive:latest-small
RUN tlmgr update --self && tlmgr install hyphenat subfiles titlesec tasks listofitems
WORKDIR /workdir
