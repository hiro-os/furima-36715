# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| name                 | string | null: false |
| email                | string | null: false |
| encrypted_password   | string | null: false |
| family_name          | string | null: false |
| last_name            | string | null: false |
| family_name_katakana | string | null: false |
| last_name_katakana   | string | null: false |
| year                 | date   | null: false |

### Association

- has_many :products
- has_many :shoppings

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| version       | text       | null: false                    |
| category_id   | integer    | null: false                    |
| situation_id  | integer    | null: false                    |
| burdener_id   | integer    | null: false                    |
| area_id       | integer    | null: false                    |
| order_days_id | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :orders
- belongs_to :user

## orders テーブル

| Column | Type       | Options                        |
| ------ | -----------| ------------------------------ |
| item   | references | null: false, foreign_key: true |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- belongs_to :user
- has_one :addresses

## addresses テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| postcode | string     | null: false                    |
| area_id  | string     | null: false                    |
| city     | string     | null: false                    |
| street   | string     | null: false                    |
| building | string     |                                |
| phone    | string     | null: false                    |

### Association

- belongs_to :orders
