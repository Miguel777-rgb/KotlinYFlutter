/*
 * Descripción corta: Muestra el resumen del pedido recibido vía arguments.
 * "Confirmar": Muestra un Toast y navega al inicio, limpiando la pila.
 * "Editar": Usa setFragmentResult para enviar la comida de vuelta y luego popBackStack()
 * para regresar al flujo de selección.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-09-30
 * Fecha Última Modificación: 2025-09-30
 */
package com.example.practica5

import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import androidx.core.os.bundleOf
import androidx.fragment.app.Fragment
import androidx.fragment.app.setFragmentResult
import androidx.navigation.fragment.findNavController

class ResumenPedidoFragment : Fragment(R.layout.fragment_resumen_pedido) {

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val tvComida = view.findViewById<TextView>(R.id.tv_resumen_comida)
        val tvExtras = view.findViewById<TextView>(R.id.tv_resumen_extras)
        val btnConfirmar = view.findViewById<Button>(R.id.btn_confirmar)
        val btnEditar = view.findViewById<Button>(R.id.btn_editar)

        val comida = arguments?.getString("comida")
        val extras = arguments?.getStringArray("extras")

        tvComida.text = comida
        if (extras.isNullOrEmpty()) {
            tvExtras.text = "Sin extras"
        } else {
            tvExtras.text = extras.joinToString(separator = "\n")
        }

        btnConfirmar.setOnClickListener {
            Toast.makeText(context, "¡Pedido confirmado!", Toast.LENGTH_LONG).show()
            findNavController().navigate(R.id.action_resumenPedidoFragment_to_inicioFragment)
        }

        btnEditar.setOnClickListener {
            // Enviar datos de vuelta al fragment anterior (SeleccionComidaFragment)
            val result = bundleOf("comida" to comida)
            setFragmentResult("requestKey", result)
            // Regresar en la pila de navegación. popBackStack dos veces para llegar
            // desde Resumen -> Extras -> Comida.
            findNavController().popBackStack() // Vuelve a SeleccionExtrasFragment
            findNavController().popBackStack() // Vuelve a SeleccionComidaFragment
        }
    }
}