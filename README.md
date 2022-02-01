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
| year                 | data   | null: false |

### Association

- has_many :products
- has_many :shoppings

## products テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| title      | string     | null: false                    |
| version    | string     | null: false                    |
| category   | string     | null: false                    |
| situation  | string     | null: false                    |
| burdener   | string     | null: false                    |
| area       | string     | null: false                    |
| days       | string     | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user

## shoppings テーブル

| Column  | Type       | Options                        |
| ------- | -----------| ------------------------------ |
| product | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :products
- belongs_to :user

## address テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| postcode | string     | null: false                    |
| state    | string     | null: false                    |
| city     | string     | null: false                    |
| street   | string     | null: false                    |
| building | string     |                                |
| phone    | string     | null: false                    |

### Association

- belongs_to :product
