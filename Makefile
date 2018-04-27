COMPOSE=docker-compose build --no-cache

all:
	$(COMPOSE) 

base:
	$(COMPOSE) base base-av

dev:  
	$(COMPOSE) code goland

.PHONY: all base dev
