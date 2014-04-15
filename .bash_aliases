alias aliases='subl ~/.bash_aliases'
alias hosts='sudo subl /etc/hosts'

gotoproject(){
	cd ~/projects/$1
}
alias proj=gotoproject
alias s='subl'

alias paux='ps aux | grep'

alias psqlaux='ps aux | grep postgre'
alias psqlstart='sudo service postgresql start'
alias psqlrestart='sudo service postgresql restart'

alias be='bundle exec'

alias r='rails'
alias rs='rails server'
alias rc='rails console'
alias ss='script/server'
alias sc='script/console'

alias g='guard -n f'

alias z='zeus'
alias zstart='zeus start'
alias zs='zeus server'
alias zc='zeus console'
alias zt='zeus test'
alias ztt='zeus test test'
alias zmig='zeus rake db:migrate'
alias zroutes='zeus rake routes | grep'
alias ztprepare='zeus rake db:test:prepare'

alias tunit='ruby -Itest'
testunitfocus(){
	ruby -Itest $1 -n /focus/
}
alias tfocus=testunitfoucs

alias routes='rake routes | grep'
alias mig='rake db:migrate'
alias tprepare='rake db:test:prepare'

alias glog='git log'
alias gb='git branch'
alias gco='git checkout'
alias gl='git pull origin'
alias gp='git push origin'
alias gm='git merge'
alias gdelete='git branch -D'
alias commit='git add . && git add -u && git commit -m'
alias amend='git add . && git add -u && git commit --amend'

alias solr='rake sunspot:solr:start RAILS_ENV=development && rake sunspot:solr:start RAILS_ENV=test'

alias chromium_unsecure="chromium-browser --disable-web-security"

#Fix the swapped keys for the mac keyboard
alias fixkeyboard='echo 0 | sudo tee /sys/module/hid_apple/parameters/iso_layout'
