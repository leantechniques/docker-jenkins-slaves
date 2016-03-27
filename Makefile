.PHONY: list
list:
	@$(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$' 

all: build start

start:
	docker run \
		--env JAVA_OPTS="-Xmx8192m" \
		--rm \
		--name jenkins-master \
		-p 8080:8080 -p 50000:50000 \
		-v $(shell pwd)/.volume:/var/jenkins_home \
		-v /var/run/docker.sock:/var/run/docker.sock \
		-v $(shell which docker):/usr/bin/docker \
		leantechniques/jenkins-docker

build: 
	docker build -t leantechniques/jenkins-docker .

reset:
	rm -rf $(shell pwd)/.volume

clean-docker:
	docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm
