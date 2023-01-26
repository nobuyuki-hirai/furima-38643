## Usersテーブル

| Column             | Type   | Options              |
| ------------------ | ------ | -------------------- |
| nickname           | string | null, false          |
| email              | string | null, false          |
| password           | string | null, false          |
| encrypted_password | string | null, false          |
| last_name          | string | null, false          |
| first_name         | string | null, false          |
| last_name_kana     | string | null, false          |
| first_name_kana    | string | null, false          |
| birthday           | date   | null, false          |

### Association

- has_many :items
- has_one  :card_log
- has_one  :buyer_address

# itemsテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| title              | string    | null, false                    |
| price              | string    | null, false                    |
| concept            | text      | null, false                    |
| category           | integer   | null, false                    |
| condition          | integer   | null, false                    |
| postage_payer      | integer   | null, false                    |
| ship_area          | integer   | null, false                    |
| ship_date          | integer   | null, false                    |
| user               | refernces | null, false, foregin_key: true |

### Association

- belongs_to :user
- has_many   :images
- has_one    :card

## cardsテーブル

| Column | Type       | Options                    |
| ------ | ---------- | -------------------------- |
| card   | integer    | null, false                |
| user   | references | null, false, foregin: true |
| item   | references | null, false, foregin: true |

### Association

- belongs_to :user
- belongs_to :item

## imagesテーブル

| Column | Type       | Options                    |
| ------ | ---------- | -------------------------- |
| image  | string     | null, false                |
| item   | references | null, false, foregin: true |

### Association

- belongs_to :item

## buyerテーブル

| Column             | Type      | Options                        |
| ------------------ | --------- | ------------------------------ |
| post_code          | integer   | null, false                    |
| prefectures        | integer   | null, false                    |
| city               | string    | null, false                    |
| address            | integer   | null, false                    |
| build_name         | string    |                                |
| phone_number       | integer   | null, false                    |
| user               | refernces | null, false, foregin_key: true |

### Association

- belongs_to :user