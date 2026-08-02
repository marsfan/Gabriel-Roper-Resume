FROM texlive/texlive:latest-medium
RUN tlmgr update --self && tlmgr install hyphenat footmisc subfiles titlesec tasks
WORKDIR /workdir
