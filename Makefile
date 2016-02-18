default: clean build start

start:
	docker run \
		--env JAVA_OPTS="-Xmx8192m" \
		--rm \
		--name jenkins-master \
		-p 8080:8080 -p 50000:50000 \
		-v $(shell pwd)/.volume:/var/jenkins_home \
		timgifford/jenkins-docker

setup:
	#curl -O https://releases.hashicorp.com/vault/0.4.1/vault_0.4.1_linux_amd64.zip
	#rm -f vault
	#unzip vault_0.4.1_linux_amd64.zip
	#rm vault_0.4.1_linux_amd64.zip	

build: 
	docker build -t timgifford/jenkins-docker .

clean:
	rm -rf $(shell pwd)/.volume
clean-docker:
	docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm


#docker run --name myjenkins -p 8080:8080 -p 50000:50000 -v /var/jenkins_home jenkins
