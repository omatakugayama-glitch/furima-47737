# README

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| family_name_kanji  | string | null: false |
| last_name_kanji    | string | null: false |
| family_name_kana   | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string | null: false |
| description        | text   | null: false |
| category           | integer| null: false |
| status             | integer| null: false |
| area               | integer| null: false |
| fee                | integer| null: false |
| days               | integer| null: false |
| price              | integer| null: false |
| items.user         | references(users) |null: false, foreign_key: true |

### Association

- has_one :purchase
- belongs_to :user


## purchases テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| item_name          | string |null: false  |
| price              | integer|null: false  |
| fee                | integer|null: false  |
| purchases.user     | references(users) |null: false, foreign_key: true |

### Association

- has_one :destination
- belongs_to :item



## destinations テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal_code        | string |null: false  |
| prefecture         | integer|null: false  |
| city               | string |null: false  |
| building           | string |             |
| address            | string |null: false  |
| phone_number       | string |null: false  |

### Association

- belongs_to :purchase
