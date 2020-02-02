alias hrin='heroku login'
function hrcr() {
    git init;
    git add .;
    git commit -m "first commit";
    read -p "type app name >> " ms;
    heroku create $ms;
    git push heroku master;
}
alias hrcm='git add -A && git commit && git push heroku master'
alias hrop='heroku open'
alias hrls='heroku apps'
alias hrrm='heroku apps:destroy --app'

