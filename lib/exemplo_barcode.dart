import 'package:prj_alimentos_2/widgets/button.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
class ExemploBarCode extends StatefulWidget {
  @override
  _ExemploBarCodeState createState() => _ExemploBarCodeState();
}

class _ExemploBarCodeState extends State<ExemploBarCode> {
  String codigoLido="-1";
  final Map<String, String> _formData = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Pesquisa de alimentos"),
      ),
      body: codbar(),
    );
  }

  codbar() {
    return Container(
      height: double.infinity,
      alignment: Alignment.topCenter,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget> [
            Botoes("Abrir a câmera", onPressed: leitura),
            codigoLido!=null?Text("Código de barras:"+codigoLido):Text("Código não identificado"),
            //Textos(codigoLido),

          ],
        ),
      );
  }

  Future <void> leitura() async{
  String resultadoLeitura;
  try{
    resultadoLeitura = await FlutterBarcodeScanner.scanBarcode(
        "#ff0000", "Cancelar", true, ScanMode.QR);
    Navigator.of(context).pop();
  }on PlatformException{
    resultadoLeitura="Falha na leitura";
  }
  if (!mounted)return;
  setState(() {
    codigoLido = resultadoLeitura;
  });
  }
}
