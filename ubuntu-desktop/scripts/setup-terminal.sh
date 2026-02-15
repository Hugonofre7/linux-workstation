#!/bin/bash
# setup-terminal.sh - Configuración de terminal mejorada

echo "💻 Configurando terminal..."

# Instalar Zsh
sudo apt install -y zsh

# Instalar Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Configurar Zsh como shell por defecto
chsh -s $(which zsh)

# Agregar aliases útiles
cat >> ~/.zshrc << 'EOF'

# Aliases DevOps
alias k="kubectl"
alias tf="terraform"
alias dc="docker-compose"
alias dps="docker ps"
alias dil="docker image ls"

# Kubernetes aliases
alias kgp="kubectl get pods"
alias kgn="kubectl get nodes"
alias kgs="kubectl get services"

# Terraform aliases
alias tfi="terraform init"
alias tfp="terraform plan"
alias tfa="terraform apply"

# Navegación
alias projects="cd ~/projects"
EOF

echo "✅ Terminal configurada. Zsh será el shell por defecto al reiniciar sesión."