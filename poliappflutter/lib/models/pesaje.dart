// To parse this JSON data, do
//
//     final pesaje = pesajeFromJson(jsonString);

import 'dart:convert';

List<Pesaje> pesajeFromJson(String str) => List<Pesaje>.from(json.decode(str).map((x) => Pesaje.fromJson(x)));

String pesajeToJson(List<Pesaje> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pesaje {
    Pesaje({
        required this.id,
        required this.material,
        required this.pesoneto,
        this.evidencia,
        required this.sucursal,
        required this.proveedor,
        this.materialNavigation,
        this.proveedorNavigation,
        this.sucursalNavigation,
        required this.reporte,
    });

    int id;
    int material;
    int pesoneto;
    dynamic evidencia;
    int sucursal;
    int proveedor;
    dynamic materialNavigation;
    dynamic proveedorNavigation;
    dynamic sucursalNavigation;
    List<dynamic> reporte;

    factory Pesaje.fromJson(Map<String, dynamic> json) => Pesaje(
        id: json["id"],
        material: json["material"],
        pesoneto: json["pesoneto"],
        evidencia: json["evidencia"],
        sucursal: json["sucursal"],
        proveedor: json["proveedor"],
        materialNavigation: json["materialNavigation"],
        proveedorNavigation: json["proveedorNavigation"],
        sucursalNavigation: json["sucursalNavigation"],
        reporte: List<dynamic>.from(json["reporte"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "material": material,
        "pesoneto": pesoneto,
        "evidencia": evidencia,
        "sucursal": sucursal,
        "proveedor": proveedor,
        "materialNavigation": materialNavigation,
        "proveedorNavigation": proveedorNavigation,
        "sucursalNavigation": sucursalNavigation,
        "reporte": List<dynamic>.from(reporte.map((x) => x)),
    };
}
