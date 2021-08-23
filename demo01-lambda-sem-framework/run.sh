# 01 - Criar arquivo de políticas de segurança

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
    --zip-file fileb://E://wsp//nodejs//api-serverless-aws//demo01-lambda-sem-framework//function.zip \
    --handler index.handler \
    --runtime nodejs12.x \
    --role arn:aws:iam::159697670853:role/lambda-exemplo \
    | tee logs/lambda-create.log