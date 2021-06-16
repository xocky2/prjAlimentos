import 'package:flutter/material.dart';
import 'package:prj_alimentos_2/alimento_details.dart';
import 'package:prj_alimentos_2/models/alimento.dart';
import 'package:prj_alimentos_2/provider/alimentos.dart';
import 'package:prj_alimentos_2/routes/app_routes.dart';
import 'package:provider/provider.dart';

class AlimentoTile extends StatelessWidget {
  final Alimento alimento;
  const AlimentoTile(this.alimento);
  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(child: Icon(Icons.assignment_rounded)),
      title: Text(alimento.nome),
      subtitle: Text(alimento.marca),
      onTap: (){
        Navigator.push(
          context,
        MaterialPageRoute(builder: (context)=> DetailsAlimento(
          alimento.id,
          alimento.nome,
          alimento.marca,
          alimento.caloria,
          alimento.carboidrato,
          alimento.proteina,
          alimento.gordura,
          alimento.tamanho,
          alimento.unidade,
          alimento.barcode,
        )),

    );
      },
      trailing: Container(
        width: 100,
        child: Row(
        children: <Widget>[
          IconButton(
              icon: Icon(Icons.edit) ,
              color: Colors.orange,
              onPressed: (){
                Navigator.of(context).pushNamed(
                  AppRoutes.ALIMENTO_FORM,
                  arguments: alimento,
                );
              }
              ),
          IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: (){
                showDialog(context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Excluir alimento'),
                  content: Text('Tem certeza ?'),
                  actions: <Widget>[
                    FlatButton(
                      child: Text('Não'),
                      onPressed: () => Navigator.of(context).pop(false),
                    ),
                    FlatButton(
                      child: Text('Sim'),
                      onPressed: () => Navigator.of(context).pop(true),
                    ),
                  ],
                ),
                ).then((confirmed){
                    if(confirmed){
                      Provider.of<Alimentos>(context, listen:false).remove(alimento);
                    }
                });
              }
          ),
        ]),
    ),
    );
  }
}
