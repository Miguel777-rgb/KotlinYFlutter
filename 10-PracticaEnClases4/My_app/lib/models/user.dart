class User {
  String nombre;
  String genero; // 'Masculino' o 'Femenino'
  bool activo;
  int edad;       // <-- NUEVO CAMPO
  String correo;  // <-- NUEVO CAMPO

  User({
    required this.nombre,
    required this.genero,
    required this.activo,
    required this.edad,   // <-- ACTUALIZADO
    required this.correo, // <-- ACTUALIZADO
  });
}