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

* ..。

# テーブル設計

## users テーブル

##ユーザー管理機能

| Column                | Type   | Options                  |
| ------------------    | ------ | -----------              |
| nickname              | string | null: false              |
| email                 | string | null: false, unique:true |
| encrypted_password    | string | null: false              |
| family_name           | string | null: false              |
| first_name            | string | null: false              |
| family_name_kana      | string | null: false              |
| first_name_kana       | string | null: false              |
| birth_day             | date   | null: false              |


### Association
has_many :products
has_many :purchases



## products テーブル

| Column               | Type       | Options                        |
| -------              | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| description          | text       | null: false                    |
| category_id          | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| delivery_charge_id   | integer    | null: false                    |
| prefecture_id        | integer    | null: false                    |
| delivery_day_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase



## destinations テーブル

| Column         | Type        | Options                        |
| -------        | ----------  | ------------------------------ |
| post_code      | string      | null: false                    |
| prefecture_id  | integer     | null: false                    |
| city           | string      | null: false                    |
| address         | string      | null: false                    |
| building_name  | string      |                                |
| phone_number   | string      | null: false                    |
| purchase       | references  | null: false, foreign_key: true |

### Association
belongs_to :purchase



## purchases テーブル

| Column     | Type        | Options                        |
| ---------- | ----------- | -----------                    |
| user       | references  | null: false, foreign_key: true |
| product    | references  | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :product
has_one :destination

