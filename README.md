### アプリ名
 Allage
### アプリケーション概要
古着コーデの投稿、タグ付け、タグの絞り込み検索、いいね機能
### アプリURL
 https://allage.herokuapp.com/
### テスト用アカウント
ユーザー名…きゅうり。
メールアドレス…test@test
パスワード…111111
### アプリ利用方法
・ログインしていないとき
…投稿の詳細を見ることができる、タグの絞り込み検索をすることができる。
・ログインをしているとき
…古着コーデの投稿ができる、投稿のいいねボタンを利用できる、投稿したユーザーは、投稿を編集、消去することができる

Allager
### 課題解決
・古着というジャンルがものすごく流行っているにも関わらず、古着だけのコーデを載せるアプリケーションが存在していなかったので今回このアプリケーションを作りました。また、ファッションのアプリでは投稿したコーデでキている服の購入店舗先があまり詳しく記載されていないこともあり、購入したいなと思っても実際には購入でいないという経験が何度もあったので、投稿する際に細かく記載してもらうようにカラムの量を多くしました。また、最近では年々誹謗中傷での被害がものすごく増してきているのでコメント機能をなくしました。
# テーブル設計

## usersテーブル
|Column                      | Type |Options                        |
|------------------------------ | -------- | ------------------------------ |
| nickname                  | string | null: false                    |
| email                        | string | null: false, unique: true |
| encrypted_password | string | null:false                     |
| height                       | integer | null: false                  |

### Association
  - has_many :posts, dependent: :destroy
  - has_many :likes, dependent: :destroy


## postsテーブル
| Column                 | Type          | Option      |
| -------------------------- | -------------  | -------------- |
| text                       | text           |                |
| tops_shop              | string       | null: false |
| tops_prefecture     | string       | null: false  |
| tops_brand             | string      | null: false  |
| tops_price               | integer    |null: false  |
| pants_shop              | string     |null: false |
| pants_prefecture_id | integer   | null: false |
| pants_brand             | string    | null: false |
| pants_price              | integer | null: false |
| shoes_shop              | string   | null: false |
| shoes_prefecture_id | integer | null: false |
| shoes_brand            | string   | null: false |
| shoes_price             | integer | null: false |



### Association
 - belongs_to :user
 - has_many :post_tags
 - has_many :tags, through: :post_tags
 -  has_many :likes, dependent: :destroy

 ## tagsテーブル
| Colum      | Typre     | Options                           |
| ------------- | ----------- | ------------------------------------ |
| tag_name| sturing  |                                          |

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
| Colum  | Typre         | Options                              |
| ---------- | --------------- | -------------------------------------- |
| post_id | references | null: false, foreign_key: ture |
| user_id | references | null: false, foreign_key: true |

  - belongs_to :post
  -  belongs_to :user

  ### 実装した機能
  ■ユーザー管理機能
  ・正しく情報を入力すれば新規登録ができます。
    https://gyazo.com/d35abb574e7acbc13d113d3d0746328d
  ・正しく情報を入力しなければエラーメッセージが表示されます。
    https://gyazo.com/d5adb7dc2030ae748b1fe852233f51da
  ・正しく情報を入力すればログインができます。
   https://gyazo.com/e10047bcebb010f37d973f79d0fb61de 
  ・正しく情報を入力しなければエラーメッセージが表示されます。
  https://gyazo.com/c15103fa729069dd48a46925f328867f
  ・ログアウトができます
  https://gyazo.com/4c10b3b48fd67cbee8a7f1c7d16ab88b
  ■投稿機能
  ・正しく情報を入力すれば投稿できます。
   https://gyazo.com/3cd4f4dfe089aacffab239218dacaa0e
  ・正しく情報を入力できなければエラーメッセージが表示されます。
  https://gyazo.com/69a844fa6d53813bfec80029e39f2052
  ■タグ絞り込み機能
  ・タグをクリックすると同じタグのある投稿一覧が表示されます。
  https://gyazo.com/3fcbfda38045ff39e5308100549003a4
  ■いいね機能
  ・ログインしているユーザーは、詳細ページでいいねボタンをおすことができます。
  https://gyazo.com/3be0ab44046216bd68045747d9ad6cb1
  ・ログインしていないユーザーは、詳細ページでいいねボタンが押せません。
  https://gyazo.com/ce8b21d49d8e294d75819734b23c09c6
  ### 実装予定の機能
  ・ユーザー詳細機能
  ・検索機能


