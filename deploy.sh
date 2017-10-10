#!/bin/bash

export PORT=4000
DIR=$1

if [ ! -d "$DIR"]; then
  printf "Usage: ./deploy.sh  <path>, <path> is the path of the repo. \n"
  exit
fi

echo "Deploy to [$DIR]"
mix ecto.migrate
mix deps.get
(cd assets && npm install)
(cd assets && ./node_modules/brunch/bin/brunch b -p)
mix release
mix phx.digest
env MIX_ENV=prod mix release --env=prod


_build/prod/rel/microblog/bin/microblog stop || true


env PORT=4000 _build/prod/rel/microblog/bin/microblog start

