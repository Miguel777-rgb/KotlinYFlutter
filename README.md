# Práctica en Clases 5 - Validación y Mejoras de UI

Este proyecto incluye mejoras en la autenticación y navegación de la aplicación Flutter, incorporando validaciones avanzadas, mejoras en la interfaz de usuario y paso de parámetros entre pantallas.

## 🚀 Funcionalidades Implementadas

### ✅ Actividad 1 – Validación Adicional
Se ha fortalecido la seguridad en el formulario de inicio de sesión mediante validaciones estrictas para la contraseña.

**Ubicación:** `lib/views/login_screen.dart`

**Requisitos:**
- La contraseña debe contener al menos **1 número**.
- La contraseña debe contener al menos **1 mayúscula**.

**Implementación:**
```dart
if (!value.contains(RegExp(r'[A-Z]'))) return 'Debe tener al menos una mayúscula';
if (!value.contains(RegExp(r'[0-9]'))) return 'Debe tener al menos un número';
```

---

### ✅ Actividad 2 – Mejorar la Interfaz
Se ha optimizado la experiencia de usuario (UX) en la pantalla de Login con nuevos elementos y espaciado consistente.

**Ubicación:** `lib/views/login_screen.dart`

**Cambios:**
- **Botón "Crear cuenta":** Facilita el registro de nuevos usuarios.
- **Texto "¿Olvidaste tu contraseña?":** Enlace rápido para recuperación de acceso.
- **Diseño:** Se aplicaron `Padding` y espaciados uniformes para una distribución visual equilibrada.

---

### ✅ Actividad 3 – Mostrar Email en Pantalla CRUD
Se implementó la lógica para pasar y mostrar el correo del usuario autenticado en la pantalla principal de la lista de usuarios.

**Ubicación:** 
- Envío: `lib/views/login_screen.dart`
- Recepción: `lib/views/user_list_screen.dart`

**Implementación:**
1. **Recepción del dato:** `UserListScreen` acepta `final String email` en su constructor.
2. **Visualización:** El correo se muestra dinámicamente en la barra de título.

```dart
AppBar(title: Text('Bienvenido: $email'))
```
