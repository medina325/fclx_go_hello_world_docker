# Muito legal, usando outra imagem como builder de uma image mais leve
FROM golang:1.20.3-bullseye as builder

RUN mkdir -p /app
WORKDIR /app

COPY . .

ENV GOPROXY https://proxy.golang.org,direct
ENV CGO_ENABLED=0
RUN go mod download

RUN GOOS=linux go build ./main.go

# Image scratch do Docker, é uma imagem Linux bem leve
FROM scratch

WORKDIR /app
# Então basta eu copiar o binário gerado do go build na imagem "builder" dessa
COPY --from=builder /app/main .

# E executar esse binário, que é basicamente a única coisa que tem nesse container.
# Por isso, se torna tão leve (a imagem está com 1.23MB)
CMD ["/app/main"]