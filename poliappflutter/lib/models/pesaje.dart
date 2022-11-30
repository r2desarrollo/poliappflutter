class DataModel {

    int id;
    String material;
    int pesoneto;
    String evidencia;
    String sucursal;
    String proveedor;


  DataModel({
   required this.id,
        required this.material,
        required this.pesoneto,
        required this.evidencia,
        required this.sucursal,
        required this.proveedor,
        });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'] ?? "",
      material: json['material'],
      pesoneto: json['pesoneto'],
      evidencia: json['evidencia'],
      sucursal: json['sucursal'],
      proveedor: json['proveedor'],
     
    );
  }
}