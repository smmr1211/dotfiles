# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias emacs="/Applications/MacPorts/Emacs.app/Contents/MacOS/emacs -nw"
export JAVA_HOME=/opt/local/Library/Java/JavaVirtualMachines/openjdk11-zulu/Contents/Home

# 色を使用できるようにする
autoload -Uz colors
colors

# プロンプト
#PROMPT='[%B%F{red}%n%f%b]%F{cyan}%f '
alias unmount_ssk='disk_id=$(diskutil list | grep "Extreme SSD" | awk "{print \$NF}"); diskutil unmountDisk /dev/$disk_id'

# 右にカレントディレクトリのパスを表示
#RPS1='[%h]'
#RPROMPT='[ %B%F{green}%~%f%b ]'
#補完
autoload -U compinit
compinit
setopt IGNORE_EOF
setopt CORRECT
setopt CORRECT_ALL
setopt SHARE_HISTORY
# setopt HIST_IGNORE_DUPS # logを残す意味でhistoryを使いたいので、無効化
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_NO_STORE
eval 'dircolors' 1&>/dev/null
export LS_COLORS='di=20:fi=35'
SPROMPT="correct> %R -> %r [nyae]? "

# historyの検索とカーソル位置の変更
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N hisotory-beginning-search-forward-end history-search-end
zle -N hisotory-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end #Ctrl + P に機能を割り当てる
bindkey "^N" history-beginning-search-forward-end

# 内部コマンドのrun-help
autoload run-help

export WORDCHARS='*?_-.[]~=&;!#$%^(){}<'

#.oファイルなどを補完候補に出さない                                                    
fignore=(.o .aux .log .bbl .blg .lof .dvi .fls .fdb_latexmk .synctex.gz .lot .toc .out .a\~)

alias tls="tmux ls"
alias ls="ls -G -F"
alias ez="emacs ~/.zshrc"
alias nz="nvim ~/.zshrc"
alias sz="source ~/.zshrc"
alias -g G="| grep"
alias -g L="| less"
alias -g H="| head"
alias nap="source ~/venv/napari/bin/activate"
alias -g T="| tail"
alias dirs="dirs -v"
alias which="which -a"
alias seg="cd ~/Research/Code/ML_Segmentation/Brownian_project/syntheticbrownianseg/"

setopt MENU_COMPLETE
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt INTERACTIVE_COMMENTS
setopt NUMERIC_GLOB_SORT
setopt NO_BEEP

# 引数に与えたファイルをゴミ箱に移動
del(){
    mv $* ~/.Trash
 }

backup-nvim () {
        local timestamp=$(date "+%Y-%m-%d-%H%M")
        echo "Backup following directories"
        echo "  ~/.config/nvim      => ~/.config/nvim.${timestamp}"
        echo "  ~/.local/share/nvim => ~/.local/share/nvim.${timestamp}"
        echo "  ~/.local/state/nvim => ~/.local/state/nvim.${timestamp}"
        echo "  ~/.cache/nvim       => ~/.cache/nvim.${timestamp}"
        mv ~/.config/nvim ~/.config/nvim.${timestamp}
        mv ~/.local/share/nvim ~/.local/share/nvim.${timestamp}
        mv ~/.local/state/nvim ~/.local/state/nvim.${timestamp}
        mv ~/.cache/nvim ~/.cache/nvim.${timestamp}
}

restore-nvim () {
        local backup_array=(${(f)"$(command ls -1d ~/.config/nvim.* | sort -nr | sed -e 's/.*nvim/nvim/')"})
        if [ $#backup_array = 0 ]
        then
                echo "No backup directory found"
                return 1
        fi
        for ((i = 1; i <= $#backup_array; i++)) do
                print -r -- "[$i] $backup_array[i]"
        done
        echo ""
        echo -n "Select index: "
        re='^[0-9]+$'
        read index
        if ! [[ $index =~ $re ]]
        then
                echo "Error: Not a number"
                return 1
        fi
        if [ $index -gt $#backup_array ]
        then
                echo "index must be less than $#backup_array"
                return 1
        fi
        if [ $index -lt 1 ]
        then
                echo "index must be greater than 1"
                return 1
        fi
        local selected=$backup_array[$index]
        echo "Selected: $selected"
        local backup_config="$HOME/.config/$selected"
        local backup_share="$HOME/.local/share/$selected"
        local backup_state="$HOME/.local/state/$selected"
        local backup_cache="$HOME/.cache/$selected"
        if [ ! -d $backup_config -o ! -d $backup_share -o ! -d $backup_state -o ! -d $backup_cache ]
        then
                echo "backup directory not found"
                return 1
        fi
        echo ""
        echo "Restore following directories"
        echo ""
        echo "  $backup_config      => ~/.config/nvim"
        echo "  $backup_share => ~/.local/share/nvim"
        echo "  $backup_state => ~/.local/state/nvim"
        echo "  $backup_cache       => ~/.cache/nvim"
        echo ""
        echo "This operation will overwrite the above directories."
        echo -n "Proceed? [y/N] "
        read yesno
        if [ $yesno = "y" -o $yesno = "Y" ]
        then
                if [ -d ~/.config//nvim ]
                then
                        rm -rf ~/.config/nvim
                fi
                if [ -d ~/.local/share/nvim ]
                then
                        rm -rf ~/.local/share/nvim
                fi
                if [ -d ~/.local/state/nvim ]
                then
                        rm -rf ~/.local/state/nvim
                fi
                if [ -d ~/.cache//nvim ]
                then
                        rm -rf ~/.cache/nvim
                fi
                mv $backup_config ~/.config/nvim
                mv $backup_share ~/.local/share/nvim
                mv $backup_state ~/.local/state/nvim
                mv $backup_cache ~/.cache/nvim
        fi
}

if [[ $TERM == 'xterm-kitty' ]]; then
    alias ssh='kitten ssh'
    fi
export PATH=/opt/local/bin/latexindent:$PATH
alias gitlog='git log --oneline --graph --decorate'
alias r='pokemon-colorscripts -r'

path=($HOME/.local/lib/npm/bin /Applications/kitty.app/Contents/MacOS $path)

autoload -U compinit
compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export DISPLAY=:0
path=($HOME/.local/bin $path)

chpwd() {
ls -G -F
}
alias c='command git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
setopt extended_glob

# README.md に画像を挿入する関数
git-add-screenshot () {
  # I need colors!
  autoload -Uz colors;
  colors
  if [ $# -lt 1 ]; then
    echo "Usage: $0 imagefile [branch_name (default: images)]"
    echo "  Create 'images (by default)' branch and push image file to GitHub/GitLab."
    echo "  The URL to pushed image file is also copied to your clipboard."
    echo "  (ex.) $0 screenshot.png"
    return 1
  fi
  if [ ! -d .git ]; then
    echo "You are ${fg_bold[red]}not in a git repository${reset_color}."
    echo "Please 'cd' to the git repository where you want to add a screenshot."
    return 1
  fi
  if [ $# -gt 1 ]; then
    branch_name=$2
  else
    branch_name="images"
  fi
  if git switch ${branch_name} &>/dev/null; then
    echo "A branch named '${fg_bold[red]}${branch_name}${reset_color}' already exists in your local repo."
    echo "Please specify the branch name like: ${fg_bold[cyan]}$0 \$somewhere/screenshot.png branch_screenshot${reset_color}"
    git checkout - &>/dev/null
    return 1
  fi
  if git fetch origin ${branch_name} &>/dev/null; then
    echo "A branch named '${fg_bold[red]}${branch_name}${reset_color}' already exists in origin."
    echo "Please specify the branch name like: ${fg_bold[cyan]}$0 \$somewhere/screenshot.png branch_screenshot${reset_color}"
    return 1
  fi

  # here we go.
  imagefile=$(basename $1)
  target_branch="${default_branch:-$(git branch --show-current)}"
  git checkout --orphan ${branch_name} &&
  git rm --cached -rf . &&
  command rm -rf *(N) &&
  command rm -f .gitignore(N) &&
  command cp $1 . &&
  git add -f $imagefile &&
  git commit -m 'Add screenshot' &&
  git push origin ${branch_name} &&
  local origin_ghl=$(git config --get remote.origin.url)
  local repo=$(echo "$origin_ghl" | sed -E 's/.*(github\.com|gitlab\.com)[:\/](.*)\.git$/\2/')
  local url=""
  if test "${origin_ghl#*github}" != "$origin_ghl"; then
    echo "GitHub";
    # url="https://github.com/username/reponame/raw/${branch_name}/screenshot.png"
    baseurl="https://github.com/"
    url="${baseurl}${repo}/raw/${branch_name}/${imagefile}"
  elif test "${origin_ghl#*gitlab}" != "$origin_ghl"; then
    echo "GitLab";
    # url="https://gitlab.com/username/reponame/-/raw/${branch_name}/screenshot.png"
    baseurl="https://gitlab.com/"
    url="${baseurl}${repo}/-/raw/${branch_name}/${imagefile}"
  fi
  echo "${fg_bold[cyan]}## Screenshot
![screenshot]($url)${reset_color}"
  if hash pbcopy >/dev/null 2>&1; then  # check whether pbcopy command exists
    echo "## Screenshot
![screenshot]($url)" | pbcopy
    echo "Template for ${fg_bold[green]}README.md${reset_color} is copied to your clipboard."
  fi
  git checkout ${target_branch} &>/dev/null
  echo "Now, do the following:"
  echo "${fg_bold[yellow]}"
  echo "git add README.md"
  echo "git commit -m 'Add screenshot to README'"
  echo "git push origin ${target_branch}"
  echo "${reset_color}"
}

# PDFの圧縮
function pdfmin()
{
    (
        local cnt=0
        for i in "$@"; do
            (
                local in_file="${i}"
                local out_file="${i%.*}.min.pdf" 

                local size_before=$(wc -c < "${in_file}")

                # 実際の圧縮処理
                gs -sDEVICE=pdfwrite \
                   -dCompatibilityLevel=1.4 \
                   -dPDFSETTINGS=/ebook \
                   -dNOPAUSE -dQUIET -dBATCH \
                   -sOutputFile="${out_file}" "${in_file}"

                # 圧縮後のファイルサイズ（バイト数）を取得
                local size_after=$(wc -c < "${out_file}")

                awk -v before="${size_before}" -v after="${size_after}" -v name="${in_file}" 'BEGIN {
                    mb_before = before / 1048576;
                    mb_after = after / 1048576;
                    ratio = (before > 0) ? (after / before) * 100 : 0;
                    printf "%s : %.2f MB -> %.2f MB (%.1f%%)\n", name, mb_before, mb_after, ratio;
                }'
            ) &
            
            (( (cnt += 1) % 4 == 0 )) && wait
        done
        wait && echo "DONE!!" && return 0
    )
}
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/bin:$PATH"
export RUBYOPT="-r logger"
