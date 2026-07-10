.PHONY: help install serve dev docker-serve build clean

# Default target when just running 'make'
.DEFAULT_GOAL := help

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  install        Install local Ruby dependencies using Bundler"
	@echo "  serve          Start the local Jekyll server using Bundler"
	@echo "  dev            Alias for serve"
	@echo "  docker-serve   Start the Jekyll server using Docker (recommended for Apple Silicon/macOS)"
	@echo "  build          Build the site locally to the _site directory"
	@echo "  clean          Clean the built site and Jekyll cache files"

install:
	bundle install

serve:
	bundle exec jekyll serve

dev: serve

docker-serve:
	docker run --rm \
		--platform linux/amd64 \
		-v "$$(pwd):/srv/jekyll" \
		-p 4000:4000 \
		-it jekyll/jekyll \
		jekyll serve

build:
	bundle exec jekyll build

clean:
	rm -rf _site .jekyll-cache .sass-cache
