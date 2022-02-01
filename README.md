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
| category_id        | integer      | null: false                    |
| condition_id       | integer      | null: false                    |
| place_id           | integer      | null: false                    |
| shipping_price_id  | integer      | null: false                    |
| day_to_ship_id     | integer      | null: false                    |
| price              | integer      | null: false                    |
| user               | references   | null: false, foreign_key: true |


### Association
belongs_to :user
has_one :record
belongs_to_active_hash :category_id
belongs_to_active_hash :condition_id
belongs_to_active_hash :place_id
belongs_to_active_hash :shipping_price_id
belongs_to_active_hash :day_to_ship_id


##records テーブル
| Column             | Type         | Option                         |
| -------------------| ------------ |------------------------------  |
| user               | references   | null: false, foreign_key: true |
| item               | references   | null: false, foreign_key: true |

### Association
belongs_to :item
has_one :address
belongs_to :user


##addresses テーブル
| Column             | Type         | Option                         |
| -------------------| ------------ |------------------------------  |
| postal_code        | string       | null: false                    |
| place_id           | integer      | null: false                    |
| city               | string       | null: false                    |
| house_number       | string       | null: false                    |
| building_name      | string       |                                |
| phone_number       | string       | null: false                    |
| record             | references   | null: false, foreign_key: true |

### Association
belongs_to :record
belongs_to_active_hash :place_id