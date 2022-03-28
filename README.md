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
- has_many :comments
- has_many :favorites

## reviewsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| sake_id       | integer    | null: false                    |
| aroma_id      | integer    | null: false                    |
| impression_id | integer    | null: false                    |
| taste_id      | integer    | null: false                    |
| afterglow_id  | integer    | null: false                    |

### association

- belongs_to :user

## commentsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| sake_id | integer    | null: false                    |
| comment | text       | null: false                    |

### Association

- belongs_to :user

## favoritesテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| sake_id | integer    | null: false                    |

### Association

- belongs_to :user

<!-- ## followsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| follow_user | references | null: false, foreign_key: true |

### Association -->