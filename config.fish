eval (pyenv init --path | source)
#view
set -g theme_display_git_default_branch yes
set -g theme_color_scheme terminal-dark

abbr -a gg git clone
abbr -a gi git init
abbr -a ga git add
abbr -a gc git commit -m
abbr -a gp git push origin 
abbr -a gs git status
abbr -a gb git branch
abbr -a gco git checkout
abbr -a gr git remote
abbr -a gra git remote add origin
abbr -a gf git fetch
abbr -a gm git merge
abbr -a gl git log

function gitmain
  git config --global user.name "HaradaKazunari"
  git config --global user.email "dbxkazuxdb@gmail.com"
  git config --list
end

function gitconnai
  git config --global user.name "connaiconnai"
  git config --global user.email "connaiconnai5252@gmail.com"
  git config --list
end

function gitmogu
  git config --global user.name "harada.k"
  git config --global user.email "dbxkazuxdb@gmail.com"
  git config --list
end


abbr -a hl heroku login
abbr -a hp git push heroku 
abbr -a ho heroku open
abbr -a ha heroku apps
abbr -a hd heroku destroy --app 
abbr -a hc heroku create  

abbr -a harada heroku git:clone -a haradakazunari
abbr -a connai heroku git:clone -a connaiconnai


abbr -a tl tmux ls
abbr -a tn tmux new -s
abbr -a ta tmux a -t 
abbr -a tk tmux kill-server

abbr -a react  npx create-react-app --template typescript  
function reactsetup
  /* npm install --save typescript @types/node @types/react @types/react-dom @types/jest */
  npm install --save @material-ui/core @material-ui/icons @material-ui/system
  npm install --save bootstrap react-bootstrap
  npm install --save node-sass
  npm install --save react-router-dom
end

function django
  python3 -m venv django
  source ./env/bin/activate.fish
  cd django
  pip3 install django
  django-admin startproject config
  cd config
end

  

abbr -a apache cd /Library/WebServer/Documents/
abbr -a win tmux split-window -d -p 30



set GHQ_SELECTOR peco

function setup
  curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
  fisher install jethrokuan/z && fisher install decors/fish-ghq && fisher install 0rax/fish-bd && fisher install oh-my-fish/plugin-balias && fisher install oh-my-fish/plugin-expand && fisher install oh-my-fish/plugin-peco && fisher install simnalamburt/shellder && fisher install oh-my-fish/theme-bobthefish
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim 
  git clone https://github.com/HaradaKazunari/configfile.git 
  mv configfile/.vimrc ~/ 
  mv configfile/.tmux.conf ~/ 
  mv configfile/config.fish ~/.config/fish/ 
  rm -rf configfile
end

function ide
  tmux split-window -h
  tmux resize-pane -L 55 
  tmux split-window -v
  tmux resize-pane -D 20 
  tmux split-window -h
  tmux select-pane -t 1
  tmux split-window -h
  tmux select-pane -t 3
  tmux resize-pane -R 20 
  tmux select-pane -t 4
end

function ide2
  tmux split-window -h
  tmux resize-pane -L 50 
  tmux split-window -h
  tmux select-pane -t 0
  tmux split-window -v
  tmux resize-pane -D 20 
  tmux select-pane -t 2
  tmux split-window -v
  tmux resize-pane -D 20 
  tmux select-pane -t 4
  tmux split-window -v
  tmux resize-pane -D 20 
  tmux select-pane -t 0
end

abbr host cd /Users/haradakazunari/docker/htdocs
abbr content cd wp-content/themes/
abbr todo vim /Users/kazu/todo.md
abbr rmds 'find . -name ".DS_Store" | xargs rm'
# abbr mymysql cd /Applications/MAMP/Library/bin/
