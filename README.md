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


## **itemsテーブル**

| Column                    | Type       | Null  | Option            |
| ------------------------- | ---------- | ----- | ----------------- |
| item_name                 | string     | false |                   |
| item_description          | text       | false |                   |
| item_category_id          | integer    | false |                   |
| item_condition_id         | integer    | false |                   |
| item_shipping_method_id   | integer    | false |                   |
| item_prefecture_id        | integer    | false |                   |
| item_shipping_duration_id | integer    | false |                   |
| item_price                | integer    | false |                   |
| user                      | references | false | foreign_key: true |


## **purchase_recordテーブル**

| Column | Type       | Null  | Option            |
| ------ | ---------- | ----- | ----------------- |
| user   | references | false | foreign_key: true |
| item   | references | false | foreign_key: true |


## **shipping_informationテーブル**

| Column          | Type       | Null  | Option            |
| --------------- | ---------- | ----- | ----------------- |
| postal_code     | string     | false |                   |
| prefecture_id   | integer    | false |                   |
| city            | string     | false |                   |
| street_address  | string     | false |                   |
| building_name   | string     | true  |                   |
| phone_number    | string     | false |                   |
| purchase_record | references | false | foreign_key: true |