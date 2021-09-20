# 01 - Apos iniciar o projeto image-analysis

npm init -y

npm i aws-sdk

Já faz um (sls deploy) pra verificar se tudo esta rodando normalmente.

testa o invoke apos o deploy para saber se o ambiente esta funcionando.
sls invoke -f hello
sls invoke local -f hello 

Editando o arquivo serverless.yml do projeto
em functions:
    img-analysis:
        handler: handler.main
        events:
            - http:
                path: analyse
                method: get

testa o invoke local novamente
sls invoke local -f img-analysis




# 03 - Sempre que fizer uma alteração, fazer deploy
Na pasta do projeto criado via "serverless", neste caso /hello-sls

serverless deploy

# 04 - Invocar a lambda na AWS via SLS
serverless invoke -f hello

# 05 - Invocar a lambda localmente via SLS
serverless invoke local -f hello

Para visualizar o log
serverless invoke local -f hello --log

# 06 - Criando a dashboard do SLS
Basta rodar novamente o comando "serverless" no terminal
na pasta do projeto criado, o comando irá reconhecer que já
existe um projeto e perguntará se deseja criar a dashboard. Confirmando
que sim, basta lincar configurando sua conta AWS com o Serverless Framework.