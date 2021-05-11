# テーブル設計

## users テーブル

| Column              | Type   | Options                   |
| ------------------- | ------ | ------------------------- |
| nickname            | string | null: false               |
| email               | string | null: false, unique: true |
| encrypted_password  | string | null: false               |
| last_name_kanji     | string | null: false               |
| first_name_kanji    | string | null: false               |
| last_name_katakana  | string | null: false               |
| first_name_katakana | string | null: false               |
| birthday            | date   | null: false               |

### Association

- has_many :items
- has_many :addresses


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | ActiveStorageで実装                     
| title         | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| date_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :address


## addresses テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| postal       | integer    | null: false                   |
| area_id      | integer    | null: false                   |
| municipality | string     | null: false                   |
| address      | string     | null: false                   |
| building     | string     |                               |
| phone        | string     | null: false                   |
| user         | references | null: false, foreign_key: true|
| item         | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :history


## histories テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address