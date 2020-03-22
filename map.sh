#!/bin/sh

# Symbolic links
echo "======== Creating symbolic links... ========"
for f in .??*
do
    # symlinkを貼りたくないファイルを以下に書いておく
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".gitignore" ]] && continue
    [[ "$f" == ".gitmodules" ]] && continue

    if echo "$f" | grep ".zsh" >/dev/null; then
        if [[ `uname` == "Darwin" ]]; then
            [[ "$f" == ".zshenv.linux" ]] && continue
            [[ "$f" == ".zshrc.linux" ]] && continue

            echo "Mapping $f..."            
            ln -sf $HOME/dotfiles/$f $HOME/${f%%.darwin}
        elif [[ `uname` == "Linux" ]]; then
            [[ "$f" == ".zshenv.darwin" ]] && continue
            [[ "$f" == ".zshrc.darwin" ]] && continue

            echo "Mapping $f..."
            ln -sf $HOME/dotfiles/$f $HOME/${f%%.linux}
        fi
    else
        echo "Maping $f..."
        ln -sf $HOME/dotfiles/$f $HOME
    fi
done

echo "========     Finished mapping!      ========"
