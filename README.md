# テーブル設計

## usersテーブル

|Column                   |Type         |Options                        |
|-------------------------|-------------|-------------------------------|
|nickname                 |string       |null: false                    |
|email                    |string       |null: false                    |
|encrypted_password       |string       |null: false                    |
|last_name                |string       |null: false                    |
|first_name               |string       |null: false                    |
|last_furigana            |string       |null: false                    |
|first_furigana           |string       |null: false                    |
|birthday                 |date         |null: false                    |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

|Column             |Type         |Options                        |
|-------------------|-------------|-------------------------------|
|item_name          |string       |null: false                    |
|item_info          |string       |null: false                    |
|item_detail        |text         |                               |
|item_status_id     |integer      |null: false                    |
|category_id        |integer      |null: false                    |
|price              |integer      |null: false                    |
|shipping_charge_id |integer      |null: false                    |
|shipping_day_id    |integer      |null: false                    |
|prefecture_id      |integer      |null: false                    |
|user               |references   |null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_one :order

## ordersテーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
|user           |references   |null: false, foreign_key: true |
|item           |references   |null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## commentsテーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
|user           |references   |null: false, foreign_key: true |
|item           |references   |null: false, foreign_key: true |
|comment        |text         |null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## addressesテーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
|postal_code    |string       |null: false                    |
|prefecture_id  |integer      |null: false                    |
|municipality   |string       |null: false                    |
|address        |string       |null: false                    |
|order          |references   |null: false, foreign_key: true |

### Association

-belongs_to :order