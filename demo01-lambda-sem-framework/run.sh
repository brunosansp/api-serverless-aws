# 01 - Criar arquivo de políticas de segurança
politicas.json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "Service": "lambda.amazonaws.com"
            },
            "Action": "sts:AssumeRole"
        }
    ]
}

# 02 - Criar role de segurança
DOC: https://aws.amazon.com/pt/premiumsupport/knowledge-center/iam-assume-role-cli/

No arquivo de políticas estamos informando o serviço principal, neste caso o serviço de lambda. Além disso estamos usando o AssumeRole,
por ser uma conta filha poderá acessar como uma conta pai.

aws iam create-role \
    --role-name lambda-exemplo \
    --assume-role-policy-document file://E://wsp//nodejs//api-serverless-aws//demo01-lambda-sem-framework//politicas.json \
    | tee logs/role.log


# 03 - Criar arquivo com conteúdo da função lambda e zipá-lo
No Linux
    zip function.zip index.js

No Windows
    tar.exe -a -c -f function.zip index.js

# 03a - Criando função lambda com o arquivo zipado anteriormente
DOC: https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-awscli.html

aws lambda create-function \
    --function-name hello-cli \
    --zip-file fileb://../demo01-lambda-sem-framework/function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::159697670853:role/lambda-exemplo \
    | tee logs/lambda-create.log

# 04 - Usando lambda invoke para testar a função

aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec.log

# 04a - Atualizar a função
Antes de fazer o upload da função para a AWS é necessário zipar novamente o arquivo

# 04b - Zipando o arquivo novamnete
zip function.zip index.js

#  04c - Fazendo o upload do código da função
aws lambda update-function-code \
    --zip-file fileb://../demo01-lambda-sem-framework/function.zip \
    --function-name hello-cli \
    --publish \
    | tee logs/lambda-update.log

# 04d - Invocando a função
aws lambda invoke \
    --function-name hello-cli \
    --log-type Tail \
    logs/lambda-exec-update.log

# 05 - Removendo os recursos
    # Removendo a function
aws lambda delete-function \
    --function-name hello-cli

    # Removnedo a Role (IAM)
aws iam delete-role \
    --role-name lambda-exemplo