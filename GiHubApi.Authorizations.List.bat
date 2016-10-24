:: AccessTokenの一覧取得
:: 
:: 引数一覧
:: %1 DIR_PROJECT	プロジェクトディレクトリパス
:: %2 USER_NAME		ユーザ名
@echo off
set DIR_AUTO=%~dp0
set DIR_PROJECT=%1
set USER_NAME=%2

cd %DIR_AUTO%

:: TSVファイルからPasswordを取得する
set PASS_WORD=
set q="C:/q-1.5.0/bin/q.bat"
set DIR_DB=C:/Account/GitHub/
set TSV_ACCOUNT="%DIR_DB%/meta_Accounts.tsv"
set TokenDescription=RepositoryControl
FOR /F "usebackq" %%i in (`call %q% -H -t -e UTF-8 -E SJIS "select Password from %TSV_ACCOUNT% where Username == '%USER_NAME%'"`) DO set PASS_WORD=%%i

cd %DIR_PROJECT%

set CURL_PEM=C:\Program Files\Git\ssl\certs\cacert.pem
set RESPONSE="GitHub.%USER_NAME%.Authorizations.json"
@echo on
curl --cacert "%CURL_PEM%" -o %RESPONSE% -u "%USER_NAME%:%PASS_WORD%" https://api.github.com/authorizations
@echo off

pause
@echo on
