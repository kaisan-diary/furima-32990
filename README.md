# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname  | string | null: false |
| email   | string | null: false, unique:true |
| encrypted_password  | string | null: false |
| family_name | string | null: false |
| first_name| string | null: false |
| family_name_kana | string | null: false |
| first_name_kana | string | null: false |
| birthday | date | null: false |

### Association
- has_many :items
- has_many :orders

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| user | references| null: false, foreign_key: true |
| name | string | null: false |
| explanation | text | null: false |
| category_id | integer | null: false |
| condition_id | integer | null: false |
| shipping_burden_id | integer | null: false |
| prefecture_id | integer | null: false |
| shipping_date_id | integer | null: false |
| price | integer | null: false |

### Association
- belongs_to :user
- has_one :order

## orders テーブル

| Column | Type   | Options      |
| ------- | ---------- | ------------------------------ |
| user | references | null: false, foreign_key: true |
| item | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :address
- belongs_to :item

## addresses テーブル

| Column | Type   | Options      |
| ------- | ---------- | ------------------------------ |
| postal_code| string | null: false |
| prefecture_id | integer | null: false |
| city | string | null: false |
| house_number | string | null: false |
| building_name | string |
| phone_number | string | null: false |
| order| references | null: false, foreign_key: true

### Association
- belongs_to :order