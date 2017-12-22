source "$HOME/.local/share/zsh/antigen.zsh"

antigen use oh-my-zsh

bundles=(aws
         bower
         cabal
         command-not-found
         debian
         dircycle
         dirhistory
         django
         docker
         encode64
         fasd
         gem
         git
         gitfast
         git-extras
         git-flow-avh
         github
         gradle
         history
         jsontools
         lein
         mercurial
         ng
         node
         npm
         perl
         pip
         python
         rails
         redis-cli
         ruby
         sbt
         sprunge
         sudo
         systemd
         tmux
         wd
         yarn
         )

for bundle in "${bundles[@]}"; do
    antigen bundle "$bundle"
done

antigen bundle zsh-users/zsh-syntax-highlighting

#antigen theme rkj-repos
antigen theme tjkirch
#antigen theme ys

antigen apply
