# atsmile-api

![Ruby](https://img.shields.io/badge/Ruby-3.3.8-CC342D?logo=ruby) ![Rails](https://img.shields.io/badge/Rails-8.1.3-CC0000?logo=rubyonrails) ![PostgreSQL](https://img.shields.io/badge/PostgreSQL-blue?logo=postgresql) ![Docker](https://img.shields.io/badge/Docker-Kamal-2496ED?logo=docker) ![AWS](https://img.shields.io/badge/AWS-EC2-FF9900?logo=amazonec2)

ポートフォリオサイト ([portfolio.atsmile.dev](https://portfolio.atsmile.dev)) のバックエンド API。

Ruby on Rails 8 API モード + PostgreSQL 構成。プロフィール・経歴・スキル・制作実績をJSONで返します。

---

## 技術スタック

| 項目 | 内容 |
|---|---|
| 言語 | Ruby 3.3.8 |
| フレームワーク | Rails 8.1.3 (API モード) |
| データベース | PostgreSQL |
| テスト | RSpec |
| デプロイ | Kamal + Docker |

---

## セットアップ

### 前提

- Ruby 3.3.8
- PostgreSQL（起動済み）

### 手順

```bash
bundle install
bin/rails db:create db:migrate db:seed
bin/rails server
```

サーバーが `http://localhost:3000` で起動します。

開発時は `bin/dev` でも起動できます。

---

## API エンドポイント

ベースURL: `http://localhost:3000`

CORS は `http://localhost:3000` と `https://portfolio.atsmile.dev` を許可しています。

| メソッド | パス | 説明 |
|---|---|---|
| GET | `/api/v1/profile` | プロフィール情報 |
| GET | `/api/v1/careers` | 経歴一覧 |
| GET | `/api/v1/skills` | スキルグループ一覧 |
| GET | `/api/v1/works` | 制作実績一覧 |
| GET | `/api/v1/all` | 上記すべてをまとめて返す |
| GET | `/up` | ヘルスチェック |

<details>
<summary>レスポンス例 — GET /api/v1/all</summary>

```json
{
  "profile": {
    "name": "Tomoaki Hanafusa",
    "role": "Frontend Engineer",
    "roleJa": "フロントエンドエンジニア",
    "location": "宮崎県在住",
    "bio": "...",
    "experience": "フロントエンド開発 7年",
    "hobby": "...",
    "now": "...",
    "github": "https://github.com/atsmile"
  },
  "profileAnon": { "...": "名前・GitHubを匿名化したもの" },
  "aboutCards": [ { "title": "Profile", "body": "..." } ],
  "careers": [ { "period": "2018–2025", "title": "フロントエンドエンジニア", "description": "...", "is_current": true } ],
  "skillGroups": [ { "label": "Frontend", "skills": [ { "name": "React", "level": "main" } ] } ],
  "works": [ { "id": "portfolio", "title": "Portfolio", "tags": ["Next.js"], "category": "Portfolio" } ]
}
```

</details>

---

## データベース

### テーブル構成

```
profiles       — プロフィール（1レコード）
careers        — 経歴
skill_groups   — スキルグループ (Frontend / Backend / Tools / Infra / Other)
skills         — 各スキル (skill_groups に belongs_to)
works          — 制作実績
work_tags      — 実績のタグ (works に belongs_to)
```

### シードデータ投入

```bash
bin/rails db:seed
```

---

## テスト

```bash
bundle exec rspec
```

---

## CI

GitHub Actions で以下が実行されます。

- `rspec.yml` — RSpec によるテスト
- `ci.yml` — RuboCop（コードスタイル）・Brakeman（セキュリティ）・bundler-audit（脆弱性チェック）

---

## デプロイ

[Kamal](https://kamal-deploy.org/) + Docker でデプロイします。

```bash
bin/kamal deploy
```

必要な環境変数（`.kamal/secrets` に設定）:

| 変数名 | 説明 |
|---|---|
| `RAILS_MASTER_KEY` | `config/master.key` の値 |
| `DATABASE_URL` | 本番 PostgreSQL の接続URL |

---

## ディレクトリ構成

```
app/
├── controllers/api/v1/
│   ├── all_controller.rb      # 全データまとめ
│   ├── profile_controller.rb
│   ├── careers_controller.rb
│   ├── skills_controller.rb
│   └── works_controller.rb
└── models/
    ├── profile.rb
    ├── career.rb
    ├── skill_group.rb
    ├── skill.rb
    ├── work.rb
    └── work_tag.rb
config/
├── routes.rb
└── initializers/cors.rb
db/
├── migrate/
├── schema.rb
└── seeds.rb
```
