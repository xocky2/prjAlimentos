import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prj_alimentos_2/widgets/textos.dart';

class DetailsAlimento extends StatelessWidget {
  final String id;
  final String nome;
  final String marca;
  final String caloria;
  final String carboidrato;
  final String proteina;
  final String gordura;
  final String tamanho;
  final String unidade;
  final String barcode;
  DetailsAlimento(this.id,this.nome,this.marca,this.caloria,this.carboidrato,this.proteina,this.gordura,this.tamanho,this.unidade,this.barcode,);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tabela nutricional do "+nome),
      ),
      body: _metodoBody(),
    );

  }

  _metodoBody(){

    return ListView(
      padding: EdgeInsets.all(30),
        children:  <Widget>[
          Container(
            height: 40,
            color: Colors.black12,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                SizedBox(height: 10,),
                Textos("Porduto: "+nome,15),

              ],
            ),
            //const Center(child: Textos("Porduto: "+nome,15),),
          ),
          Container(
            height: 40,
            color: Colors.black12,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                SizedBox(height: 10,),
                Textos("Marca: "+marca,15),

              ],
            ),
            //const Center(child: Textos("Porduto: "+nome,15),),
          ),
          Container(
            height: 40,
            color: Colors.black12,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                SizedBox(height: 10,),
                Textos("Tamanho da porção: "+tamanho+" "+unidade,15),

              ],
            ),
            //const Center(child: Textos("Porduto: "+nome,15),),
          ),
          Container(
            height: 40,
            color: Colors.blueGrey,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                SizedBox(height: 10,),
                Textos("Calorias: "+caloria+" kcal ",15),

              ],
            ),
            //const Center(child: Textos("Porduto: "+nome,15),),
          ),
          Container(
            height: 40,
            color: Colors.blueGrey,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                SizedBox(height: 10,),
                Textos("Carboidrato: "+carboidrato+" g ",15),

              ],
            ),
            //const Center(child: Textos("Porduto: "+nome,15),),
          ),
          Container(
            height: 40,
            color: Colors.blueGrey,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                SizedBox(height: 10,),
                Textos("Proteína: "+proteina+" g ",15),

              ],
            ),
            //const Center(child: Textos("Porduto: "+nome,15),),
          ),
          Container(
            height: 40,
            color: Colors.blueGrey,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children:<Widget> [
                SizedBox(height: 10,),
                Textos("Gordura: "+gordura+" g ",15),

              ],
            ),
            //const Center(child: Textos("Porduto: "+nome,15),),
          ),



            ],
          );


    //Textos("Porduto: "+nome,15),
    //Textos("Marca:"+marca,15),
    /*return Container(
      width: 100,
      color: Colors.white70,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
            children: <Widget>[
              Textos("Porduto: "+nome,15),


            ],
          ),
        ],
      ),
    );*/
  }
}
