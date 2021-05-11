# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |
| name_kanji    | string | null: false |
| name_katakana | string | null: false |
| birthday      | string | null: false |

### Association

- has_many :items
- has_many :purchaces
- has_many :credits


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| image         | ActiveStorageで実装                     
| title         | text       | null: false                    |
| category      | string     | null: false                    |
| status        | string     | null: false                    |
| shipping_fee  | string     | null: false                    |
| area          | string     | null: false                    |
| shipping_date | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase
- has_one :credit


## purchaces テーブル

| Column       | Type       | Options                       |
| ------------ | ---------- | ----------------------------- |
| postal       | text       | null: false                   |
| prefecture   | text       | null: false                   |
| municipality | text       | null: false                   |
| address      | text       | null: false                   |
| building     | text       | null: false                   |
| phone        | integer    | null: false                   |
| user_id      | references | null: false, foreign_key: true|
| item_id      | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :credit


## credits テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| card          | integer | null: false |
| expiration    | integer | null: false |
| security      | integer | null: false |
| user_id       | references | null: false, foreign_key: true |
| item_id       | references | null: false, foreign_key: true |
| purchace_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :purchace