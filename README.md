### アプリ名
 Allage
### アプリケーション概要
古着コーデの投稿、タグ付け、タグの絞り込み検索、いいね機能
### アプリURL
### テスト用アカウント
### アプリ利用歩法
・ログインをしているとき
…古着コーデの投稿ができる、投稿のいいねボタンを利用できる、投稿したユーザーは、投稿を編集、消去することができる

Allager
### 課題解決
・投稿を見た際に実際にキている服の購入先を知る
・ネットでの誹謗中傷をなくし誹謗中傷での被害をなくす
# テーブル設計

## usersテーブル
|Column                     | Type |Options     |
|---------------------------- | -------- | ------------- |
| nickname                      | string | null: false |
| email                       | string | null: false, unique: true |
| encrypted_password | string | null:false |
| height                | integer | null: false |

### Association
  - has_many :posts, dependent: :destroy
  - has_many :likes, dependent: :destroy


## postsテーブル
| Column    | Type          | Option                               |
| ------------- | --------------- | ------------------------------------ |
| text        | text            |                        |
| tops_shop | string   | null: false |
| tops_prefecture | string       | null: false                           |
| tops_brand | string        | null: false                           |
| tops_price     | integer        |null: false                         |
| pants_shop         | string       |null: false                        |
| pants_prefecture_id         | integer        | null: false                    |
| pants_brand         | string        | null: false                     |
| pants_price        | integer | null: false |
| shoes_shop | string| null: false |
| shoes_brand | string | null: false |
| shoes_price | integer | null: false |



### Association
 - belongs_to :user
 - has_many :post_tags
 - has_many :tags, through: :post_tags
 -  has_many :likes, dependent: :destroy

 ## tagsテーブル
| Colum | Typre         | Options                           |
| --------- | ------------- | ------------------------------------ |
| tag_name| sturing |                                          |

 ### Association
  - has_many :post_tags, dependent: :destroy, foreign_key: 'tag_id'
  -  has_many :posts, through: :post_tags
### post_tagsテーブル
| Colum | Typre | Options |
| --------- | ---------------- | ---------------------------------- |
| post_id | references | null: false, foreign_key: ture |
| user_id | references | null: false, foreign_key: true |

### Associartion
- belongs_to post
- belongs_to tag

### likesテーブル
| Colum | Typre | Options |
| --------- | ---------------- | ---------------------------------- |
| post_id | references | null: false, foreign_key: ture |
| user_id | references | null: false, foreign_key: true |

  - belongs_to :post
  -  belongs_to :user

  ### 実装した機能
  ・ユーザー管理機能
  ・新規投稿機能
  ・タグ機能
  ・タグ絞り込み検索機能
  ・いいね機能
  ### 実装予定の機能
  ・ユーザー詳細機能
  ・タグ検索機能
 ### データベース設計

 ### ローカルでの動作方法

