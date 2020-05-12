alias hrop='heroku open'
alias hrls='heroku apps'
alias hrin='heroku login'
alias hrrm='heroku apps:destroy --app'
alias hrcm='git add -A && git commit && git push heroku master'
hrcr() {
    git init;
    git add .;
    git commit;
    read ms"?type app name >> ";
    heroku create $ms;
    git push heroku master;
}
