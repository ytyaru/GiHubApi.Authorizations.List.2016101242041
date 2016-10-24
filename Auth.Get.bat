@echo off
set DIR_PROJECT=%~dp0
set USER_NAME=user1
GiHubApi.Authorizations.List.bat %DIR_PROJECT% %USER_NAME%
pause
@echo on
