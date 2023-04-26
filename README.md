# README
# furima - 商品取引アプリ

## アプリケーション概要
このアプリケーションでは、ユーザーが商品を出品、購入、取引履歴の確認ができます。

## URL※
https://furima-39335.onrender.com

## テスト用アカウント
- ユーザー名: xxxx
- パスワード: xxxx
- (Basic認証がある場合) ID/Pass: admin/2222

## 利用方法
1. アカウントを作成またはログインします。
2. 商品を出品する場合、出品画面から商品情報を入力して出品します。
3. 商品を購入する場合、商品一覧から購入したい商品を選択し、購入画面で支払い情報を入力して購入します。
4. 取引履歴を確認する場合、マイページから取引履歴を選択します。

## アプリケーションを作成した背景
このアプリケーションを通じて、商品取引を簡単に行えるプラットフォームを提供し、購入者と出品者の間の取引をスムーズに行えるようにすることを目指しています。

## 洗い出した要件
(要件定義をまとめたスプレッドシートのリンク)

## 実装した機能についての画像やGIFおよびその説明※
(実装した機能の画像やGIF、説明を記載)

## 実装予定の機能
- 商品の検索機能
- カテゴリ別商品表示機能

## データベース設計
ER図はer.dioに記載

## usersテーブル
| Column                | Type    | Options                   |
| --------------------- | ------  | ------------------------- |
| nickname              | string  | null: false               |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               | 
| last_name_kanji       | string  | null: false               |
| first_name_kanji      | string  | null: false               |
| last_name_kana        | string  | null: false               |  
| first_name_kana       | string  | null: false               |

  

## itemsテーブル
| Column             | Type    | Options                        |
| ------------------ | ------- | ------------------------------ |
| item_name          | string  | null: false                    |
| category_id        | integer | null: false                    |
| price              | integer | null: false                    |
| user_id            | integer | null: false, foreign_key: true |
| item_condition     | string  | null: false                    |
| shipping_fee_bearer| string  | null: false                    |
| shipping_origin    | string  | null: false                    |
| shipping_estimate  | integer | null: false                    |

## favoritesテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| item     | references | null: false, foreign_key: true |

## purchase_historiesテーブル
| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item        | references | null: false, foreign_key: true |

## shipping_addressesテーブル
| Column            | Type      | Options                        |
| ----------------- | --------- | ------------------------------ |
| purchase_history  | references| null: false, foreign_key: true |
| postal_code       | string    | null: false                    |
| prefecture_id     | integer   | null: false                    |
| city              | string    | null: false                    |
| street_address    | string    | null: false                    |
| building_name     | string    |                                |
| phone_number      | string    | null: false                    |

## Association

## Usersテーブル
- has_many :items
- has_many :favorites
- has_many :items, through: :favorites
- has_many :purchase_histories

## Itemsテーブル
- belongs_to :user
- has_many :favorites
- has_many :users, through: :favorites
- has_one :purchase_history

## Favoritesテーブル
- belongs_to :user
- belongs_to :item

## PurchaseHistoriesテーブル
- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## ShippingAddressesテーブル
- belongs_to :purchase_history


- usersテーブルは、アプリケーションのユーザー情報を管理します。
- itemsテーブルは、出品された商品情報を管理します。seller_idは、usersテーブルとの外部キー制約を持ち、出品者のユーザー情報を参照します。
- purchase_historiesテーブルは、購入履歴を管理します。user_idは購入者のユーザー情報、item_idは購入された商品情報を参照するための外部キー制約です。
- shipping_addressesテーブルは、配送先住所情報を管理します。purchase_history_idは、購入履歴テーブルとの外部キー制約で、どの購入履歴に紐づく配送先住所かを参照します。

## 画面遷移図
(画面遷移図を添付)

## 開発環境
- 言語: Ruby
- フレームワーク: Ruby on Rails
- データベース: PostgreSQL
- バージョン管理: Git

## ローカルでの動作方法※
 以下のコマンドを順に実行。
 % git clone https://github.com/xxxxxx
 % cd xxxxxx
 % bundle install
 % yarn install


