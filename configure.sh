#update and install wget, zsh shell, git, curl and python3
sudo apt update
sudo apt install wget zsh git curl python3 -y

# Download vs code
sudo wget -O ~/Desktop/vs_code.deb "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-arm64"

# Install vs code
sudo dpkg -i ~/Desktop/vs_code.deb

#make a fonts directory
mkdir ~/.fonts/

#download fonts and copy to the ~/.fonts/
sudo wget -O ~/.fonts/MesloLGS\ NF\ Regular.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
sudo wget -O ~/.fonts/MesloLGS\ NF\ Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
sudo wget -O ~/.fonts/MesloLGS\ NF\ Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
sudo wget -O ~/.fonts/MesloLGS\ NF\ Bold.ttf https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf

# create an empty .zshrc file in home folder
touch ~/.zshrc

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

#logout
kill -9 -1
