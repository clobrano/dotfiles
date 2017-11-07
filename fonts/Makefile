PWD=$(pwd)

all: clone install cleanup


clone:
	git clone https://github.com/powerline/fonts.git --depth=1 powerline-fonts

install:
	./powerline-fonts/install.sh

cleanup:
	rm -rf ./powerline-fonts

cache:
	fc-cache -vf
