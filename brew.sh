#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

if [[ ! -x /usr/local/bin/brew ]]; then
    echo "Info   | Install   | homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

    # Modify the PATH
    export PATH=/usr/local/bin:$PATH
fi


# Keep-alive: Keep `sudo` time stamp until finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --default-names

brew install zsh

# Download and install python
if [[ ! -x /usr/local/bin/python ]]; then
    echo "Info   | Install   | python"
    brew install python --framework --with-brewed-openssl
fi

# Install `wget` with IRI support.
brew install wget --enable-iri

# Install more recent versions of some OS X tools.
brew install macvim --override-system-vim
brew install homebrew/dupes/grep
brew install homebrew/apache
brew install imagemagick --with-webp

apps=(
  node
  tree
  htop
  irssi
  cmake
  php55
  php55-apcu
  php55-mcrypt
  php55-xdebug
  mysql
  wp-cli
  wget
  ack
  the_silver_searcher
  dnsmasq
  node
  docker
  hub
  git
  mercurial
  ssh-copy-id
  composer
  httpd24
  ansible
)

brew install ${apps[@]}

# Cask apps
brew install caskroom/cask/brew-cask
apps=(
  quicksilver
  dropbox
  google-chrome
  mailbox
  the-unarchiver
  transmit
  appcleaner
  firefox
  seil
  karabiner
  spotify
  sonos
  vagrant
  boot2docker
  iterm2
  virtualbox
  sourcetree
  nvalt
  skype
  querious
  hipchat
)



# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Remove outdated versions from the cellar.
brew cleanup

brew linkapps

chsh -s /bin/zsh

# Other libs you might want
sudo gem install bundler

npm install -g grunt-cli
npm install -g bower

vagrant plugin install vagrant-bindfs
vagrant plugin install vagrant-hostsupdater

sudo gem install sass


ln -sfv $(brew --prefix dnsmasq)/homebrew.mxcl.dnsmasq.plist ~/Library/LaunchAgents
launchctl load -Fw ~/Library/LaunchAgents/homebrew.mxcl.dnsmasq.plist
