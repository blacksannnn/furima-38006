# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| ------------------    | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false,unique: true |
| encrypted_password    | string | null: false |
| family_name           | string | null: false |
| first_name            | string | null: false |
| family_name_kana      | string | null: false |
| first_name_kana       | string | null: false |
| birth_day             | date   | null: false |

### Association
has_many :products


## products テーブル

| Column            | Type       | Options                        |
| -------           | ---------- | ------------------------------ |
| image             | ---------- | ------------------------------ |
| product_name      | text       | null: false                    |
| description       | text       | null: false                    |
| category          | text       | null: false                    |
| product_condition | text       | null: false                    |
| delivery_charge   | text       | null: false                    |
| region            | text       | null: false                    |
| delivery_day      | text       | null: false                    |
| price             | string     | null: false                    |

### Association
belongs_to :users


## destinations テーブル

| Column         | Type       | Options                        |
| -------        | ---------- | ------------------------------ |
| post_code      | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| adress         | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |


### Association
has_one :purchases


## purchases テーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | -----------                    |
| use        | references  | null: false, foreign_key: true |
| products   | references  | null: false, foreign_key: true |

### Association
belongs_to :destination