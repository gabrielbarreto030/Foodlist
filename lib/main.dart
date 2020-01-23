import 'package:flutter/material.dart';
import 'package:foodlist/screen/Dashboard.dart';
import 'package:foodlist/screen/Formulario_compras.dart';
import 'package:foodlist/screen/Lista_de_compras.dart';

void main() => runApp(foodlist());

class foodlist extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red[900],
        accentColor: Colors.grey[600],
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.grey[600],
          textTheme: ButtonTextTheme.primary,
        ), //ButtonThemeData
      ),//ThemeData
      home:Dashboard(),
    );
  }
}


