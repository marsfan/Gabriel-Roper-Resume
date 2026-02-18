
.PHONY: build docker

build:
# Bind mount will mount the specified folder on the host machine on the container
# So that files changed in the container are changed on the host too
	docker run --rm --mount type=bind,src=.,dst=/workdir -it mytex xelatex Gabriel_Roper_Resume.tex

docker:
	docker build -t mytex .