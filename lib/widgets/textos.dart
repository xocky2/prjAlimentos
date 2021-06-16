import 'package:flutter/material.dart';
class Textos extends StatelessWidget{
  final String seuTexto;
  final double size;
  @override
  Widget build(BuildContext context) {
    return Text(
      seuTexto,
      style: TextStyle(
          color:Colors.black,
          //backgroundColor: Colors.black12,
          fontSize: size,
      ),

    );
  }
  Textos(this.seuTexto,this.size);
}
