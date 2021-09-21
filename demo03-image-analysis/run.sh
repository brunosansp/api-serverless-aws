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

# 07 - Modificando o .yml para conceder permissao para usar Rekognition e Translator
provider:
  name: aws
  runtime: nodejs12.x
  lambdaHashingVersion: 20201221
# you can add statements to the Lambda function's IAM Role here
  iamRoleStatements:
    - Effect: "Allow"
      Action:
        - rekognition:DetectLabels
      Resource: "*"
    - Effect: "Allow"
      Action:
        - translate:TranslateText
      Resource: "*"


# 07.a - necessario fazer deploy
sls deploy

# 07.b - invoke remoto com as novas implementacoes
sls invoke -f img-analysis --log

# 08 - Instalando axios
npm i axios

# 08.a - Criar request.json com queryStringParameters para testarmos a chamada via axios com uma url de imagem
### request.json
{
    "queryStringParameters": {
        "imageUrl": "URL-AQUI"
    }
}
### invoke local
sls invoke local -f img-analysis --path request.json

### fazendo deploy
sls deploy

### invoke na aws
sls invoke -f img-analysis --path request.json --log

### chamando a api direto no browser
https://e24kvhg3a3.execute-api.us-east-1.amazonaws.com/dev/analyse?imageUrl=https://www.sciencenewsforstudents.org/wp-content/uploads/2021/04/1440_bb_brown_black_bear_explainer_feat.jpg
