#Remove CDROM reference
sudo sed -i '/cdrom/d' /etc/apt/sources.list

#update and install wget, zsh shell, git, curl and python3, dotnet, go, nodejs
sudo apt update && sudo apt upgrade


wget https://packages.microsoft.com/config/ubuntu/22.10/packages-microsoft-prod.deb -O ~/Desktop/packages-microsoft-prod.deb
sudo dpkg -i ~/Desktop/packages-microsoft-prod.deb
rm ~/Desktop/packages-microsoft-prod.deb

sudo add-apt-repository ppa:maarten-fonville/android-studio -y

sudo apt install wget zsh git curl python3 default-jdk libgdiplus binutils gnupg2 libc6-dev python3-lldb-13 \
libcurl4-openssl-dev libedit2 libgcc-9-dev libsqlite3-0 libstdc++-9-dev libxml2-dev libz3-dev pkg-config \
tzdata unzip zlib1g-dev golang-go nodejs npm dotnet-sdk-7.0 android-studio -y


# Download vs code
sudo wget -O ~/Desktop/vs_code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64"

# Install vs code
sudo dpkg -i ~/Desktop/vs_code.deb
rm -f ~/Desktop/vs_code.deb

code --install-extension ms-dotnettools.csharp
code --install-extension ms-python.python
code --install-extension fwcd.kotlin
code --install-extension Kasik96.swift
code --install-extension golang.go
code --install-extension ms-vscode.vscode-typescript-next

#make a fonts directory
mkdir ~/.fonts/

#download fonts and copy to the ~/.fonts/
sudo wget -O ~/.fonts/MesloLGS\ NF\ Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
sudo wget -O ~/.fonts/MesloLGS\ NF\ Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
sudo wget -O ~/.fonts/MesloLGS\ NF\ Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
sudo wget -O ~/.fonts/MesloLGS\ NF\ Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf


#get the profile id of terminal to a variable
profile=$(gsettings get org.gnome.Terminal.ProfilesList default)

#clean up profile id
profile=${profile:1:-1}

#Modify settings to change the font to the newly downloaded one
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" font 'MesloLGS NF 12'

#turn off the setting that makes the terminal use system font
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-system-font false

#set natural scroll to true... LOL
gsettings set org.gnome.desktop.peripherals.mouse natural-scroll true
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll true

#Download and install oh-my-zsh, FINALLY!
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

#Download and install the fancy and fast powerlevel10K theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k

#update .zshrc file to use powerlevel10K theme
sed -i -e "s/robbyrussell/powerlevel10k\/powerlevel10k/g" ~/.zshrc

#change shell to zsh
chsh -s /usr/bin/zsh


curl -s https://get.sdkman.io | zsh
source ~/.sdkman/bin/sdkman-init.sh
sdk install kotlin

#BEGIN WARNING!!!! FOLLOWING URL NEEDS TO BE UPDATED TO LATEST AVAILABLE VERSION (from swift.org/download/)
wget https://download.swift.org/swift-5.7.2-release/ubuntu2204/swift-5.7.2-RELEASE/swift-5.7.2-RELEASE-ubuntu22.04.tar.gz -O ~/Desktop/swift.tar.gz
tar xzf ~/Desktop/swift.tar.gz --directory ~/
rm ~/Desktop/swift.tar.gz
mv ~/swift-5.7.2-RELEASE-ubuntu22.04 ~/swift
echo "PATH=~/swift/usr/bin:\$PATH" >> ~/.zshrc
#END WARNING


