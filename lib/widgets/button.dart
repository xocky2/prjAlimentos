import 'package:flutter/material.dart';
class Botoes extends StatelessWidget {
  final String texto;
  final Function onPressed;
  Botoes(this.texto,{this.onPressed});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.green,
        child:Text(
          texto,
          style: TextStyle(
              color:Colors.white,
              fontSize: 20
          ),
        ),
        onPressed: onPressed);
  }
}