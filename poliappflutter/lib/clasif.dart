import 'dart:io';
import 'package:flutter/material.dart';
import 'package:poliappflutter/ticket.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'ticket.dart';




class Clasif extends StatefulWidget {
  static String id = 'clasif';
  @override
  _ClasifState createState() => _ClasifState();
}
class _ClasifState extends State<Clasif> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker(); //Escoger imagen de cámara
  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }
  @override
  void dispose() {
    super.dispose();
    Tflite.close();
  }
  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 12, //Número de categorías
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _output = output!;
      _loading = false;
    });
  }
  loadModel() async {
    await Tflite.loadModel(
      model: 'assets/model_unquant.tflite',
      labels: 'assets/labels.txt',
    );
  }
  pickImage() async {
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }
  Widget _bottoncarga() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 23, 182, 103),
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 50),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      );
      return ElevatedButton(
        style: raisedButtonStyle,
        onPressed: () {
          Navigator.push(
            context,
              MaterialPageRoute(builder: (context) => Ticket()),
          );
        },
        child: const Text('CARGAR FOTO',
            style: TextStyle(color: Colors.white, fontSize: 16.0)),
      );
    });
  }
//A partir de aquí se puede modificar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 23, 182, 103),
          title: Text('Clasificación'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: new Icon(Icons.logout_rounded),
              onPressed: () => print('hi on icon action'),
            ),
          ],
        ),
      body: Container(
        color: const Color.fromARGB(204, 255, 255, 255),
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 50),
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Center(
                  child: _loading == true
                      ? null //No quitar
                      : Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.width * 0.5,
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    //No quitar
                                    _image,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const Divider(
                                height: 25,
                                thickness: 1,
                              ),
                              _output != null
                                  ? Text(
                                      'El material es: ${_output[0]['label']}', //No modificar esta linea
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : Container(),
                              const Divider(
                                height: 25,
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: pickImage, //No quitar
                      child: Container(
                        width: MediaQuery.of(context).size.width - 200,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 17),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 23, 182, 103),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Text(
                          'Tomar foto',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    _bottoncarga(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}