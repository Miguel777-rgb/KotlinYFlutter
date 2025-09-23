/**
 * Descripción: Muestra una nota y ofrece opciones para compartirla o devolverla
 *              para seguir editando.
 * Autor: [Tu Nombre]
 * Fecha creación: 23/09/2025
 * Fecha última modificación: 23/09/2025
 */
package com.example.noteeditor

import android.app.Activity
import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast

class OpcionesActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_opciones)

        val tvNota: TextView = findViewById(R.id.tvNota)
        val btnCompartirCorreo: Button = findViewById(R.id.btnCompartirCorreo)
        val btnEditarDeNuevo: Button = findViewById(R.id.btnEditarDeNuevo)

        // Obtiene la nota del Intent.
        val notaRecibida = intent.getStringExtra("NOTA")
        tvNota.text = notaRecibida

        btnCompartirCorreo.setOnClickListener {
            Toast.makeText(this, "Compartido por correo", Toast.LENGTH_SHORT).show()
        }

        btnEditarDeNuevo.setOnClickListener {
            // Prepara un Intent para devolver la nota.
            val resultIntent = Intent().apply {
                putExtra("NOTA_DEVUELTA", notaRecibida)
            }
            // Establece el resultado como "OK" y envía el Intent.
            setResult(Activity.RESULT_OK, resultIntent)
            finish() // Cierra esta actividad.
        }
    }
}