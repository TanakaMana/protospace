== README
protospace
====
## 概要
プロトタイプ共有アプリケーション

デモURL：https://tnmn-protospace.herokuapp.com/
Ruby 2.3.1
Rails 4.2.5

実装機能：
- ユーザー管理機能
- プロトタイプ投稿・編集・削除機能（テキスト、画像、タグ）
- いいね機能（Ajax）
- コメント機能（Ajax）
- 最新/人気順sort機能
- タグ管理機能

# Database

## users

**association**
- has_many prototypes
- has_many comments

|column  |type   |
|:---|:---|
|id  |integer  |
|name  |string |
|image|text|
|email|string|
|password|string|
|member|string|
|profile|text|
|work|string|

## prototypes

**association**
- has_many prototype_thumbnails
- has_many comments
- has_many likes
- belongs_to user


|column  |type  |
|:-------|:-------|
|id|integer|
|user_id|references|
|title|string|
|catchcopy|string|
|concept|text|

## prototype_thumbnails

**association**
- belongs_to prototype


|column  |type  |
|:-------|:-------|
|id|integer|
|prototype_id|references|
|image|text|
|state|integer|

## comments

**association**
- belongs_to user
- belongs_to prototype


|column  |type  |
|:-------|:-------|
|id|integer|
|user_id|references|
|prototype_id|references|
|content|text|

## likes

**association**
- belongs_to user
- belongs_to prototype

|column  |type  |
|:-------|:-------|
|id|integer|
|user_id|references|
|prototype_id|references|
