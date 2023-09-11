@echo off
:start
REM Let the user have an input for the commit comment.
ECHO Enter commit statement:
SET /p input=""
GOTO check
  

:check
REM Checks if the input is blank.
IF "%input%" == "" (
	ECHO [93mInput is Empty![0m
	GOTO start
) ELSE (
	GOTO commit
)

:commit
REM Goes to the Folder to Push on Git.
CD /D "<Your Git Folder Directory Here>"
REM You can remove this, px.exe helps to bypass my school proxy.
start H:\v0.4.0\px.exe
REM Git add, commit and push
git.exe add .
git.exe commit -m "%input%"
git.exe push

REM This if statement checks if there is an error in the commit phase.
IF %errorlevel% == 0 (
cls
echo [92mSuccessfully Committed And Pushed.[0m
) ELSE (
echo [91mNot Committed. Error.[0m
)

:exit
EXIT /B