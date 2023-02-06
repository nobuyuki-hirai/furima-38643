## Usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null, false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null, false               |
| last_name          | string | null, false               |
| first_name         | string | null, false               |
| last_name_kana     | string | null, false               |
| first_name_kana    | string | null, false               |
| birthday           | date   | null, false               |

### Association

- has_many :items
- has_many :buys

# itemsテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| title              | string     | null, false                    |
| price              | integer    | null, false                    |
| concept            | text       | null, false                    |
| category_id        | integer    | null, false                    |
| condition_id       | integer    | null, false                    |
| postage_payer_id   | integer    | null, false                    |
| ship_area_id       | integer    | null, false                    |
| ship_day_id        | integer    | null, false                    |
| user               | references | null, false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy

## buyerテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| post_code          | string     | null, false                    |
| ship_area_id       | integer    | null, false                    |
| city               | string     | null, false                    |
| address            | string     | null, false                    |
| build_name         | string     |                                |
| phone_number       | string     | null, false                    |
| buy                | references | null, false, foreign_key: true |

### Association

- belongs_to :buy

## buyテーブル

| Column            | Type        | Options                        |
| user              | references  | null, false, foreign_key: true  |
| item              | references  | null, false, foreign_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :buyer