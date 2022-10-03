import 'package:flutter/material.dart';
import 'package:poliappflutter/inicio.dart';
import 'package:poliappflutter/login_page.dart';
import 'package:poliappflutter/providers/pesaje_provider.dart';
import 'package:provider/provider.dart';
import 'clasif.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Pesaje_provider())
        ],
      child: MaterialApp(
        title: 'Poliplasts App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        
        initialRoute: LoginPage.id,
        // initialRoute: Clasif.id,
    
        routes: {
          LoginPage.id: (context) => LoginPage(),
          // Clasif.id: (context) => Clasif(),
        },
      ),
    );
  }
}
