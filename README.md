# テーブル設計

## usersテーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
|nickname       |string       |null: false                    |
|email          |string       |null: false                    |
|password       |string       |null: false                    |
|user_name      |string       |null: false                    |
|user_furigana  |string       |null: false                    |
|birthday       |date         |null: false                    |

### Association

- has_many :items
- has_many :comments
- has_many :orders

## itemsテーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
|item_name      |string       |null: false                    |
|item_info      |string       |null: false                    |
|item_detail    |text         |                               |
|item_status    |string       |null: false                    |
|category       |string       |null: false                    |
|price          |integer      |null: false                    |
|shipping_charge|string       |null: false                    |
|shipping_day   |string       |null: false                    |
|user           |references   |null: false, foreign_key: true |

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

## commentsテーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
|user           |references   |null: false, foreign_key: true |
|item           |references   |null: false, foreign_key: true |
|comment        |text         |null: false                    |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addressesテーブル

|Column         |Type         |Options                        |
|---------------|-------------|-------------------------------|
|postal_code    |string       |null: false                    |
|prefecture     |string       |null: false                    |
|municipality   |string       |null: false                    |
|address        |string       |null: false                    |
|user           |references   |null: false, foreign_key: true |
|item           |references   |null: false, foreign_key: true |

### Association

-belongs_to :order