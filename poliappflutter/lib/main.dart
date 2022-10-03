import 'package:flutter/material.dart';
import 'package:poliappflutter/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    );
  }
}
