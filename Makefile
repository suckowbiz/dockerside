COMPOSE=docker-compose build --no-cache

.DEFAULT_GOAL := all

all:
	$(COMPOSE)

.PHONY: all
