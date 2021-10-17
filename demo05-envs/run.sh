# README
O objetivo desta aplicação é ser um scheduler, um cron-job que será executado de período em período conforme configurado. 
Neste projeto iremos configurar o cron-job para rodar de 1 em 1min bater em um site expecífico, pegar apenas o que queremos
e salvar em nosso banco de dados que será uma tabela no DynamoDB.

# 01 - Dentro da pasta demo05-envs
sls

Serverless: No project detected. Do you want to create a new one? 
    Yes

Serverless: What do you want to make? 
    AWS Node.js

Serverless: What do you want to call this project? 
    lambda-environment

Serverless: Would you like to enable this? 
    No


# => Na pasta do projeto criado "lambda-environment"
# 02 - Na pasta do projeto criado "lambda-environment"
npm init -y


# 03 - No arquivo serverless.yml gerado pelo comando sls
functions:
  commit-message-scheduler:
    handler: handler.scheduler

E no handler.js alterar o nome da função também para scheduler
    module.exports.scheduler


# 04 - No terminal vamos fazer o deploy das alterações
sls deploy


# 05 - Vamos testar com invoke
sls invoke -f commit-message-scheduler --logger

Essa deve ser a mensagem de retorno
{
    "statusCode": 200,
    "body": "{\n  \"message\": \"Go Serverless v1.0! Your function executed successfully!\",\n  \"input\": {}\n}"
}


# 06 - Em uma pasta chamada config iremos criar arquivos no formato json separando nossos ambientes em "qa" e "prod" para podermos escolher via flag
env.qa.json e env.prod.json


