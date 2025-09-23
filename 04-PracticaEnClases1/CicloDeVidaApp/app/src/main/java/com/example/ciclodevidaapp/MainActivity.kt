package com.example.ciclodevidaapp

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import android.util.Log
import android.widget.Button
import android.widget.TextView
import android.widget.Toast

class MainActivity : AppCompatActivity() {

    private var contador = 0
    private lateinit var textViewContador: TextView

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        textViewContador = findViewById(R.id.textViewContador)
        val btnAumentar = findViewById<Button>(R.id.btnAumentar)

        btnAumentar.setOnClickListener {
            contador++
            textViewContador.text = getString(R.string.contador_text, contador)
        }

        Log.d("CICLO", "onCreate llamado")
        Toast.makeText(this, "onCreate()", Toast.LENGTH_SHORT).show()
    }

    override fun onStart() {
        super.onStart()
        Log.d("CICLO", "onStart llamado")
        Toast.makeText(this, "onStart()", Toast.LENGTH_SHORT).show()
    }

    override fun onResume() {
        super.onResume()
        Log.d("CICLO", "onResume llamado")
        Toast.makeText(this, "onResume()", Toast.LENGTH_SHORT).show()
    }

    override fun onPause() {
        super.onPause()
        Log.d("CICLO", "onPause llamado")
        Toast.makeText(this, "onPause()", Toast.LENGTH_SHORT).show()
    }

    override fun onStop() {
        super.onStop()
        Log.d("CICLO", "onStop llamado")
        Toast.makeText(this, "onStop()", Toast.LENGTH_SHORT).show()
    }

    override fun onDestroy() {
        super.onDestroy()
        Log.d("CICLO", "onDestroy llamado")
        Toast.makeText(this, "onDestroy()", Toast.LENGTH_SHORT).show()
    }


    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        // Guarda el valor en objeto Bundle, para recuperarlo después.
        outState.putInt("CONTADOR", contador)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        // Recupera la información, esta es la importancia del objeto Bundle.
        contador = savedInstanceState.getInt("CONTADOR")
        textViewContador.text = getString(R.string.contador_text, contador)
    }
}