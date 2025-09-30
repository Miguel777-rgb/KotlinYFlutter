/*
 * Descripción corta: Fragment inicial. Su única función es navegar a la pantalla
 * de selección de comida al pulsar el botón "Nuevo Pedido".
 * Autor: Miguel Flores
 * Fecha Creación: 2025-09-30
 * Fecha Última Modificación: 2025-09-30
 */
package com.example.practica5

import android.os.Bundle
import android.view.View
import android.widget.Button
import androidx.fragment.app.Fragment
import androidx.navigation.fragment.findNavController

class InicioFragment : Fragment(R.layout.fragment_inicio) {

    override fun onViewCreated(view: View, savedInstanceState: Bundle?) {
        super.onViewCreated(view, savedInstanceState)

        val btnNuevoPedido = view.findViewById<Button>(R.id.btn_nuevo_pedido)
        btnNuevoPedido.setOnClickListener {
            findNavController().navigate(R.id.action_inicioFragment_to_seleccionComidaFragment)
        }
    }
}