alias d='docker'
compdef _docker d
alias dc='docker-compose'
compdef _docker-compose dc

## ----------------------------------------
##	Docker Container
## ----------------------------------------
alias dpl='docker pull'
alias dlsc='docker container ls'
alias drmc='docker container rm'
alias dtop='docker container top'
alias dlog='docker container logs'
alias dstop='docker container stop'
alias dport='docker container port'
alias drun='docker container run -it'
alias dstats='docker container stats'
alias dstart='docker container start'
alias dexec='docker container exec -it'
alias dstart='docker container start -ai'
alias dinspectc='docker container inspect'
alias dcps='docker ps -a --format="table {{.Image}}\t{{.Status}}\t{{.Names}}"'
alias dprunec='docker stop $(docker ps -q) && docker rm $(docker ps -aq)'
alias dipc='docker container inspect --format "{{ .NetworkSettings.IPAddress }}"'
alias dnginx='docker run --publish 80:80 --name proxy --detach nginx'
alias dapache='docker run --publish 8080:80 --name webserver -detach httpd'
alias dmysql='docker run --publish 3306:3306 --name db --env MYSQL_ROOT_PASSWORD=pass -detach mysql'

## ----------------------------------------
##	Docker Image
## ----------------------------------------
alias dlsi='docker image ls'
alias drmi='docker image rm'
alias dtag='docker image tag'
alias dpush='docker image push'
alias dprunei='docker image prune'
alias dprunea='docker system prune'
alias dhistoryi='docker image history'
alias dinspecti='docker inspect image'
alias drmia='docker rmi -f `docker images -aq`'
function dbuild() {
    read name"?type name : ";
    docker image build -t ${name} .;
}

## ----------------------------------------
##	Docker Network
## ----------------------------------------
alias dlsv='docker volume ls'
alias dlsn='docker network ls'
alias dinspectn='docker network inspect'
alias dconnect='docker network connect'
alias ddisconnect='docker network disconnect'
alias dcreaten='docker network create --driver'

## ----------------------------------------
##	Docker Compose
## ----------------------------------------
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dcdowna='docker-compose down -v'
alias dccps='docker-compose ps'
alias dcyml='docker-compose -f'
alias dctop='docker-compose top'
alias dcbuild='docker-compose build'
alias dcrmi='docker-compose down --rmi'

## ----------------------------------------
##	Docker Swarm
## ----------------------------------------
alias dlsn='docker node ls'
alias dlss='docker service ls'
alias drms='docker service rm'
alias dscales='docker service scale'
alias dupdates='docker service update'
alias dcreates='docker service create'
alias dupdatei='docker service update --image'
alias dupdatee='docker service update --env-add'
alias dupdatesc='docker service update --secret-rm'
alias dupdatep='docker service update --publish-add'
alias drmsa='docker service rm $(docker service ls -q)'
alias dipm='docker-machine ip'
alias dssh='docker-machine ssh'
alias denv='docker-machine env'
alias dscp='docker-machine scp'
alias dleave='docker swarm leave --force'
alias dinit='docker swarm init --advertise-addr'
alias dcreatesw='docker network create --driver overlay'
alias dpss='docker stack ps'
alias ddeploy='docker stack deploy -c'
alias dservices='docker stack services'
alias dlssc='docker secret ls'
alias dcreatesc='docker secret create'
alias dinspectsc='docker secret inspect'

## ----------------------------------------
##	Kubernetes
## ----------------------------------------
alias k='kubectl'
alias krun='kubectl run'
alias klog='kubectl logs'
alias krm='kubectl delete'
alias kscale='kubectl scale'
alias kdoc='kubectl explain'
alias kexpose='kubectl expose'
alias kls='kubectl get service'
alias kgeta='kubectl get all'
alias kget='kubectl get pods -w'
alias kapi='kubectl api-resources'
alias kcreate='kubectl create deployment'
alias kapply='kubectl apply -f'
