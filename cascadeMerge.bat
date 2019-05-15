set /A numCapters = 7
set /A counter = %1
set /A inicialCounter = %1
set stage=%2
set inicialState=%2

cd OpenSoft-GitHub-Self-CheckIn

git checkout cp%counter%-%stage%


:mergeCicle
set oldStage=%stage%
set /A oldCounter = %counter%

if "%stage%" == "begin" ( 
set stage=end ) else (
set stage=begin
set /A counter = %counter%+1 )

git branch cp%counter%-%stage%

git checkout cp%oldCounter%-%oldStage%

git checkout cp%counter%-%stage%

git pull origin cp%counter%-%stage%

git merge -X theirs cp%oldCounter%-%oldStage% 

git push origin cp%counter%-%stage%


if %counter% lss %numCapters% ( goto mergeCicle 
) else ( if %counter% equ %numCapters% ( if not "%stage%" == "end " ( goto mergeCicle )))

cd ..