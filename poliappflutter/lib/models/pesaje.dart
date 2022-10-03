class Pesaje {
 late int _id;
 late int _material; 
 late double _pesoneto; 
 late String _evidencia; 
 late int _sucursal; 
 late int _proveedor; 

 Pesaje(this._material,this._pesoneto,this._evidencia,this._sucursal,this._proveedor);
 Pesaje.WithId(this._id,this._material,this._pesoneto,this._evidencia,this._sucursal,this._proveedor);
 

 int get id=>_id;
 int get material=>_material;
 double get pesoneto=>_pesoneto;
 String get evidencia=>_evidencia;
 int get sucursal=>_sucursal;

 set material(int newmaterial){
  _material=newmaterial;
 }

 set pesoneto(double newpesoneto){
  _pesoneto=newpesoneto;
 }

 set evidencia(String newevidencia){
  _evidencia=newevidencia;
 }

 set sucursal(int newsucursal){
  _sucursal=newsucursal;
 }

 Map<String,dynamic> toMap(){
  var map=<String,dynamic>{};
  map["material"]=_material;
  map["pesoneto"]=_pesoneto;
  map["evidencia"]=_evidencia;
  map["sucursal"]=_sucursal;
 
  map["id"]=_id;
  return map;
 }

 Pesaje.fromObject(dynamic o){
  _id=o["id"];
  _material=o["material"];
  _pesoneto=o["pesoneto"];
  _evidencia=o["evidencia"];
  _sucursal=o["sucursal"];

 }

}