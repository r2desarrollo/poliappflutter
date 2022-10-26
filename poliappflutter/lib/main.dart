import 'package:flutter/material.dart';
import 'package:poliappflutter/login_page.dart';
import 'package:poliappflutter/providers/pesaje_provider.dart';
import 'package:poliappflutter/providers/usuario_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Usuario_provider>(create: (context) => Usuario_provider()),
        ChangeNotifierProvider<PesajeProvider>(create: (context) => PesajeProvider()),

      ],
      child: MaterialApp(
        title: 'Poliplasts App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        
        initialRoute: LoginPage.id,
    
        routes: {
          LoginPage.id: (context) => LoginPage(),
        },
      ),
    );
  }
}
