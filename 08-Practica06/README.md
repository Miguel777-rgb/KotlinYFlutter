
# Mi Aplicación usando en Flutter

Este proyecto es una práctica de desarrollo de interfaces de usuario estáticas utilizando Flutter. El objetivo es familiarizarse con la construcción de layouts y el uso de widgets básicos sin implementar lógica de negocio ni navegación.

## 🎯 Objetivo del Proyecto

Crear tres pantallas estáticas para una aplicación personal con el fin de practicar el uso de widgets fundamentales de Flutter como `Scaffold`, `AppBar`, `Column`, `Row`, `Text`, `Image`, `Container`, y `Padding`.

## 🚀 Tecnologías Utilizadas

- **Lenguaje:** Dart
- **Framework:** Flutter

## 📂 Estructura del Proyecto

El código fuente está organizado en la carpeta `lib/` con los siguientes archivos:

- **`main.dart`**: Punto de entrada de la aplicación. Contiene el widget `MaterialApp` y permite seleccionar qué pantalla mostrar durante el desarrollo.
- **`pantalla_inicio.dart`**: Define la interfaz de la pantalla de bienvenida.
- **`pantalla_perfil.dart`**: Define la interfaz de la pantalla de perfil personal.
- **`pantalla_hobbies.dart`**: Define la interfaz de la pantalla que muestra una lista de hobbies.

## 📱 Pantallas Desarrolladas

La aplicación consta de tres interfaces gráficas independientes:

### 1. Pantalla de Inicio (`PantallaInicio`)
- Muestra un `AppBar` con el título "Bienvenido".
- Presenta un mensaje de bienvenida centrado.
- Incluye un `ElevatedButton` con el texto "Ver mi perfil" (sin funcionalidad).



### 2. Pantalla de Perfil (`PantallaPerfil`)
- Muestra una imagen de perfil circular cargada desde una URL.
- Presenta el nombre del usuario y una breve descripción profesional.
- Incluye información de contacto (correo y teléfono) acompañada de íconos (`Icon`) organizados en filas (`Row`).



### 3. Pantalla de Hobbies (`PantallaHobbies`)
- Muestra un `AppBar` con el título "Mis Hobbies e Intereses".
- Lista tres hobbies utilizando widgets `Card` para una mejor organización visual.
- Cada hobby incluye un ícono, un título y una breve descripción, maquetado con `ListTile`.



## 🔧 ¿Cómo Probar el Proyecto?

1. Clona o descarga este repositorio.
2. Asegúrate de tener Flutter instalado y configurado en tu entorno de desarrollo.
3. Abre el proyecto en tu editor de código preferido (como VS Code o Android Studio).
4. Para visualizar una pantalla específica, abre el archivo `lib/main.dart` y modifica la propiedad `home` del widget `MaterialApp`:

   ```dart
   // lib/main.dart

   class MyApp extends StatelessWidget {
     // ...
     @override
     Widget build(BuildContext context) {
       return MaterialApp(
         title: 'Mi App Personal',
         // Cambia la clase aquí para probar cada pantalla
         home: PantallaInicio(), // O PantallaPerfil(), o PantallaHobbies()
       );
     }
   }
   ```
5. Ejecuta la aplicación en un emulador o dispositivo físico.

Este proyecto es una base excelente para aprender sobre la construcción visual de aplicaciones en Flutter antes de añadir interacciones complejas.