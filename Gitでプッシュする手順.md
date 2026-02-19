# Git にプッシュする手順

## 初回だけ：リポジトリの準備

### 1. GitHub で新しいリポジトリを作る

1. [GitHub](https://github.com) にログイン
2. 右上の **+** → **New repository**
3. リポジトリ名を入力（例: `slide` や `fujita-denki-plan`）
4. **Create repository** をクリック
5. 表示された **リポジトリのURL** をコピー  
   例: `https://github.com/あなたのユーザー名/slide.git`

---

### 2. このフォルダで Git を初期化してプッシュ

**PowerShell** または **コマンドプロンプト** で、このフォルダに移動してから実行します。

```powershell
cd "d:\cursur\slide"
```

#### 初回のみ（まだ Git を使っていない場合）

```powershell
# リポジトリを初期化
git init

# 全ファイルを追加（.gitignore で除外したものは除く）
git add .

# 最初のコミット
git commit -m "初回：事業計画書（図解・画像付き）を追加"
```

#### リモートを登録してプッシュ

**※ 以下の `リポジトリのURL` は、手順1でコピーしたURLに置き換えてください。**

```powershell
# リモートを追加（名前は慣例で origin）
git remote add origin リポジトリのURL

# メインブランチの名前を main にする（GitHub の標準に合わせる）
git branch -M main

# プッシュ
git push -u origin main
```

**例（URL が https://github.com/fujim/slide.git の場合）**

```powershell
git remote add origin https://github.com/fujim/slide.git
git branch -M main
git push -u origin main
```

初回プッシュ時に、GitHub の **ユーザー名** と **パスワード** を聞かれた場合、パスワードには **Personal Access Token（個人アクセストークン）** を使います。  
トークンの作成: GitHub → Settings → Developer settings → Personal access tokens → Generate new token

---

## 2回目以降：変更をプッシュするとき

```powershell
cd "d:\cursur\slide"

# 変更内容を確認
git status

# 変更をすべて追加
git add .

# コミット（メッセージは変更内容に合わせて）
git commit -m "〇〇を修正"

# プッシュ
git push
```

---

## よく使うコマンド一覧

| やりたいこと           | コマンド              |
|------------------------|-----------------------|
| 状態確認               | `git status`          |
| 変更を追加             | `git add .`           |
| コミット               | `git commit -m "メッセージ"` |
| プッシュ               | `git push`            |
| リモートのURL確認      | `git remote -v`       |

---

## トラブル時

- **「remote origin already exists」**  
  すでに `origin` が登録されています。別のURLに変えたい場合:  
  `git remote set-url origin 新しいURL`

- **「Permission denied」**  
  GitHub にログインできていません。トークンを使うか、SSH キーを設定してください。

- **「failed to push」**  
  リモートに先にコミットがある場合:  
  `git pull origin main --rebase` を実行してから、もう一度 `git push`
