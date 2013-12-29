Primeros pasos en una imagen de Vagrant para probar Docker localmente y Docker.

# Instalación

Primero se debe tener instalado Virtualbox 4.3.4 preferiblemente y Vagrant 1.4.0 obligatoriamente.

## Instalación de plugins
Antes de correr o hacer un `vagrant up` debemos instalar el siguiente plugin:

```sh
$ vagrant plugin install vagrant-vbguest
```

Posteriormente:

```sh
$ vagrant up --provision
```

Una vez que se haya instalado todo en la maquina ingresar a la misma haciendo uso del comando
`vagrant ssh` para posteriormente probar docker.

```sh
$ docker run -i -t ubuntu:12.04 /bin/bash
```

## Crear los contenedores de Codehero

Para crear los contenedores de codehero debemos utilizar los *Dockerfile* que se encuentran
en la carpeta de *nginx* y *ruby* respectivamente.

Para crear el contenedor de nginx:

```sh
$ sudo docker build -t codehero/nginx /dir/a/el/nginx/Dockerfile
```

Para crear el contenedor de Ruby:

```sh
$ sudo docker build -t codehero/ruby /dir/a/el/ruby/Dockerfile
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
