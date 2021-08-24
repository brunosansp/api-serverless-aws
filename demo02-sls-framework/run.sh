# 01 - Instalar o framework Serverless
https://www.serverless.com/framework/docs/providers/aws/guide/installation/

https://www.npmjs.com/package/serverless

npm i serverless@2.39.2


# 02 - Iniciar um projeto com o framework Serverless
No terminal:
serverless

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