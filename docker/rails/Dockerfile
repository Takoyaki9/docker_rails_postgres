#rubyとcentos
FROM ruby:2.5.0

#postgresql
RUN apt-get update && apt-get install -y build-essential libpq-dev postgresql-client

#rails
RUN gem install rails

# create rails project
RUN rails new rails_app -d postgresql --skip-bundle --api

WORKDIR /rails_app

#プロジェクトを退避
RUN cp -R /rails_app /rails_bk

#初期化シェルスクリプトをホストからコンテナへコピー
ADD /container_init.sh /container_init.sh

#↑権限かえなダメかも

