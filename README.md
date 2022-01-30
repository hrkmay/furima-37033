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
| image              | string       | null: false                    |
| info               | text         | null: false                    |
| category           | string       | null: false                    |
| condition          | string       | null: false                    |
| place              | string       | null: false                    |
| seller_name        | string       | null: false                    |
| price              | string       | null: false                    |
| user               | references   | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :record

##record テーブル

| Column             | Type         | Option                         |
| -------------------| ------------ |------------------------------  |
| customers_name     | string       | null: false               　　　|
| count              | integer      | null: false               　　　|
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |




### Association
belongs_to :items
belongs_to :address

##address テーブル
| Column             | Type         | Option                    |
| -------------------| ------------ |-------------------------  |
| post_number        | string       | null: false               |
| prefecture         | string       | null: false               |
| city               | text         | null: false               |
| address            | text         | null: false               |
| build_name         | text         | null: false               |
| phone_number       | text         | null: false               |


### Association
belongs_to :record