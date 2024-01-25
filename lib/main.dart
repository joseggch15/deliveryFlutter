import 'package:flutter/material.dart';
import 'package:udemy_flutter_delivery/src/login/login_page.dart';
import 'package:udemy_flutter_delivery/src/register/register_page.dart';
import 'package:udemy_flutter_delivery/src/util/my_colors.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App Flutter',
      debugShowCheckedModeBanner: false, // esta quita la etiqueta de debug que sale en el telefono
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
      },
      theme: ThemeData(
        // fontFamily: 'Angeline Vintage_Demo',
        primaryColor: MyColors.primaryColor
      ),
    );
  }
}
