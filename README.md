# アプリケーション名

のんべぇ

# アプリケーション概要

飲んだ日本酒を評価し、日本酒の味わいを数値化することで、自分好みの日本酒や自分と似た好みのユーザーが飲んでいる日本酒をシェアすることができる。

# URL

# テスト用アカウント

・Basic認証ID :

・Basic認証パスワード :

・メールアドレス :

・パスワード :

# 利用方法

## レビュー投稿

1.トップページのヘッダーからユーザー新規登録を行う。
2.レビュー投稿ボタンから地域、蔵元、銘柄を指定して飲んだ感想(コメント・香り・第一印象・旨味・余韻)を入力し投稿する。

## おすすめ銘柄表示

1.トップページのヘッダーからユーザー新規登録を行う。
2.レビューが投稿されており、ユーザー新規登録時に設定した好みの味わいに近い銘柄がある場合にトップページに最大5つ表示する。

# アプリケーションを作成した背景

自分自身が好みの日本酒を見つけられないという悩みを抱えていました。日本酒好きの友人が飲んだ日本酒を記録するアプリケーションが欲しいと言ったことから、日本酒好きのユーザーとこれから日本酒を飲みたいユーザー向けに、「日本酒の味わいの記録」、「自分好みのおすすめの日本酒表示」という機能があれば両者のニーズを満たすことができるのではないかと考え、両機能を備えたアプリケーションを開発することにいたしました。

# 洗い出した要件

https://docs.google.com/spreadsheets/d/1O7yM7sqR54szLbh7_HKamhAnHu6ANltiE52KQYz06P8/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能

# データベース設計



# 画面遷移図

# 開発環境

・フロントエンド

・バックエンド

・インフラ

・テスト

・テキストエディタ

・タスク管理

# ローカルでの動作方法

以下のコマンドを順に実行。

# 工夫したポイント



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
