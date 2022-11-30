// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

List<Usuario> usuarioFromJson(String str) => List<Usuario>.from(json.decode(str).map((x) => Usuario.fromJson(x)));

String usuarioToJson(List<Usuario> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Usuario {
    Usuario({
        required this.id,
        required this.nombre,
        required this.email,
        required this.password,
        required this.sucursal,
        required this.nivel,
        this.foto,
        required this.prol,
    });

    int id;
    String nombre;
    String email;
    String password;
    String sucursal;
    int nivel;
    dynamic foto;
    int prol;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        nombre: json["nombre"],
        email: json["email"],
        password: json["password"],
        sucursal: json["sucursal"],
        nivel: json["nivel"],
        foto: json["foto"],
        prol: json["prol"]
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "email": email,
        "password": password,
        "sucursal": sucursal,
        "nivel": nivel,
        "foto": foto,
        "prol": prol,
    };
}
