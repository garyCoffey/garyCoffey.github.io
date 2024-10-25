docker-build:
	docker build -t my-jekyll-project .

docker-run:
	docker run --rm -p 4000:4000 -v $(PWD):/app my-jekyll-project

docker-update-gemlock:
	docker run --rm -v $(PWD):/app my-jekyll-project bundle update