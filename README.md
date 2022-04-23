# アプリケーション名

のんべぇ

# アプリケーション概要

飲んだ日本酒を評価し、日本酒の味わいを数値化することで、自分好みの日本酒や自分と似た好みのユーザーが飲んでいる日本酒をシェアすることができます。

# URL

https://nonbay.herokuapp.com/

# テスト用アカウント

・Basic認証ID : admin

・Basic認証パスワード : 0000

・メールアドレス : test@mail.com

・パスワード : 000000

# 利用方法

## レビュー投稿

1.トップページのヘッダーからユーザー新規登録を行います。
2.レビュー投稿ボタンから地域、蔵元、銘柄を指定して飲んだ感想(コメント・香り・第一印象・旨味・余韻)を入力し投稿します。

## おすすめ銘柄表示

1.トップページのヘッダーからユーザー新規登録を行います。
2.レビューが投稿されており、ユーザー新規登録時に設定した好みの味わいに近い銘柄がある場合にトップページに最大5つ表示します。

# アプリケーションを作成した背景

自分自身が好みの日本酒を見つけられないという悩みを抱えていました。日本酒好きの友人が飲んだ日本酒を記録するアプリケーションが欲しいと言ったことから、日本酒好きのユーザーとこれから日本酒を飲みたいユーザー向けに、「日本酒の味わいの記録」、「自分好みのおすすめの日本酒表示」という機能があれば両者のニーズを満たすことができるのではないかと考え、両機能を備えたアプリケーションを開発することにいたしました。

# 洗い出した要件

https://docs.google.com/spreadsheets/d/1O7yM7sqR54szLbh7_HKamhAnHu6ANltiE52KQYz06P8/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

- ユーザーが登録した味わいをもとにおすすめの銘柄を表示します。

[![Image from Gyazo](https://i.gyazo.com/280e52e993710ff71cf9a13e9cb9e1db.gif)](https://gyazo.com/280e52e993710ff71cf9a13e9cb9e1db)

- ユーザーが投稿したレビューをもとに銘柄の味わいの評価が更新されます。

[![Image from Gyazo](https://i.gyazo.com/884a0691b568d3cd23d27c1af631063d.gif)](https://gyazo.com/884a0691b568d3cd23d27c1af631063d) 

# 実装予定の機能

- 味わい検索機能

- 銘柄のキーワード検索機能

- お気に入り銘柄の登録機能

- ユーザーのフォロー機能

# データベース設計

[![Image from Gyazo](https://i.gyazo.com/4cf06c1a2e216d962bddb95405fcb7b3.png)](https://gyazo.com/4cf06c1a2e216d962bddb95405fcb7b3)

# 画面遷移図

[![Image from Gyazo](https://i.gyazo.com/0c04e3f213558ee23bcbc4a3891a17fd.png)](https://gyazo.com/0c04e3f213558ee23bcbc4a3891a17fd)

# 開発環境

- Ruby / Ruby on Rails / MySQL / GitHub / Heroku / Visual Studio Code

# ローカルでの動作方法

以下のコマンドを順に実行。

% git clone https://github.com/shun-p0430/nonbay.git

% cd nonbay

% bundle install

% yarn install

# 工夫したポイント

レビュー投稿時に、紐づいた銘柄の味わいの平均を計算し、更新されるようにしました。

# データベース設計

## usersテーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| aroma_id      | integer | null: false |
| impression_id | integer | null: false |
| taste_id      | integer | null: false |
| afterglow_id  | integer | null: false |

### Association

- has_many :reviews
- has_many :favorites
- has_many :follower, class_name: "Follows", foreign_key: "follower_id", dependent: :destroy
- has_many :followed, class_name: "Follows", foreign_key: "followed_id", dependent: :destroy
- has_many :following_user, through: :follower, source: :followed
- has_many :follower_user, through: :followed, source: :follower

## breweriesテーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| name    | string  | null: false |
| area_id | integer | null: false |

### Association

- has_many :brands

## brandsテーブル

| Column     | Type                            | Options                        |
| ---------- | ------------------------------- | ------------------------------ |
| name       | string                          | null: false                    |
| brewery    | references                      | null: false, foreign_key: true |
| aroma      | decimal: precision: 3, scale: 2 |                                |
| impression | decimal: precision: 3, scale: 2 |                                |
| taste      | decimal: precision: 3, scale: 2 |                                |
| afterglow  | decimal: precision: 3, scale: 2 |                                |

### Association

- belongs_to :brewery
- has_many :reviews
- has_many :favorites 

## reviewsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| comment       | text       |                                |
| brand         | references | null: false, foreign_key: true |
| aroma_id      | integer    | null: false                    |
| impression_id | integer    | null: false                    |
| taste_id      | integer    | null: false                    |
| afterglow_id  | integer    | null: false                    |

### association

- belongs_to :user
- belongs_to :brand


## favoritesテーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| brand  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :brand


## followsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| follower_id | references | null: false, foreign_key: true |
| followed_id | references | null: false, foreign_key: true |

- belongs_to :follower, class_name: "User"
- belongs_to :followed, class_name: "User"