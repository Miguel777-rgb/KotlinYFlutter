/*
 * Descripción corta: Permite al usuario seleccionar una comida. Pasa la selección al
 * siguiente fragment usando un Bundle. También escucha por resultados del ResumenFragment
 * para pre-cargar una selección cuando se edita un pedido.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-09-30
 * Fecha Última Modificación: 2025-09-30
 */
package com.example.practica5

import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.RadioButton
import android.widget.RadioGroup
import android.widget.Toast
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.fragment.app.setFragmentResultListener
import androidx.navigation.fragment.findNavController

class SeleccionComidaFragment : Fragment(R.layout.fragment_seleccion_comida) {

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val radioGroup = view.findViewById<RadioGroup>(R.id.radio_group_comida)
        val btnSiguiente = view.findViewById<Button>(R.id.btn_siguiente_comida)

        btnSiguiente.setOnClickListener {
            val selectedId = radioGroup.checkedRadioButtonId
            if (selectedId == -1) {
                Toast.makeText(context, "Debes seleccionar una opción", Toast.LENGTH_SHORT).show()
            } else {
                val radioButton = view.findViewById<RadioButton>(selectedId)
                val comida = radioButton.text.toString()
                val bundle = bundleOf("comidaSeleccionada" to comida)
                findNavController().navigate(R.id.action_seleccionComidaFragment_to_seleccionExtrasFragment, bundle)
            }
        }

        // Listener para recibir datos de vuelta (cuando se edita el pedido)
        setFragmentResultListener("requestKey") { _, bundle ->
            val comidaAnterior = bundle.getString("comida")
            when (comidaAnterior) {
                "Pizza" -> radioGroup.check(R.id.rb_pizza)
                "Hamburguesa" -> radioGroup.check(R.id.rb_hamburguesa)
                "Ensalada" -> radioGroup.check(R.id.rb_ensalada)
            }
            Toast.makeText(context, "Modifica tu pedido", Toast.LENGTH_SHORT).show()
        }
    }
}