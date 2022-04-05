# アプリケーション名

nonbay

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

## 検索機能

# アプリケーションを作成した背景

日本酒好きの友人

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
