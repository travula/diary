SHELL := /bin/bash

PWD=$(shell pwd)
STATUS=0

all: build

init:
	./init.sh

build: init
	make -f pub-make -k build

build-with-basic-infra: init clone-basic-infra build
	echo "build with basic infra"

build-with-full-infra: init clone-exp-infra build
	echo "build with full infra"


clone-basic-infra: wget-orgs clone-exporters clone-basic-themes
	echo "infrastructure put in place"

clone-exp-infra: clone-basic-infra clone-exp-repos
	echo "exp infrastructure put in place"

clone-basic-themes:
	make -f pub-make -k clone-basic-themes

clone-exp-repos:
	make -f pub-make -k clone-exp-repos

clone-exporters:
	make -f pub-make -k clone-exporters

wget-orgs:
	make -f pub-make -k wget-orgs

clean:
	make -f pub-make clean
	(rm -rf build; rm -rf ./exp-publisher)

clean-infra:
	make -f pub-make clean-infra
