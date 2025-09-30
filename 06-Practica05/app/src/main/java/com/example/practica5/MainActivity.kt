/*
 * Descripción corta: Actividad principal que carga el layout con el NavHostFragment.
 * No contiene lógica adicional, ya que la navegación es gestionada por el Navigation Component.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-09-30
 * Fecha Última Modificación: 2025-09-30
 */
package com.example.practica5

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }
}