##users テーブル

| Column             | Type         | Option                    |
| -------------------| ------------ |-------------------------  |
| nickname           | string       | null: false               |
| email              | string       | null: false, unique:true  |
| encrypted_password | string       | null: false               |
| first_name         | string       | null: false               |
| last_name          | string       | null: false               |
| first_kana_name    | string       | null: false               |
| last_kana_name     | string       | null: false               |
| birth              | date         | null: false               |

### Association
has_many :items
has_many :records

##items テーブル

| Column             | Type         | Option                         |
| -------------------| ------------ |------------------------------  |
| items_name         | string       | null: false                    | 
| info               | text         | null: false                    |
| category           | string       | null: false                    |
| condition          | string       | null: false                    |
| place              | string       | null: false                    |
| seller_name        | string       | null: false                    |
| price              | integer      | null: false                    |
| user               | references   | null: false, foreign_key: true |


### Association
belongs_to :user
has_one :record
belongs_to_active_hash :category
belongs_to_active_hash :condition
belongs_to_active_hash :place


##records テーブル

| Column             | Type         | Option                         |
| -------------------| ------------ |------------------------------  |
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |




### Association
belongs_to :items
has_one :address

##addresses テーブル
| Column             | Type         | Option                         |
| -------------------| ------------ |------------------------------  |
| postal_code        | string       | null: false                    |
| prefecture         | string       | null: false                    |
| city               | string       | null: false                    |
| house_number       | string       | null: false                    |
| building_name      | string       | null: false                    |
| phone_number       | string       | null: false                    |
| record             | references   | null: false, foreign_key: true |

### Association
belongs_to :record
belongs_to_active_hash :prefecture