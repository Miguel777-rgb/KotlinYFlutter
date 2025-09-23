/**
 * Descripción: Clase de datos para representar un perfil de usuario.
 * Autor: Miguel Flores
 * Fecha creación: 23/09/2025
 * Fecha última modificación: 23/09/2025
 */
package com.example.a01_editarperfilconconfirmacion

import java.io.Serializable

data class Usuario(
    val nombre: String,
    val edad: Int,
    val ciudad: String,
    val correo: String
) : Serializable