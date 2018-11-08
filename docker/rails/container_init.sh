#!/usr/bin/env bash

#Gemfileがある場合はコンテナ内にプロジェクトが残ってると判断
if [ -f Gemfile ]; then

    #退避プロジェクトを削除
    rm -rf /rails_bk
else
    #通常ファイルと隠しファイルをワークディレクトリに移動
    mv /rails_bk/* /rails_bk/.??* /rails_app/

    #退避プロジェクトを削除
    rmdir /rails_bk
fi

#グローバルにインストールしたらvendor/bundle以下が軽くなるので動作早くなる
bundle install --jobs=4

#gemの中身をデバッグしたい時とかは、vendor/bundle内にgemを置いてる方が見やすいのでこっちを使う
#bundle install --path=vendor/bundle --jobs=4

#rails s する前にserver.pid消すよう追加
rm -f tmp/pids/server.pid

#リモートデバッグ使用時
#bundle exec rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 -- bin/rails s -b 0.0.0.0

#マイグレーションもここでしとくべき？？
#bundle exec rails db:create

#通常起動時
bundle exec rails s -p 3000 -b '0.0.0.0'
