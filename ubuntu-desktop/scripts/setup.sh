#!/bin/bash
# setup.sh - Script principal de instalación (ejecuta todos los demás)

echo "🚀 Iniciando configuración completa de Ubuntu Desktop..."

# Ejecutar scripts en orden
./post-install.sh
./setup-docker.sh
./setup-k8s.sh
./setup-terraform.sh
./setup-aws.sh
./setup-terminal.sh

echo "✅ Configuración completada"
echo "🔧 Reinicia la terminal o ejecuta 'source ~/.zshrc' para aplicar cambios"