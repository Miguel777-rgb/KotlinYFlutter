/**
 * Descripción: Actividad para escribir y enviar una nota rápida.
 *              Guarda el estado al rotar y gestiona el resultado de OpcionesActivity.
 * Autor: Miguel Flores
 * Fecha creación: 23/09/2025
 * Fecha última modificación: 23/09/2025
 */
package com.example.noteeditor

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.EditText
import androidx.activity.result.contract.ActivityResultContracts

class EditorActivity : AppCompatActivity() {

    private lateinit var etNota: EditText

    // Prepara el launcher para recibir la nota de vuelta desde OpcionesActivity.
    private val opcionesActivityResultLauncher = registerForActivityResult(
        ActivityResultContracts.StartActivityForResult()
    ) { result ->
        // Si el resultado es OK, significa que el usuario quiere seguir editando.
        if (result.resultCode == Activity.RESULT_OK) {
            val notaEditada = result.data?.getStringExtra("NOTA_DEVUELTA")
            etNota.setText(notaEditada)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_editor)

        etNota = findViewById(R.id.etNota)
        val btnCompartir: Button = findViewById(R.id.btnCompartir)

        btnCompartir.setOnClickListener {
            val nota = etNota.text.toString()
            if (nota.isNotEmpty()) {
                val intent = Intent(this, OpcionesActivity::class.java).apply {
                    putExtra("NOTA", nota)
                }
                opcionesActivityResultLauncher.launch(intent)
            }
        }
    }

    // Guarda el texto de la nota al rotar la pantalla.
    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("TEXTO_NOTA", etNota.text.toString())
    }

    // Restaura el texto de la nota.
    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        etNota.setText(savedInstanceState.getString("TEXTO_NOTA"))
    }
}