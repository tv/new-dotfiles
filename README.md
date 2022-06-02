# Install:

    git clone https://github.com/tv/new-dotfiles.git dotfiles
    cd dotfiles
    git submodule update --init
    cd .zprezto
    git submodule update --init
    cd ..
    chmod +x install.sh
    ./install.sh


ln -fs ~/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
