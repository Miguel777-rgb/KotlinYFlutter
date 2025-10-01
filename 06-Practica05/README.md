# Kotlin GOD :D
# Práctica 5: Fragments y Navegación con Android Jetpack

## Autor
*   **Autor:** Miguel Flores
*   **Fecha:** 2024-09-27

## Descripción del Proyecto
Esta aplicación para Android es una demostración de los principios fundamentales de la navegación entre `Fragments` utilizando el **Navigation Component** de Android Jetpack. El proyecto simula un flujo de configuración de un pedido de comida en varios pasos, permitiendo al usuario seleccionar un plato principal, añadir extras y finalmente ver un resumen para confirmar o editar su elección.

## 🎯 Objetivo de la Práctica
El objetivo principal es consolidar el conocimiento en la gestión de `Fragments` y el paso de datos entre ellos, cubriendo los siguientes escenarios:

-   **Navegación Simple**: Moverse de un fragment a otro.
-   **Paso de Datos Hacia Adelante**: Enviar información del `Fragment A` al `Fragment B` utilizando `Bundle` y la acción de navegación.
-   **Paso de Datos Hacia Atrás**: Comunicar resultados desde un `Fragment B` de vuelta a un `Fragment A` usando la API `Fragment Result` (`setFragmentResult` y `setFragmentResultListener`).
-   **Manejo de la Pila de Navegación (Back Stack)**: Regresar a un fragment específico usando `popBackStack()` y limpiar la pila al finalizar un flujo con `popUpTo`.

## 🛠️ Tecnologías y Componentes Utilizados
-   **Lenguaje**: Kotlin
-   **IDE**: Android Studio
-   **Arquitectura**: Single-Activity Architecture
-   **Componentes de Jetpack**:
    -   **Navigation Component**: Para gestionar todo el flujo de navegación.
    -   **Fragments**: Para construir una UI modular.
-   **Vistas (Views)**: Layouts basados en XML con `LinearLayout`, `Button`, `RadioGroup`, `CheckBox`, etc.
-   **Paso de Datos**: `Bundle` y `Fragment Result API`.

## 📂 Estructura del Proyecto
El proyecto se compone de una única actividad (`MainActivity`) que actúa como host para cuatro fragments principales, orquestados por un gráfico de navegación (`nav_graph.xml`).

1.  **`MainActivity.kt`**: Contenedor principal que aloja el `NavHostFragment`.
2.  **`res/navigation/nav_graph.xml`**: Archivo central que define todos los destinos (fragments) y las acciones de navegación entre ellos.
3.  **Fragments**:
    -   **`InicioFragment`**: La pantalla de bienvenida. Contiene un solo botón para iniciar el flujo del pedido.
    -   **`SeleccionComidaFragment`**: El primer paso del pedido. El usuario elige un plato principal (Pizza, Hamburguesa, etc.).
    -   **`SeleccionExtrasFragment`**: El segundo paso. El usuario puede añadir complementos (Bebida, Papas, etc.).
    -   **`ResumenPedidoFragment`**: La pantalla final. Muestra un resumen del plato y los extras seleccionados. Ofrece opciones para confirmar o editar el pedido.

## 🌊 Flujo de la Aplicación

El flujo de usuario es lineal y claro, con una opción para retroceder y editar.

1.  **Inicio**: La aplicación se abre en `InicioFragment`.
2.  **Crear Pedido**: Al pulsar "Nuevo Pedido", se navega a `SeleccionComidaFragment`.
    -   `findNavController().navigate(R.id.action_inicioFragment_to_seleccionComidaFragment)`
3.  **Seleccionar Comida**: El usuario elige una opción. Al pulsar "Siguiente":
    -   Se crea un `Bundle` con la comida seleccionada (`comidaSeleccionada` -> `String`).
    -   Se navega a `SeleccionExtrasFragment`, pasando el `Bundle`.
4.  **Seleccionar Extras**: Este fragment primero recupera la comida del `Bundle` de argumentos. El usuario selecciona los extras. Al pulsar "Ver Resumen":
    -   Se crea un nuevo `Bundle` que contiene tanto la comida (`String`) como los extras (un `Array<String>`).
    -   Se navega a `ResumenPedidoFragment`, pasando el nuevo `Bundle`.
5.  **Ver Resumen**: El fragment recupera toda la información de sus argumentos y la muestra.
    -   **Opción 1: Confirmar Pedido**:
        -   Muestra un `Toast` de confirmación.
        -   Navega de regreso a `InicioFragment`, utilizando `app:popUpTo` y `app:popUpToInclusive="true"` en el `nav_graph.xml` para limpiar la pila de navegación y evitar que el usuario pueda volver al resumen con el botón de retroceso.
    -   **Opción 2: Editar Pedido**:
        -   Utiliza `setFragmentResult("requestKey", bundle)` para empaquetar los datos actuales del pedido (la comida seleccionada).
        -   Llama a `findNavController().popBackStack()` dos veces para regresar a través del `SeleccionExtrasFragment` hasta el `SeleccionComidaFragment`.
        -   El `SeleccionComidaFragment` está escuchando con `setFragmentResultListener("requestKey")` y, al recibir el resultado, preselecciona la opción que el usuario había elegido originalmente.

## 🚀 Cómo Ejecutar el Proyecto
1.  Clona este repositorio en tu máquina local.
2.  Abre el proyecto con Android Studio.
3.  Sincroniza las dependencias de Gradle.
4.  Ejecuta la aplicación en un emulador o en un dispositivo físico con Android.