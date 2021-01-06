# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname  | string | null: false |
| email   | string | null: false |
| encrypted_password  | string | null: false |
| family_name | string | null: false |
| first_name| string | null: false |
| family_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | integer | null: false |

### Association
- has_many :items
- has_many :buys

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references| null: false, foreign_key: true |
| name | string | null: false |
| explanation | text | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_burden_id | integer | null: false |
| shipping_area_id | integer | null: false |
| shipping_date_id | integer | null: false |
| price | integer | null: false |

### Association
- belongs_to :users
- has_one :buys

## buys テーブル

| Column | Type   | Options      |
| ------- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :users
- has_one :addresses
- belongs_to :items

## addresses テーブル

| Column | Type   | Options      |
| ------- | ---------- | ------------------------------ |
| postalcode| integer | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| house_number | string | null: false |
| building_name | string |
| phone_number | integer | null: false |

### Association
- belongs_to :buys