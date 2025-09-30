/*
 * Descripción corta: Recibe la comida seleccionada y permite añadir extras.
 * Agrupa toda la información en un nuevo Bundle y la pasa al fragment de resumen.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-09-30
 * Fecha Última Modificación: 2025-09-30
 */
package com.example.practica5

import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.CheckBox
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController

class SeleccionExtrasFragment : Fragment(R.layout.fragment_seleccion_extras) {

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val comida = arguments?.getString("comidaSeleccionada") ?: "N/A"

        val cbBebida = view.findViewById<CheckBox>(R.id.cb_bebida)
        val cbPapas = view.findViewById<CheckBox>(R.id.cb_papas)
        val cbPostre = view.findViewById<CheckBox>(R.id.cb_postre)
        val btnSiguiente = view.findViewById<Button>(R.id.btn_siguiente_extras)

        btnSiguiente.setOnClickListener {
            val extras = mutableListOf<String>()
            if (cbBebida.isChecked) extras.add("Bebida")
            if (cbPapas.isChecked) extras.add("Papas Fritas")
            if (cbPostre.isChecked) extras.add("Postre")

            val bundle = bundleOf(
                "comida" to comida,
                "extras" to extras.toTypedArray()
            )
            findNavController().navigate(R.id.action_seleccionExtrasFragment_to_resumenPedidoFragment, bundle)
        }
    }
}