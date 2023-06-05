# mt-docker-template
Movable Type 7 x Docker のテンプレート

## 技術スタック
| 名称 | バージョン | 備考 |
| ---- | ---------- | ---- |
| [Movable Type](https://www.movabletype.jp/) | 7 | 略: MT|
| [Docker](https://www.docker.com/) | Docker Composeを使用 |

## Movable Typeの公開パス
以下に合わせて構築しているため、変更する場合は諸々の設定ファイルを編集してください。  

サイトURL：`http://localhost:8080/`  
サイトパス：`/var/www/html/mt`

### 設定ファイル
- `./mt-data/cgi-bin/mt/mt-config.cgi`
- `./mt-data/htdocs/.htaccess`
- `./docker-compose.yml`
- `./Dockerfile`
- `./setup.sh`

## セットアップ
### 初回のみ
1. MTのライセンスを取得（zip形式）
2. zipを解凍
3. `mt-static`フォルダを`./mt-data/htdocs`直下に移動
4. その他の全ファイルを`./mt-data/cgi-bin/mt`直下に移動
5. 以下に沿ってDocker環境を構築  
※ `.env`のデータベース系を編集した場合は、`./mt-data/cgi-bin/mt/mt-config.cgi`のデータベース情報を`.env`に合わせてください  
※ 本番環境では`./mt-data/cgi-bin/mt/mt-config.cgi`のデータベース情報を変更してください
```
cp .env.example .env

docker-compose build --no-cache
docker-compose up -d

open http://localhost:8080/cgi-bin/mt/mt.cgi
```

### 2回目以降
```
docker-compose up -d

open http://localhost:8080/cgi-bin/mt/mt.cgi
```

### エラーと対処法
#### Connection error: Can't connect to MySQL server on 'db' (115)
MTの管理画面にて上記エラーが表示された場合、MySQLに接続できない。というエラーです。  
データベース周りの設定を変更した場合は、[設定ファイル](#設定ファイル)を見直してください。  

設定を変更していない場合は、DBの起動に時間がかかっている、もしくはmysqld.sock周りの設定がおかしくなっている可能性が高いです。  
少し待ってもエラーが解消しない場合は、Dockerコンテナ・イメージ・ボリュームを削除し、作り直します。  
```
docker-compose down --rmi all --volumes --remove-orphans
```

上記を実行後、[セットアップ](#セットアップ)の初回のみの5番からやり直してください。  
MTの保存データはリセットされるため、注意が必要です。バックアップを忘れずに行ってください。

## コマンド一覧
| コマンド| 概要 | 説明 |
| ------- | ---- | ---- |
| `docker-compose build` | ローカルサーバー起動のための準備 | Dockerイメージを作成 |
| `docker-compose up -d` | ローカルサーバー起動 | Dockerコンテナを作成 & サービスを起動 |
| `docker-compose down` | ローカルサーバー停止 & 削除 | Dockerコンテナを停止 & 削除 |
