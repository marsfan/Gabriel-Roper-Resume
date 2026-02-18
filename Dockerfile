FROM texlive/texlive:latest-medium
RUN tlmgr install hyphenat footmisc subfiles
WORKDIR /workdir