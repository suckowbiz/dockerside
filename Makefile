.PHONY: images
images:
	docker compose build --no-cache --parallel
