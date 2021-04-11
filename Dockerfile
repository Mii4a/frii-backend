# 使用するイメージとバージョン
FROM ruby:2.7.1

# 必要なライブラリをインストール
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                       libpq-dev \        
                       nodejs

# 以下はrails6以降(APIモード除く)で必要
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && apt-get install -y yarn

# コンテナ内にappというフォルダを作成
# ※ローカルPCにフォルダが作成されるわけではない
RUN mkdir /app
# ルートをappディレクトリに変更
ENV APP_ROOT /app
WORKDIR $APP_ROOT

# ローカルPC内のGemfile(.lock)をコンテナ内にコピー
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# mimemagic用のパッケージをインストール
RUN apt-get add --update --no-cache shared-mime-info

# bundle installを実行しローカルPCのファイルたちをコンテナ内にコピー
RUN bundle install
ADD . $APP_ROOT

# コンテナがlistenするポート番号
EXPOSE 3000

# 実行されるコマンド
CMD ["rails", "server", "-b", "0.0.0.0"]