# 🔒 Seguridad en Ubuntu Server

## SSH Hardening
- Puerto cambiado a 2222
- Root login deshabilitado
- Solo autenticación por claves

## Firewall (UFW)
```bash
sudo ufw allow 2222/tcp
sudo ufw enable
sudo ufw status