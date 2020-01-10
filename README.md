
# README　このアプリについて
***

## :gift:Fmarket（メルカリコピーサイト）とは
プログラミングスクールTECH::EXPERT64期最終課題制作物。
スクラム（チーム５人）によるアジャイル開発により制作。
メルカリの機能である新規会員登録・ログイン機能・商品出品機能・商品購入機能・商品編集機能などを忠実に再現した。

## :memo:概要
* :gift:アプリ名：Fmarket
* :jp:使用言語：HTML/CSS/Ruby/Rails/JavaScript/jQuery/MySQL/AWS/Github/Visual Studio Code
* :computer:機能：新規会員登録・ログイン機能・商品出品機能・商品購入機能・商品編集機能・パンくず機能・コメント機能
* :couple:作業人数：5人
* :date:作業期間：約4週間
* :page_facing_up:タスク管理：Trello

## :earth_africa:URL
### URL：[http://3.113.185.115/](http://3.113.185.115/)

Basic認証をかけています。閲覧時は以下のIDとPassを入力してください。
### :lock:ID&Pass
* :id:ID: mercari64j
* :key:Pass:6464

## :memo:テスト用アカウント

### :moneybag:購入者アカウント
* :envelope:メール：buyer_user@gmail.com
* :key:パスワード: buyer_user

### :credit_card:購入用カード情報
* :black_nib:番号：4242424242424242
* :date:期限：2020年12月
* :key:セキュリティコード：123

### :gift:出品者用アカウント
* :envelope:メール：seller_user@gmail.com
* :key:パスワード：seller_user

## Githubリポジトリ
### URL：[https://github.com/kasugatakuya/freemarket_sample_64j](https://github.com/kasugatakuya/freemarket_sample_64j)

## :computer:機能詳細
### トップページ
![443e569470d212910f0847177034a30e](https://user-images.githubusercontent.com/57311079/72126763-adb80380-33b0-11ea-88b3-fa778a2c19a1.gif)

### 商品出品機能
![27d7c8356910f4ad8ad04bad913616dd](https://user-images.githubusercontent.com/57311079/72127280-8104eb80-33b2-11ea-8b8d-4c1dee5efa3a.gif)

### 商品詳細ページ
![64f63b6e4d396cbacdb96b1fbd0de5b3](https://user-images.githubusercontent.com/57311079/72127481-26b85a80-33b3-11ea-8c6d-cff0cd01e110.gif)

### 商品編集ページ
![3b08c8991394634587f0170b802ad344](https://user-images.githubusercontent.com/57311079/72129557-fd4efd00-33b9-11ea-88e1-1cc1103160f2.gif)

### 商品購入機能
![c1d1cb40747b2e899e84ccf5a2f175b7](https://user-images.githubusercontent.com/57311079/72129791-d9d88200-33ba-11ea-959f-0400c05c63d6.gif)

### コメント機能
![db201a0b4a1e87a0083f6a1c461827f8](https://user-images.githubusercontent.com/57311079/72130231-2ec8c800-33bc-11ea-8110-ad258f47933e.gif)


## users テーブル

| Column          | Type   | Options                 |
| --------------- | ------ | ----------------------- |
| nickname        | string |                         |
| email           | string | null: false,unique:true |
| first_name      | string | null: false             |
| last_name       | string | null:false              |
| first_name_kana | string | null:false              |
| last_name_kana  | string | null:false              |
| birthyear       | string | null:false              |
| birthmonth      | string | null:false              |
| birthday        | string | null:false              |
| telephone       | string | null:false              |
| icon            | text   |                         |
| text            | text   | null:false              |

### Association

has_one:address, dependent: :destroy
has_many:messages, dependent: :destroy
has_many:items, dependent: :destroy
has_many:comments, dependent: :destroy
has_many:likes, dependent: :destroy

## address テーブル

| Column          | Type    | Options                     |
| --------------- | ------- | --------------------------- |
| first_name      | string  | null: false                 |
| last_name       | string  | null:false                  |
| first_name_kana | string  | null:false                  |
| last_name_kana  | string  | null:false                  |
| post_cord       | integer | null:false                  |
| prefecture_id   | string  | null:false                  |
| city            | string  | null:false                  |
| address         | string  | null:false                  |
| building        | text    |                             |
| telephone       | string  |                             |
| user_id         | integer | null:false,foreign_key:true |

### Association

belongs_to:user

## likes テーブル

| Column  | Type    | Options                     |
| ------- | ------- | --------------------------- |
| item_id | integer | null:false,foreign_key:true |
| user_id | integer | null:false,foreign_key:true |

### Association

belongs_to:item
belongs_to:user

## items テーブル

| --------------- | ------- | ---------- |
| Column | Type | Options |
| name | string | null:false |
| size | string | |
| condition | string | null:false |
| shipping_method | string | null:false |
| shipping_days | string | null:false |
| shipping_area | string | null:false |
| shipping_price | integer | null:false |
| price | integer | null:false |
| text | text | null:false |
| seller_id | integer | null:false |
| buyer_id | integer | |
| brand_id | integer | |
| category_id | references | null:false,foreign_key:true|
| prefecture_id | integer | null:false |
| sale_status | string | null:false |

### Association

belongs_to:user
belongs_to:category, dependent: :destroy
has_many:item_images, dependent: :destroy
has_many:messages, dependent: :destroy
belongs_to:bland, dependent: :destroy
has_many:likes, dependent: :destroy
has_many:comments, dependent: :destroy

## categories テーブル

| Column     | Type   | Options    |
| ------     | ------ | ---------- |
| name       | string | null:false |
| ancestry   | string | null:false |

### Association

has_many:items

## item_images テーブル

| Column  | Type    | Options                     |
| ------- | ------- | --------------------------- |
| image   | text    |                             |
| item_id | integer | null:false,foreign_key:true |

### Association

belongs_to:item

## comments テーブル

| Column  | Type    | Options                     |
| ------- | ------- | --------------------------- |
| text    | text    | null:false                  |
| item_id | integer | null:false,foreign_key:true |
| user_id | integer | null:false,foreign_key:true |

### Association

belongs_to:item
belongs_to:user

## messages テーブル

| Column    | Type    | Options                     |
| --------- | ------- | --------------------------- |
| text      | text    | null:false                  |
| item_id   | integer | null:false,foreign_key:true |
| buyer_id  | integer | null:false,foreign_key:true |
| seller_id | integer | null:false,foreign_key:true |

### Association

belongs_to:item
belongs_to:user

## brands テーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association

has_many:items
has_many:genres,through: :brands_genres
has_many:brands_genres

## brands_genres テーブル

| Column   | Type    | Options                     |
| -------- | ------- | --------------------------- |
| brand_id | integer | null:false,foreign_key:true |
| genre_id | integer | null:false,foreign_key:true |

### Association

belongs_to:brand
belongs_to:genre

## genres テーブル

| Column | Type   | Options    |
| ------ | ------ | ---------- |
| name   | string | null:false |

### Association

has_many:brands,through: :brands_genres
has_many:brands_genres



## cards テーブル

| Column        | Type   | Options    |
| ------        | ------ | ---------- |
| user_id       | integer | null:false |
| customer_id   | integer | null:false |
| card_id       | integer | null:false |

### Association
#後ほど記入
#belongs_to :user 



##  residencesテーブル

| Column          | Type   | Options    |
| ------          | ------ | ---------- |
| prefecture_id   | integer | null:false |
| city            | text | null:false |

### Association
#後ほど記入
#belongs_to_active_hash :prefecture

