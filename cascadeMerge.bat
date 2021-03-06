@echo off

set /A numCapters = 7
set /A counter = %1
set /A inicialCounter = %1
set stage=%2
set inicialState=%2

cd %4

git checkout cp%counter%-%stage%


:mergeCicle
set oldStage=%stage%
set /A oldCounter = %counter%

if "%stage%" == "begin" ( 
set stage=end ) else (
set stage=begin
set /A counter = %counter%+1 )


git checkout cp%oldCounter%-%oldStage%

git checkout cp%counter%-%stage%

git pull origin cp%counter%-%stage%

git merge --no-ff --no-commit -X theirs cp%oldCounter%-%oldStage% 

git reset HEAD README.md

git checkout -- README.md

git commit -m %3

git push origin cp%counter%-%stage%


if %counter% lss %numCapters% ( goto mergeCicle 
) else ( if %counter% equ %numCapters% ( if not "%stage%" == "end " ( goto mergeCicle )))

cd ..