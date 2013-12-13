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
$ docker pull ubuntu
```
