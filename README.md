Primeros pasos en una imagen de Vagrant para probar Docker localmente y Docker.

## Dependencias

- Virtualbox 4.3.4+ o VMware.
- Vagrant 1.4.1+

## Instalación de plugins
Antes de correr o hacer un `vagrant up` debemos instalar el siguiente plugin:

```sh
$ vagrant plugin install vagrant-vbguest
```

Posteriormente:

```sh
$ vagrant up
```

Ó

```sh
$ vagrant up --provision
```

Una vez que se haya instalado todo en la maquina ingresar a la misma haciendo uso del comando
`vagrant ssh` para posteriormente probar docker.

```sh
$ docker run -i -t ubuntu:12.04 /bin/bash
```

Si se encuentra todo instalado y docker funciona con el comando anterior podemos pasar
a crear los contenedores de Codehero utilizando los `Dockerfiles`.

## Crear los contenedores de Codehero

Para crear los contenedores de codehero debemos utilizar los *Dockerfile* que se encuentran
en la carpeta de *nginx* y *ruby* respectivamente.

> Debemos recordar que dentro de *vagrant* podemos ver los archivos que se encuentran en el
host machine dentro de la carpeta compartida `/vagrant`.

*** Dentro de vagrant: ***

Para crear el contenedor de nginx:

```sh
$ sudo docker build -t codehero/nginx /vagrant/nginx/Dockerfile
```

Para crear el contenedor de Ruby:

```sh
$ sudo docker build -t codehero/ruby /vagarnt/ruby/Dockerfile
```

## Iniciar los contenedores creados

Para iniciar el container de *ruby con ssh* como servicio:

```sh
$ RUBY=$(sudo docker run -d -p 22222:22 codehero/ruby)
```

Para iniciar el container de *nginx*:

```sh
$ NGINX=$(sudo docker run -d -volumes-from $RUBY -p 80:80 codehero/nginx)
```
