COMPOSE=docker-compose build --no-cache

.DEFAULT_GOAL := all

all:
	$(COMPOSE) 

chrome:
	$(COMPOSE) chrome

base:
	$(COMPOSE) base base-av

dev:  
	$(COMPOSE) code goland

.PHONY: all base dev
