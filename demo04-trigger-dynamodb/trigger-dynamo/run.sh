sls invoke local -f hero-insert --path requests-mock/hero.insert.json


# Inatalando biblioteca para valadição de schema
npm i @hapi/joi

# Fazer npm init -y
# Adicionar no package.json em scripts
    "invoke-local": "sls invoke local -f hero-insert --path requests-mock/hero.insert.json"

npm run invoke-local



sls invoke local -f hero-trigger --log
sls invoke -f hero-trigger --log

