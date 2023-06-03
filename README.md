# **テーブル設計**


## **usersテーブル**

| Column             | Type   | Null  | Option           |
| ------------------ | ------ | ----- | ---------------- |
| nickname           | string | false |                  |
| email              | string | false | uniqueness: true |
| encrypted_password | string | false |                  |
| family_name        | string | false |                  |
| first_name         | string | false |                  |
| family_name_kana   | string | false |                  |
| first_name_kana    | string | false |                  |
| birth_date         | date   | false |                  |

* has_many :items 
* has_many :purchase_records

## **itemsテーブル**

| Column                    | Type       | Null  | Option            |
| ------------------------- | ---------- | ----- | ----------------- |
| item_name                 | string     | false |                   |
| item_description          | text       | false |                   |
| item_category_id          | integer    | false | active_hash       |
| item_condition_id         | integer    | false | active_hash       |
| item_shipping_method_id   | integer    | false | active_hash       |
| item_prefecture_id        | integer    | false | active_hash       |
| item_shipping_duration_id | integer    | false | active_hash       |
| item_price                | integer    | false |                   |
| user                      | references | false | foreign_key: true |

* belongs_to :user
* has_one :purchase_record


## **purchase_recordsテーブル**

| Column | Type       | Null  | Option            |
| ------ | ---------- | ----- | ----------------- |
| user   | references | false | foreign_key: true |
| item   | references | false | foreign_key: true |

* belongs_to :user
* belongs_to :item
* has_one :shipping_information

## **shipping_informationsテーブル**

| Column             | Type       | Null  | Option            |
| ------------------ | ---------- | ----- | ----------------- |
| postal_code        | string     | false |                   |
| item_prefecture_id | integer    | false | active_hash       |
| city               | string     | false |                   |
| street_address     | string     | false |                   |
| building_name      | string     | true  |                   |
| phone_number       | string     | false |                   |
| purchase_record    | references | false | foreign_key: true |

* belongs_to :purchase_record