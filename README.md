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
- has_many :buy

# itemsテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| title              | string    | null, false                    |
| price              | integer   | null, false                    |
| concept            | text      | null, false                    |
| category_id        | integer   | null, false                    |
| condition_id       | integer   | null, false                    |
| postage_payer_id   | integer   | null, false                    |
| ship_area_id       | integer   | null, false                    |
| ship_date_id       | integer   | null, false                    |
| user               | refernces | null, false, foregin_key: true |

### Association

- belongs_to :user
- has_one    :buy

## buyerテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| post_code_id       | string    | null, false                    |
| ship_area_id       | integer   | null, false                    |
| city               | string    | null, false                    |
| address            | integer   | null, false                    |
| build_name         | string    |                                |
| phone_number       | string    | null, false                    |
| buy                | refernces | null, false, foregin_key: true |

### Association

- belongs_to :user
- belongs_to :buy

## buyテーブル

| Column            | Type       | Options                        |
| user              | refernces  | null, false, forgin_key: true  |
| item              | refernces  | null, false, forgin_key: true  |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :buyer