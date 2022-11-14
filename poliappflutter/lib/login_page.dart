import 'package:poliappflutter/providers/usuario_provider.dart';
import 'package:poliappflutter/widgets/input_decoration.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'inicio.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  @override
  Widget build(BuildContext context) {
    final TextEditingController txtCorreo = TextEditingController();
    final TextEditingController txtPassword = TextEditingController();

    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            cajapurpura(size),
            iconopersona(),
            loginform(context, txtCorreo, txtPassword)
          ],
        ),
      ),
    );
  }

  SingleChildScrollView loginform(BuildContext context,
      TextEditingController txtCorreo, TextEditingController txtPassword) {
    final usuarioProvider = Provider.of<Usuario_provider>(context);
    void ingresar() {
      var usuarios = usuarioProvider.usuarios;
      if (usuarios.where((e) => e.email == usuarioProvider.email).length > 0 &&
          usuarios.where((e) => e.password == usuarioProvider.password).length >
              0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Inicio()),
        );
      } else {
        print('Error');
      }
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 250),
          Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: double.infinity,
              // height: 350,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    )
                  ]),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Text('Login', style: Theme.of(context).textTheme.headline4),
                  const SizedBox(height: 30),
                  Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          controller: txtCorreo,
                          onChanged: (value) => usuarioProvider.email = value,
                          decoration: InputDecorations.inputDecoration(
                              hintext: 'ejemplo@hotmail.com',
                              labeltext: 'Correo electronico',
                              icono: const Icon(Icons.alternate_email_rounded)),
                          validator: (value) {
                            String pattern =
                                r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                            RegExp regExp = new RegExp(pattern);
                            return regExp.hasMatch(value ?? '')
                                ? null
                                : 'El valor ingresado no es un correo';
                          },
                        ),
                        const SizedBox(height: 30),
                        TextFormField(
                          autocorrect: false,
                          obscureText: true,
                          controller: txtPassword,
                          onChanged: (value) =>
                              usuarioProvider.password = value,
                          decoration: InputDecorations.inputDecoration(
                              hintext: '******',
                              labeltext: 'Contraseña',
                              icono: const Icon(Icons.lock_outline)),
                          validator: (value) {
                            return (value != null && value.length >= 6)
                                ? null
                                : 'La contraseña debe ser mayor o igual a los 6 caracteres';
                          },
                        ),
                        const SizedBox(height: 30),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          disabledColor: Color.fromARGB(255, 34, 96, 36),
                          color: Colors.green,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 15),
                            child: const Text(
                              'Ingresar',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                          onPressed: ingresar,
                        )
                      ],
                    ),
                  )
                ],
              )),
          const SizedBox(height: 50),
        ],
      ),
    );
  }

  SafeArea iconopersona() {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        width: double.infinity,
        child: Image.asset(
          'imagenes/logoSAPP.png',
          height: 180.0,
        ),
      ),
    );
  }

  Container cajapurpura(Size size) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.green,
        Colors.green,
      ])),
      width: double.infinity,
      height: size.height * 0.4,
      child: Stack(
        children: [
          Positioned(child: burbuja(), top: 90, left: 30),
          Positioned(child: burbuja(), top: -40, left: -30),
          Positioned(child: burbuja(), top: -50, right: -20),
          Positioned(child: burbuja(), bottom: -50, left: 10),
          Positioned(child: burbuja(), bottom: 120, right: 20)
        ],
      ),
    );
  }

  Container burbuja() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromARGB(11, 213, 25, 25)),
    );
  }
}
