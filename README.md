# Hello World GO - FCLX Challenge 1

## Comandos utilizados para subir image no Docker Hub

```bash
docker login
docker tag hello-go-world medina325/hello-go-world:1.0
docker push medina325/hello-go-world:1.0
```

## Como baixar a imagem

A URL da imagem no Docker Hub é a seguinte:

> https://hub.docker.com/r/medina325/hello-go-world

Para baixar a imagem, basta executar:

```bash
docker pull medina325/hello-go-world
```

## Como executar a imagem
Para executar a imagem, é necessário fazer o build, e então executá-la, com os
comandos abaixo.

```bash
docker build -t hello-go-world .
docker run --rm hello-go-world
```