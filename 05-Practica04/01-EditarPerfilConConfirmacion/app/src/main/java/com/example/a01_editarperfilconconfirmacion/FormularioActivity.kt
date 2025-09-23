/**
 * Descripción: Actividad principal que contiene el formulario de perfil.
 *              Envía los datos a ResumenActivity y gestiona el resultado.
 * Autor: Miguel Flores
 * Fecha creación: 23/09/2025
 * Fecha última modificación: 23/09/2025
 */
package com.example.a01_editarperfilconconfirmacion

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import android.widget.Toast
import androidx.activity.result.contract.ActivityResultContracts

class FormularioActivity : AppCompatActivity() {

    private lateinit var etNombre: EditText
    private lateinit var etEdad: EditText
    private lateinit var etCiudad: EditText
    private lateinit var etCorreo: EditText
    private lateinit var btnContinuar: Button

    // Prepara el launcher para recibir un resultado de otra actividad.
    private val resumenActivityResultLauncher = registerForActivityResult(
        ActivityResultContracts.StartActivityForResult()
    ) { result ->
        // Comprueba si el resultado es "OK" (el usuario presionó "Confirmar").
        if (result.resultCode == Activity.RESULT_OK) {
            Toast.makeText(this, "Perfil guardado correctamente", Toast.LENGTH_SHORT).show()
            // Opcional: limpiar campos tras confirmar.
            etNombre.text.clear()
            etEdad.text.clear()
            etCiudad.text.clear()
            etCorreo.text.clear()
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_formulario)

        etNombre = findViewById(R.id.etNombre)
        etEdad = findViewById(R.id.etEdad)
        etCiudad = findViewById(R.id.etCiudad)
        etCorreo = findViewById(R.id.etCorreo)
        btnContinuar = findViewById(R.id.btnContinuar)

        btnContinuar.setOnClickListener {
            if (validarCampos()) {
                val nombre = etNombre.text.toString()
                val edad = etEdad.text.toString().toInt()
                val ciudad = etCiudad.text.toString()
                val correo = etCorreo.text.toString()

                val usuario = Usuario(nombre, edad, ciudad, correo)

                // Inicia ResumenActivity y pasa el objeto Usuario.
                val intent = Intent(this, ResumenActivity::class.java).apply {
                    putExtra("EXTRA_USUARIO", usuario)
                }
                resumenActivityResultLauncher.launch(intent)
            } else {
                Toast.makeText(this, "Por favor, completa todos los campos", Toast.LENGTH_SHORT).show()
            }
        }
    }

    private fun validarCampos(): Boolean {
        return etNombre.text.isNotEmpty() &&
                etEdad.text.isNotEmpty() &&
                etCiudad.text.isNotEmpty() &&
                etCorreo.text.isNotEmpty()
    }

    // Guarda el estado de los campos de texto antes de que la actividad sea destruida (ej. por rotación).
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("NOMBRE", etNombre.text.toString())
        outState.putString("EDAD", etEdad.text.toString())
        outState.putString("CIUDAD", etCiudad.text.toString())
        outState.putString("CORREO", etCorreo.text.toString())
    }

    // Restaura el estado después de que la actividad ha sido recreada.
    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        etNombre.setText(savedInstanceState.getString("NOMBRE"))
        etEdad.setText(savedInstanceState.getString("EDAD"))
        etCiudad.setText(savedInstanceState.getString("CIUDAD"))
        etCorreo.setText(savedInstanceState.getString("CORREO"))
    }
}