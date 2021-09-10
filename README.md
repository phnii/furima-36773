## usersテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false, default: "" |
| password_encrypted | string | null: false, default: "" |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

### Association
- has_many :items
- has_many :purchases


## itemsテーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| name          | string     | null: false |
| explanation   | text       | null: false |
| category      | string     | null: false |
| condition     | string     | null: false |
| shipping_fee  | integer    | null: false |
| ship-from     | string     | null: false |
| shipping-days | integer    | null: false |
| price         | integer    | null: false |
| user          | references | null: false |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル

| Column          | Type       | Options     |
| --------------- | ---------- | ----------- |
| card_number     | integer    | null: false |
| expiration_date | date       | null: false |
| security_code   | integer    | null: false |
| postal_code     | integer    | null: false |
| prefecture      | string     | null: false |
| city            | string     | null: false |
| address         | string     | null: false |
| building_name   | string     | null: false |
| phone_number    | integer    | null: false |
| user            | references | null: false |
| item            | references | null: false |

### Association
- belongs_to :user
- belongs_to :item
