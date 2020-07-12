#!/bin/sh

# Symbolic links
echo "======== Creating symbolic links... ========"

# dotfiles/git/*
for f in git/.??*
do
    ln -sf $HOME/dotfiles/$f $HOME
done

# dotfiles/zsh/*
for f in zsh/.??*
do
    if [[ `uname` == "Darwin" ]]; then
        [[ "$f" == "zsh/.zshenv.linux" ]] && continue
        [[ "$f" == "zsh/.zshrc.linux" ]] && continue

        echo "Mapping $f..."
        ln -sf $HOME/dotfiles/$f $HOME/${${f##*/}%%.darwin}
    elif [[ `uname` == "Linux" ]]; then
        [[ "$f" == "zsh/.zshenv.darwin" ]] && continue
        [[ "$f" == "zsh/.zshrc.darwin" ]] && continue

        echo "Mapping $f..."
        ln -sf $HOME/dotfiles/$f $HOME/${${f##*/}%%.linux}
    fi
done

# dotfiles/bash/*
for f in bash/.??*
do
    echo "Mapping $f..."
    ln -sf $HOME/dotfiles/$f $HOME/${f##*/}
done

# dotfiles/*
for f in .??*
do
    # symlinkを貼りたくないファイルを以下に書いておく
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".gitmodules" ]] && continue

    echo "Maping $f..."
    ln -sf $HOME/dotfiles/$f $HOME
done

echo "========     Finished mapping!      ========"
