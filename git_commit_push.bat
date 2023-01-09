git add *

set /p "message=Enter your commit message: "
git commit -m "%message%"

git push origin main
