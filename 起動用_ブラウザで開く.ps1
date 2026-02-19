# 事業計画書を簡易サーバーで開く（PowerShell版）
# 画像が確実に表示されます。
#
# 【実行方法】
#   1. PowerShell を開く
#   2. cd "d:\cursur\slide"   （このフォルダに移動）
#   3. .\起動用_ブラウザで開く.ps1
#
# 「スクリプトの実行が無効です」と出る場合:
#   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
#   を一度だけ実行してから、再度 3 を実行してください。

$port = 8080
Set-Location $PSScriptRoot

# ブラウザを開く
Start-Process "http://localhost:$port"

# Python で簡易サーバー起動
try {
    python -m http.server $port
} catch {
    Write-Host "Python が見つかりません。代わりに次のコマンドを試してください:" -ForegroundColor Yellow
    Write-Host "  npx -y serve -p 8080" -ForegroundColor Cyan
    Write-Host "実行後、ブラウザで http://localhost:8080 を開いてください。" -ForegroundColor Gray
}
