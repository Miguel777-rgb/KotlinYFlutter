# Kotlin GOD :D
 ¡Por supuesto! Aquí tienes un resumen y los puntos destacables de los dos proyectos, listos para que los copies y pegues en tu archivo `README.md`.

---

# Práctica 4: Comunicación entre Actividades en Android

Este repositorio contiene la solución a dos ejercicios enfocados en la comunicación entre `Activities` en Android utilizando Kotlin. El objetivo principal es poner en práctica el envío de datos, la recepción de resultados y la preservación del estado de la UI ante cambios de configuración (como la rotación de pantalla), **sin el uso de Fragments**.

## Conceptos Clave Practicados

*   **Intents Explícitos**: Para iniciar una segunda actividad desde la primera.
*   **Paso de Datos con Extras**: Envío de datos simples (Strings) y complejos (objetos `Serializable`).
*   **Activity Result API**: Uso de `registerForActivityResult` para recibir un resultado de una actividad secundaria de forma moderna y segura.
*   **Manejo del Ciclo de Vida**: Preservación de datos durante cambios de configuración mediante `onSaveInstanceState` y `onRestoreInstanceState`.

---

## Proyecto 1: Editor de Perfil con Confirmación

Una aplicación simple que permite al usuario llenar un formulario de perfil, previsualizar los datos en una segunda pantalla y confirmar o volver a editar la información.

### 🎯 Objetivo

Demostrar el envío de un objeto de datos completo a otra actividad y recibir un estado de confirmación (`RESULT_OK` o `RESULT_CANCELED`) de vuelta.

### ✨ Puntos Destacables

1.  **Envío de un Objeto Complejo (`Serializable`)**:
    Se utiliza una `data class` `Usuario` que implementa la interfaz `Serializable`. Esto permite empaquetar todo el objeto de perfil en el `Intent` de una sola vez, manteniendo el código limpio y organizado.

    ```kotlin
    // En FormularioActivity.kt
    val usuario = Usuario(nombre, edad, ciudad, correo)
    val intent = Intent(this, ResumenActivity::class.java).apply {
        putExtra("EXTRA_USUARIO", usuario)
    }
    ```

2.  **Recepción de un Resultado sin Datos**:
    El corazón de esta funcionalidad es `registerForActivityResult`. La actividad principal espera un resultado simple (confirmado o no) para actuar en consecuencia. No necesita recibir datos de vuelta, solo el código del resultado.

    ```kotlin
    // En FormularioActivity.kt
    private val resumenActivityResultLauncher = registerForActivityResult(
        ActivityResultContracts.StartActivityForResult()
    ) { result ->
        if (result.resultCode == Activity.RESULT_OK) {
            // El usuario presionó "Confirmar"
            Toast.makeText(this, "Perfil guardado correctamente", Toast.LENGTH_SHORT).show()
        }
    }
    ```

3.  **Preservación del Estado en Múltiples Campos**:
    `onSaveInstanceState` se utiliza para guardar el contenido de cada `EditText` individualmente. Esto asegura que si el usuario rota la pantalla mientras llena el formulario, no perderá ningún dato ingresado.

    ```kotlin
    // En FormularioActivity.kt
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("NOMBRE", etNombre.text.toString())
        outState.putString("EDAD", etEdad.text.toString())
        // ... y así para los demás campos
    }
    ```

---

## Proyecto 2: Editor de Nota Rápida

Una aplicación que permite escribir una nota, enviarla a una pantalla de opciones para compartirla o devolverla a la pantalla de edición para continuar modificándola.

### 🎯 Objetivo

Practicar el envío de datos simples (un `String`) y, crucialmente, **recibir datos de vuelta** desde la segunda actividad para actualizar la UI de la primera.

### ✨ Puntos Destacables

1.  **Envío de Datos Simples (`String`)**:
    A diferencia del primer proyecto, aquí solo se envía un `String`. Esto se logra fácilmente con `Intent.putExtra()` usando un par clave-valor.

    ```kotlin
    // En EditorActivity.kt
    val intent = Intent(this, OpcionesActivity::class.java).apply {
        putExtra("NOTA", nota)
    }
    ```

2.  **Devolución de Datos con el Resultado**:
    Este es el punto clave. Cuando el usuario presiona "Editar de nuevo", la `OpcionesActivity` no solo establece el resultado en `RESULT_OK`, sino que también adjunta la nota en un nuevo `Intent` para que la `EditorActivity` pueda recuperarla y restaurarla en el `EditText`.

    ```kotlin
    // En OpcionesActivity.kt (al presionar "Editar de nuevo")
    val resultIntent = Intent().apply {
        putExtra("NOTA_DEVUELTA", notaRecibida)
    }
    setResult(Activity.RESULT_OK, resultIntent)
    finish()
    ```

    ```kotlin
    // En EditorActivity.kt, dentro del launcher
    if (result.resultCode == Activity.RESULT_OK) {
        val notaEditada = result.data?.getStringExtra("NOTA_DEVUELTA")
        etNota.setText(notaEditada)
    }
    ```

3.  **Manejo de Estado para un Solo Campo de Texto**:
    El uso de `onSaveInstanceState` aquí es más sencillo, pero igualmente importante. Garantiza que una nota larga no se pierda si el dispositivo rota, mejorando significativamente la experiencia del usuario.

    ```kotlin
    // En EditorActivity.kt
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("TEXTO_NOTA", etNota.text.toString())
    }
    ```