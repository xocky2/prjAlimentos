import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:prj_alimentos_2/data/dummy_alimentos.dart';
import 'package:prj_alimentos_2/models/alimento.dart';
import 'package:prj_alimentos_2/routes/app_routes.dart';
import 'package:prj_alimentos_2/widgets/alimento_tile.dart';
import 'package:prj_alimentos_2/provider/alimentos.dart';
import 'package:provider/provider.dart';
import 'package:prj_alimentos_2/exemplo_barcode.dart';

class AlimentoList extends StatefulWidget {
  @override
  _AlimentoListState createState() => _AlimentoListState();
}

class _AlimentoListState extends State<AlimentoList> {
  String codigoLido;
  bool valido;

  /*
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // carregar os produtos
    Provider.of<Alimentos>(context, listen:false).loadAlimentos();
  }
*/

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

  }

  @override
  Widget build(BuildContext context) {
    final Alimentos alimentos  = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de alimentos'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.ALIMENTO_FORM
              );
          }),
          IconButton(icon: Icon(Icons.search), onPressed: () {
           leitura();
              int num = alimentos.count;
              for (var i = 1; i<= num; i++){
              final Alimento aln = alimentos.byIndex(i);
              if(codigoLido == aln.barcode){
                print("Código: "+aln.barcode);
              }else{
                print("No: "+codigoLido);
              }
              };
            }
            //Navigator.of(context).pop();
            // Navigator.of(context).pushNamed(AppRoutes.BARCODE);
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: alimentos.count,
          itemBuilder: (ctx, i ) =>  AlimentoTile(alimentos.byIndex(i)),

        //Text(alimentos.values.elementAt(i).name),

      ),

    );
  }
  Future <void> leitura() async{
    String resultadoLeitura;
    try{
      resultadoLeitura = await FlutterBarcodeScanner.scanBarcode(
          "#ff0000", "Cancelar", true, ScanMode.QR);
      valido = true;
      //Navigator.of(context).pop();
    }on PlatformException{
      resultadoLeitura="Falha na leitura";
      valido = false;
    }
    if (!mounted)return;
    setState(() {
      codigoLido = resultadoLeitura;

    });
  }
}
