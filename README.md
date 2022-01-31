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
| year                 | string | null: false |

### Association

- has_many :dtb_products

## dtb_product テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| title      | string | null: false |
| version    | string | null: false |
| category   | string | null: false |
| situation  | string | null: false |
| burdener   | string | null: false |
| area       | string | null: false |
| days       | string | null: false |
| price      | string | null: false |
| commission | string | null: false |
| profit     | string | null: false |
| user_id    | string | null: false |
| record_id  | string | null: false |

### Association

- has_one :purchase_record
- belongs_to :user

## dtb_shopping テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ------------|
| product_id      | string | null: false |
| product_title   | string | null: false |

### Association

- belongs_to :dtb_record

## purchase_record テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------  |
| postcode    | string | null: false |
| state       | string | null: false |
| city        | string | null: false |
| street      | string | null: false |
| building    | string | null: false |
| phone       | string | null: false |
| record_id   | string | null: false |

### Association

- has_one :dtb_shopping
- belongs_to :dtb_product
