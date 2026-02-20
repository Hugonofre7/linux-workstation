## ⚠️ Problema Común: VS Code no conecta en macOS

### Error: "No route to host" o "LocalNetworkPermissionMacOS"

**Síntoma:**
- Ping funciona (`ping IP_SERVIDOR`)
- SSH desde terminal funciona (`ssh -p 2222 usuario@IP`)
- VS Code muestra error "No route to host"

**Causa:**
macOS bloquea el acceso a red local para aplicaciones por seguridad.

**Solución:**

### 1. Verificar permiso en macOS:
- Abrir **System Settings** (Configuración del Sistema)
- Ir a **Privacy & Security** → **Local Network**
- Buscar **"Code"** o **"VS Code"** en la lista

### 2. Activar el permiso:
- Activar el interruptor (ON/Verde)
- Si no aparece VS Code:
  - Cerrar VS Code completamente (`Cmd+Q`)
  - Volver a abrir VS Code
  - Intentar conectar de nuevo
  - macOS preguntará: "Allow VS Code to access local network?"
  - Hacer clic en **"Allow"**

### 3. Verificar:
```bash
Cmd+Shift+P → Remote-SSH: Connect to Host... → ubuntu-server

