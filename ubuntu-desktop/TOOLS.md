# 🛠️ Herramientas Ubuntu Desktop

## 📋 Índice
1. [Editores de Código](#editores-de-código)
2. [Navegadores](#navegadores)
3. [Terminal](#terminal)
4. [DevOps Tools](#devops-tools)
5. [Cloud CLIs](#cloud-clis)
6. [Utilidades](#utilidades)
7. [Verificación](#verificación)

---

## ✏️ Editores de Código

### VS Code
```bash
# Instalación via snap
sudo snap install code --classic

# Extensiones recomendadas
code --install-extension ms-azuretools.vscode-azureterraform
code --install-extension ms-kubernetes-tools.vscode-kubernetes-tools
code --install-extension hashicorp.terraform
code --install-extension redhat.vscode-yaml
code --install-extension ms-vscode.vscode-docker

#Vim/Neovim
# Vim básico
sudo apt install -y vim

# Neovim (opcional)
sudo apt install -y neovim

#Editores adicionales
# Nano (ya incluido)
sudo apt install -y nano

# Gedit (editor gráfico)
sudo apt install -y gedit

🌐 Navegadores
# Firefox (por defecto)
# Ya viene instalado con Ubuntu Desktop
firefox --version

#Chromium
# Instalar Chromium
sudo apt install -y chromium-browser

#Google Chrome (opcional)
# Descargar e instalar
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt update
sudo apt install -y google-chrome-stable

💻 Terminal
# Instalar Zsh
sudo apt install -y zsh

# Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Cambiar shell por defecto
chsh -s $(which zsh)

Plugins útiles para Zsh
# Autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

Terminales alternativas
# Tilix (terminal con splits)
sudo apt install -y tilix

# Terminator
sudo apt install -y terminator

🐳 DevOps Tools
# Ver script en scripts/setup-docker.sh
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker

Kubernetes Tools
# kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Helm
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

# Stern
curl -LO https://github.com/stern/stern/releases/download/v1.27.0/stern_1.27.0_linux_arm64.tar.gz
tar -xzf stern_1.27.0_linux_arm64.tar.gz
sudo mv stern /usr/local/bin/stern

Terraform
# Descargar para ARM64
wget https://releases.hashicorp.com/terraform/1.7.4/terraform_1.7.4_linux_arm64.zip
unzip terraform_1.7.4_linux_arm64.zip
sudo mv terraform /usr/local/bin/

Ansible
sudo apt install -y ansible

☁️ Cloud CLIs
AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

Google Cloud SDK
# Instalar via snap
sudo snap install google-cloud-cli --classic

# Configurar PATH
echo 'export PATH=$PATH:/snap/bin' >> ~/.zshrc

Azure CLI (opcional)
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

🛠️ Utilidades
Monitoreo
sudo apt install -y htop iotop nethogs nmon


Red
sudo apt install -y net-tools traceroute dnsutils nmap tcpdump

Procesamiento
sudo apt install -y jq yq tree

Compresión
sudo apt install -y zip unzip p7zip-full

Git avanzado
sudo apt install -y git-extras

✅ Verificación de Herramientas
echo "=== HERRAMIENTAS INSTALADAS ==="
docker --version 2>/dev/null && echo "✅ Docker" || echo "❌ Docker"
kubectl version --client 2>/dev/null && echo "✅ kubectl" || echo "❌ kubectl"
terraform version 2>/dev/null && echo "✅ Terraform" || echo "❌ Terraform"
ansible --version 2>/dev/null && echo "✅ Ansible" || echo "❌ Ansible"
aws --version 2>/dev/null && echo "✅ AWS CLI" || echo "❌ AWS CLI"
gcloud --version 2>/dev/null && echo "✅ Google Cloud" || echo "❌ Google Cloud"