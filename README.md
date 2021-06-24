テックキャンプの学習期間にて作成したオリジナルアプリについて紹介します。
自身で実装した箇所、および開発を通じて得られた経験についても紹介します。

# アプリケーション名
たけラボ

# アプリケーション概要
TECH::CAMP最終課題として作成したフリマサイトの応用で実装した教育アプリです。
DB設計、要件定義、UI、UX設計に至るまで全て自分達で実装しました。
実装で詰まった場合は、これまで学んだことを復習し、公式ドキュメントや、参考サイトを確認しながら行いました。


# 接続先情報
## Basic認証
- [Takelaboratory](https://takelaboratory.herokuapp.com/)
- ID: take
- PW: 0720
## テストユーザー等
- 出品者用アカウント
  - ID: 【保留】
  - PW: 【保留】
- 購入者用アカウント
  - ID: hoge@gmail.com
  - PW: hoge1111
- 購入者用クレジットカード情報
  - カード番号: 4242424242424242
  - 有効期限: 現在日より以降の日付
  - セキュリティコード: 123

## 利用方法
- Chromeの最新版を利用してアクセスしてください。
  - 接続先およびログイン情報については、上記の通りです。
  - テストアカウントでログイン→トップページから出品クラウド画像押下→クラウド商品購入入力→購入
  - 確認後、ログアウト処理をお願いします。
  
##### 目指した課題解決
- 新しいことを学ぶことに「つまらない」と感じる人が、『ゲーム感覚』で楽しめて覚えられるようなものを提供しました。
- 教育機関での時間限定で学ぶのではなく、ネット環境があるところでいつでも場所を問わず気軽に学べるものを提供しました。
- 常識に捉われず未来のある子どもにとって有益な教育コンテンツを提案。登録者はそのコンテンツを選択し、参加するという流れを表現しました。

##### 開発期間: 約３週間
##### 一日当たりの開発時間: 10〜12時間
##### 実装機能一覧
- ユーザー新規登録、ログイン機能
- クラウド出品機能、編集、削除機能
- クラウド購入機能（Pay.jp使用）
- クイズ大会（ランキング機能付き）
[![Image from Gyazo](https://i.gyazo.com/19d0b28041699ce9c800256705f4d719.gif)](https://gyazo.com/19d0b28041699ce9c800256705f4d719)

- youtubeライブ講義機能（非同期通信チャット機能実装）
[![Image from Gyazo](https://i.gyazo.com/af535eac06f2e874a1f05533fe927541.gif)](https://gyazo.com/af535eac06f2e874a1f05533fe927541)

- 単体テスト（バリデーションチェック）

##### 使用技術
- 開発環境
  - Ruby/Ruby on Rails/css/JavaScript/Jquery/MySQL/Github/Visual Studio Code
- 本番環境（*著作権の関係で後日公開予定）
  - AWS(EC2 , S3)/MySQL/Capistrano/Unicorn

# 開発担当箇所
- DB設計
  - 必要なテーブル、カラムの選定
  - アソシエーションの決定
  - ER図の作成
  - 各種制約の決定

# 実装予定の機能
- 本番環境へのデプロイ
  - サーバーはAWS EC2インスタンスを使用しています。
  - WebサーバーにはNginx、アプリケーションサーバーにはUnicornを使用してデプロイをしています。
  - 投稿した画像についてはAWS S3に保存されるよう設定。
  - Capstranoによる自動デプロイ機能を実装しています。
  - ドメインを取得し、Route53によるドメイン関連付けを行いました。


## users テーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| nickname           | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| last_name          | string | null: false              |
| first_name         | string | null: false              |
| last_name_kana     | string | null: false              |
| first_name_kana    | string | null: false              |
| birth_day          | date   | null: false              |

### Association

- has_many   :items
- has_many   :orders
- has_many   :quizzes

## quizzes テーブル

|  Column          |  Type      |  Options                       |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user


## items テーブル

|  Column          |  Type      |  Options                       |
| ---------------- | ---------- | ------------------------------ |
| product_name     | string     | null: false                    |
| description      | text       | null: false                    |
| category_id      | integer    | null: false                    |
| judgement_id     | integer    | null: false                    |
| shipping_cost_id | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_days_id | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order


## orders テーブル

|   Column       |  Type      |   Options                      |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one    :address


## addresses テーブル

|   Column         |  Type      |   Options                      |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| shipping_area_id | integer    | null: false                    |
| city_name        | string     | null: false                    |
| block_name       | string     | null: false                    |
| building_name    | string     |                                |
| phone_number     | string     | null: false                    |
| purchase         | references | null: false, foreign_key: true |

### Association

- belongs_to :order
