#!/bin/bash

# ==========================================
# 1. 必要なツールのインストール
# ==========================================

# Oh My Zsh のインストール
# (RUNZSH=no をつけることで、インストール途中でzshが起動してスクリプトが止まるのを防ぐ)
echo "Installing Oh My Zsh..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Powerlevel10k のインストール
echo "Installing Powerlevel10k..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# ==========================================
# 2. dotfiles (Bareリポジトリ) のセットアップ
# ==========================================

echo "Setting up dotfiles..."

# GitHubからクローン
git clone --bare git@github.com:smmr1211/dotfiles.git $HOME/.dotfiles

# エイリアスをスクリプト内でも使えるように定義
function dotfiles {
  /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME "$@"
}

# Untrackedファイルを非表示にする設定
dotfiles config --local status.showUntrackedFiles no

# Oh My Zshが勝手に作ったデフォルトの .zshrc があるとコンフリクトするので削除
rm -f ~/.zshrc

# 自分の設定ファイルを強制展開
dotfiles checkout -f

echo "Setup completed successfully! Please restart your terminal or run 'zsh'."
