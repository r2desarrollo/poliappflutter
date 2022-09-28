import 'dart:convert';
// A flutter class that resemble our rest API's request response data
class Pesaje {
  final int id;
  int material;
  double pesoneto;
  String evidencia;
  int proveedor;

// Flutter way of creating a constructor
  Pesaje({this.id = 0, this.material= 0, this.pesoneto = 0, this.evidencia='', this.proveedor=0});

// factory for mapping JSON to current instance of the Todo class
  factory Pesaje.fromJson(Map<String, dynamic> json) {
    return Pesaje(
      id: json['id'],
      material: json['material'],
      pesoneto: json['pesoneto'],
      evidencia: json['evidencia'],
      proveedor: json['proveedor'],

    );
  }

// Instance method for converting a todo item to a map
  Map<String, dynamic> toMap() {
    return {"id": id, "material": material, "pesoneto": pesoneto, "evidencia": evidencia, "proveedor" : proveedor};
  }

}

//  A helper method that converts a json array into List<ToDo>
List<Pesaje> fromJson(String jsonData) {

  // Decode json to extract a map
  final data = json.decode(jsonData);

  // Map each todo JSON to a Todo object and return the result as a List<ToDo>
  return List<Pesaje>.from(data.map((item) => Pesaje.fromJson(item)));
}

// A helper method to convert the todo object to JSON String
String toJson(Pesaje data) {
  // First we convert the object to a map
  final jsonData = data.toMap();

  // Then we encode the map as a JSON string
  return json.encode(jsonData);
}