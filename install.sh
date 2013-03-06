
# Load these from somewhere
DIR="$HOME/dotfiles/dots"
FILES=$DIR/*

for f in $FILES; do 
    filename=$(basename $f)
    dest="$HOME/.$filename"

    # if file exists and is not symbolic link
    # second part assures we wont pollute the home
    # folter with backup files of our own
    if [ -f $dest ] && [ ! -L $dest ]; then
        echo "$dest is file, backing up"
        cp $dest $dest.orig
    fi
    echo "$f -> $dest";
    ln -fs $f $dest;
    #cp ~/$f ~/${f/.//}.orig
done

vim +BundleInstall +qall
