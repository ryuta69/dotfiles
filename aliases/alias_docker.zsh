## ----------------------------------------
##	Docker
## ----------------------------------------
alias d='docker'
compdef _docker d
alias dc='docker-compose'
compdef _docker-compose dc
alias docpl='docker pull'
alias docnginx='docker container run --publish 80:80 --name proxy --detach nginx' # --network でネット指定できる
alias docconls='docker container ls'
alias docconlsa='docker container ls -a' # even stop
alias docconstop='docker container stop'
alias docconstart='docker container start'
alias docconlogs='docker container logs' # history
alias doccontop='docker container top' # process
alias docconinspect='docker container inspect' # config but too much
alias docconip='docker container inspect --format "{{ .NetworkSettings.IPAddress }}"'
alias docconstats='docker container stats' # performance of all container
alias docconrm='docker container rm'
alias docimals='docker image ls'
alias docimarm='docker image rm'
alias docmongo='docker run --name mongo -detach mongo'
alias docmysql='docker run --publish 3306:3306 --name db --env MYSQL_ROOT_PASSWORD=password -detach mysql'
alias dochttpd='docker run --publish 8080:80 --name webserver -detach httpd'
alias docconrunit='docker container run -it' # start new container interactively with bash
alias docconstartai='docker container start -ai' # run stopped container interactively
alias docconexecit='docker container exec -it' # run *additional* command in existing container with bash, so even exetted main process wont stop
alias docubuntu='docker container run -it --name ubuntu ubuntu' # default CMD is bash, so no need to specify
alias docconport='docker container port'
alias docnetls='docker network ls' # bridge is default network, host is high performance but valnerbility, none is localhost interface.
alias docnetinspect='docker network inspect'
alias docnetcre='docker network create --driver'
alias docnetcon='docker network connect'
alias docnetdiscon='docker network disconnect'
alias docnslookup='docker container run --rm --net dude alpine nslookup search' # word must be changed, but show how it works. centos curl -s as well. you can see dns round robin.
alias docimhistory='docker image history' # every layers built image
alias dociminspect='docker inspect image' # display image layers
alias docimls='docker image ls'
alias docimretag='docker image tag'
alias docimpush='docker image push'
function docbuild() {
    read -p "type name >> " name;
    docker image build -t ${name} .;
}
alias docconrunrm='docker container run --rm'
alias docimrm='docker image rm'
alias docimprune='docker image prune' # delete unused images
alias docimrmunused='docker system prune' # delete all unused images and containers and network
alias docconrma='docker stop $(docker ps -q) && docker rm $(docker ps -aq)'
alias docimrma='docker rmi -f `docker images -aq`'
alias docvolrm='docker volume ls -qf dangling=true | xargs docker volume rm'
alias docvolls='docker volume ls'
alias docvolname='docker container ru-d --name mysql2 -e MYSQL_ALLOW_EMPTY_PASSWORD=True  -v mysql-db:/var/lib/mysql mysql'
alias docmount='docker container run -d --name nginx -p 80:80 -v $(pwd):/usr/share/nginx/html nginx'
alias doccomup='docker-compose up -d'
alias doccomdown='docker-compose down'
alias doccomdowna='docker-compose down -v' # all volume and network as well
alias doccomrmi='docker-compose down --rmi'
alias doccomps='docker-compose ps' # docker compose containers
alias doccomtop='docker-compose top' # docker compose process of containers
alias doccombuild='docker-compose build'

alias docswarminit='docker swarm init'
alias docnodels='docker node ls' # ls docker swarm
alias docsercre='docker service create alpine ping 8.8.8.8'
alias docserls='docker service ls'
alias docserrma='docker service rm $(docker service ls -q)'
alias docscale='docker service update {ID} --replicas 3'
alias docmacre='docker-machine create'
alias docmassh='docker-machine ssh'
alias docmaenv='docker-machine env'
alias docswaip='docker-machine ip'
alias docmasscp='docker-machine scp ${local_file} ${machine_name:path}'
alias docswaini='docker swarm init --advertise-addr' # showing up docker swarm join. use them. and docker node update --role. docker swarm join-token. docker swarm leave --force. docker node ls.
alias docswastop='docker swarm leave --force'
alias docnetcre='docker network create --driver overlay' # automatically connect network inside single swarm. bridge, ingress will be made.
alias docsercre='docker service create --replicas 3 alpine ping 8.8.8.8' # docker service create --name drupal --network mydrupal -p 80:80 drupal, docker service create --name psql --network mydrupal -e POSTGRES_PASSWORD=mypass postgres, docker service create --name search --replicas 3 -p 9200:9200 elasticsearch:2
alias docstack='docker stack deploy -c' # if existed it updates target_yaml stackname
alias docstackls='docker stack services' # show replicas number
alias docstackps='docker stack ps' # show replicas name
alias docseccrefile='docker secret create psql_user psql_user.txt'
alias docseccrecmd='echo "myDBpassWORD" | docker secret create psql_pass -'
alias docsecls='docker secret ls'
alias docsecinspect='docker secret inspect'
alias docsecrm='docker service update --secret-rm'
alias docci='docker-compose -f docker-compose.yml -f docker-compose.test.yml up -d'
alias docpro='docker-compose -f docker-compose.yml -f docker-compose.prod.yml config > output.yml'
alias docserupdima='docker service update --image <old image> <new image>'
alias docserupdenv='docker service update --env-add <ENV_NAME>=<ENV_VALUE>'
alias docserupdport='docker service update --publish-rm <PORT> --publish-add <PORT>'
alias docserupdscale='docker service scale <service name>=<replica num>'
alias dochealth='docker container run --name p2 -d --health-cmd="pg_isready -U postgres || exit 1" postgres'
# cmdは変更可能、entrypointは変更不可だがexec形式なら変数を渡せる、entryとcmdがあったらvmdが引数になる、shell形式のCMDは変数がつかえるけど（それかsh呼び出す）プロセスがshになるとシグナルを受け取れない
## ----------------------------------------
##	Kubernetes
## ----------------------------------------
# kube is composed by depelopment と、スワームのスタックのような構成を保っている、それの間の中では、でペロプ面とがｒこコンフィグレーションを管理していて、レプリカ君はその中でポッドが正常に動作している事を保証している。podがコンテナのシリーズを管理している
alias kube='kubectl'
alias kuberun='kubectl run my-nginx --image nginx'
alias kubepods='kubectl get pods -w'
alias kubelsa='kubectl get all'
alias kubescalereplica='kubectl scale deploy/my-apache --replicas 2'
alias kubelogpod='kubectl logs deploy/my-apache'
alias kubelogdep='kubectl logs -l run=my-apache'
alias kuberm='kubectl delete pod/my-apache'
alias kubeexpose='kubectl expose deployment/httpenv --port 8888'
alias kubels='kubectl get service'
alias kubetmpsh='kubectl run --generator run-pod/v1 tmp-shell --rm -it --image bretfisher/netshoot -- bash'
alias kubenodeport='kubectl expose deployment/httpenv --port 8888 --name httpenv-np --type NodePort'
alias kubeserdel='kubectl delete service/httpenv service/httpenv-np service/httpenv-lb deployment/httpenv'
alias kubeyaml='kubectl create deployment test --image nginx --dry-run -o yaml'
alias kubeapi='kubectl api-resources'
alias kubedoc='kubectl explain services.spec.type'
alias kubeapp='kubectl apply -f app.yml --dry-run'
alias kubeall='kubectl get all'
