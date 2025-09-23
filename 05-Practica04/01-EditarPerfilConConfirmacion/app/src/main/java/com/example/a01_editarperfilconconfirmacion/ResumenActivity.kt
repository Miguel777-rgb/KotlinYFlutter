/**
 * Descripción: Muestra un resumen de los datos del usuario y permite
 *              confirmar o volver a editar la información.
 * Autor: Miguel Flores
 * Fecha creación: 23/09/2025
 * Fecha última modificación: 23/09/2025
 */

package com.example.a01_editarperfilconconfirmacion

import android.app.Activity
import android.os.Build
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView

class ResumenActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_resumen)

        val tvNombre: TextView = findViewById(R.id.tvNombre)
        val tvEdad: TextView = findViewById(R.id.tvEdad)
        val tvCiudad: TextView = findViewById(R.id.tvCiudad)
        val tvCorreo: TextView = findViewById(R.id.tvCorreo)
        val btnConfirmar: Button = findViewById(R.id.btnConfirmar)
        val btnEditar: Button = findViewById(R.id.btnEditar)

        // Obtiene el objeto Usuario del Intent.
        val usuario = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            intent.getSerializableExtra("EXTRA_USUARIO", Usuario::class.java)
        } else {
            @Suppress("DEPRECATION")
            intent.getSerializableExtra("EXTRA_USUARIO") as? Usuario
        }

        // Muestra los datos si el objeto no es nulo.
        usuario?.let {
            tvNombre.text = "Nombre: ${it.nombre}"
            tvEdad.text = "Edad: ${it.edad}"
            tvCiudad.text = "Ciudad: ${it.ciudad}"
            tvCorreo.text = "Correo: ${it.correo}"
        }

        btnConfirmar.setOnClickListener {
            // Establece el resultado como "OK" y finaliza la actividad.
            setResult(Activity.RESULT_OK)
            finish()
        }

        btnEditar.setOnClickListener {
            // Establece el resultado como "CANCELED" y finaliza.
            setResult(Activity.RESULT_CANCELED)
            finish()
        }
    }
}