# vim: set noexpandtab:
# include Makefile config/scaffolding
include scaffolding.mk

_cwd := $(shell pwd)

.PHONY: all
all: build

bin/venv:
	@echo "$(GREEN)==> Setup Virtual Env$(RESET)"
	python -m venv env
	env/bin/pip install -r requirements.txt

.PHONY: buildout
buildout: bin/venv
	@echo "$(GREEN)==> Running buildout$(RESET)"
	env/bin/buildout -c buildout.cfg

.PHONY: build
build: buildout
