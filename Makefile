COMPOSE=docker-compose build --no-cache

all:
	$(COMPOSE) --no-cache 

base:
	$(COMPOSE) base base-av base-builder

dev:  
	$(COMPOSE) git code goland

.PHONY: all base dev
