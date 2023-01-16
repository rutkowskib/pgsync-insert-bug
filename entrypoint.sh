sed -i "s/{{database}}/$PG_DATABASE/g" schema.json

bootstrap --config schema.json
pgsync -c ./schema.json --daemon
