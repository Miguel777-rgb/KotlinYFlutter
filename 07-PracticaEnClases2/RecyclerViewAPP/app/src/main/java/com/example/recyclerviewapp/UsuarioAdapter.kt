package com.example.recyclerviewapp.adapter

import android.app.AlertDialog
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.ImageButton
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.example.recyclerviewapp.R
import com.example.recyclerviewapp.Usuario

class UsuarioAdapter(
    private val listaUsuario: MutableList<Usuario>,
    private val onEditClick: (Int, Usuario) -> Unit,
    private val onDeleteClick: (Int) -> Unit
) : RecyclerView.Adapter<UsuarioAdapter.UsuarioViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): UsuarioViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_usuario, parent, false)
        return UsuarioViewHolder(view)
    }

    override fun onBindViewHolder(holder: UsuarioViewHolder, position: Int) {
        val usuario = listaUsuario[position]
        holder.bind(usuario)
    }

    override fun getItemCount(): Int = listaUsuario.size

    fun addUser(usuario: Usuario) {
        listaUsuario.add(usuario)
        notifyItemInserted(listaUsuario.size - 1)
    }

    inner class UsuarioViewHolder(itemView: View) : RecyclerView.ViewHolder(itemView) {
        private val txtNombre: TextView = itemView.findViewById(R.id.txtNombre)
        private val txtEdad: TextView = itemView.findViewById(R.id.txtEdad)
        private val txtCorreo: TextView = itemView.findViewById(R.id.txtCorreo)
        private val btnEliminar: ImageButton = itemView.findViewById(R.id.btnEliminar)

        fun bind(usuario: Usuario) {
            txtNombre.text = usuario.nombre
            txtEdad.text = "Edad: ${usuario.edad}"
            txtCorreo.text = usuario.email

            btnEliminar.setOnClickListener {
                val pos = bindingAdapterPosition
                if (pos != RecyclerView.NO_POSITION) {
                    onDeleteClick(pos)
                }
            }

            // Paso 3: Implementar long click
            itemView.setOnLongClickListener {
                val pos = bindingAdapterPosition
                if (pos != RecyclerView.NO_POSITION) {
                    AlertDialog.Builder(itemView.context)
                        .setTitle("Acción")
                        .setItems(arrayOf("Editar", "Eliminar")) { _, which ->
                            when (which) {
                                0 -> showEditDialog(usuario)
                                1 -> onDeleteClick(pos)
                            }
                        }
                        .show()
                }
                true
            }
        }

        // Paso 4: Editar un usuario
        private fun showEditDialog(usuario: Usuario) {
            val context = itemView.context
            val dialogView = LayoutInflater.from(context).inflate(R.layout.dialog_edit_usuario, null)

            val editNombre = dialogView.findViewById<EditText>(R.id.editNombre)
            val editEdad = dialogView.findViewById<EditText>(R.id.editEdad)
            val editCorreo = dialogView.findViewById<EditText>(R.id.editCorreo)

            // Asignar valores actuales
            editNombre.setText(usuario.nombre)
            editEdad.setText(usuario.edad.toString())
            editCorreo.setText(usuario.email)

            AlertDialog.Builder(context)
                .setTitle("Editar usuario")
                .setView(dialogView)
                .setPositiveButton("Guardar") { _, _ ->
                    val pos = bindingAdapterPosition
                    if (pos != RecyclerView.NO_POSITION) {
                        // Crear un nuevo objeto Usuario con los datos actualizados
                        val updatedUsuario = usuario.copy(
                            nombre = editNombre.text.toString(),
                            edad = editEdad.text.toString().toIntOrNull() ?: usuario.edad,
                            email = editCorreo.text.toString()
                        )
                        onEditClick(pos, updatedUsuario)
                    }
                }
                .setNegativeButton("Cancelar", null)
                .show()
        }
    }
}
