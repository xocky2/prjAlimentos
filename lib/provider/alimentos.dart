import 'dart:convert';
import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prj_alimentos_2/data/dummy_alimentos.dart';
import 'package:prj_alimentos_2/models/alimento.dart';
class Alimentos with ChangeNotifier {
  final Map <String, Alimento> _items = {};
  final databaseReference = FirebaseDatabase.instance.reference();
 // List<Alimento> _items = {};
  final String _baseUrl = 'https://prjalimentos-default-rtdb.firebaseio.com/';

  List<Alimento> get all {
    return [..._items.values];
  }
/*
  Future <void> loadAlimentos() async{
    final  response = await http.get(_baseUrl);
    Map<String, dynamic> data = json.decode(response.body);
  data.forEach((AlimentoId, AlimentoData) {
    _items.add(Alimentos(
      id: AlimentoId,
    nome: AlimentoData['nome'],
    marca: AlimentoData['marca'],
    caloria: AlimentoData['caloria'],
    carboidrato: AlimentoData['carboidrato'],
    proteina: AlimentoData['proteina'],
    gordura: AlimentoData['gordura'],
    tamanho: AlimentoData['tamanho'],
    unidade: AlimentoData['unidade'],
    barcode: AlimentoData['barcode'],
    ));
    });
  }
  */

  int get count {
    return _items.length;
  }

  Alimento byIndex(int i){
    return _items.values.elementAt(i);
  }

 Future <void> put(Alimento alimento) async{
    if(alimento == null){
      return;
    }
    if(alimento.id != null && alimento.id.trim().isNotEmpty &&  _items.containsKey(alimento.id)){
     await http.patch("$_baseUrl/alimentos/${alimento.id}.json",
        body: json.encode({
          'nome': alimento.nome,
          'marca': alimento.marca,
          'caloria': alimento.caloria,
          'carboidrato': alimento.carboidrato,
          'proteina': alimento.proteina,
          'gordura': alimento.gordura,
          'tamanho': alimento.tamanho,
          'unidade': alimento.unidade,
          'barcode': alimento.barcode,
        }),
      );
      _items.update(alimento.id, (_) => Alimento(
        id: alimento.id,
        nome: alimento.nome,
        marca: alimento.marca,
        caloria: alimento.caloria,
        carboidrato: alimento.carboidrato,
        proteina: alimento.proteina,
        gordura: alimento.gordura,
        tamanho: alimento.tamanho,
        unidade: alimento.unidade,
        barcode: alimento.barcode,

      ));
    }else {
      final response =  await http.post(
        "$_baseUrl/alimentos.json",
        body: json.encode({
          'nome': alimento.nome,
          'marca': alimento.marca,
          'caloria': alimento.caloria,
          'carboidrato': alimento.carboidrato,
          'proteina': alimento.proteina,
          'gordura': alimento.gordura,
          'tamanho': alimento.tamanho,
          'unidade': alimento.unidade,
          'barcode': alimento.barcode,
        }),
      );

      final id = json.decode(response.body)['name'];
      //print(json.decode(response.body));
     // final id = Random().nextDouble().toString();
      _items.putIfAbsent(id, () =>
          Alimento(
            id: id,
            nome: alimento.nome,
            marca: alimento.marca,
            caloria: alimento.caloria,
            carboidrato: alimento.carboidrato,
            proteina: alimento.proteina,
            gordura: alimento.gordura,
            tamanho: alimento.tamanho,
            unidade: alimento.unidade,
            barcode: alimento.barcode,
          ),
      );
    }

     notifyListeners();

  }
  /*
  Future <bool> remove (Alimento alimento) async {
    if(alimento != null && alimento.id != null){
      final response  = await http.delete("$_baseUrl/alimentos/{$alimento.id}.json",
        headers:{'Content-Type': 'application/json'},
      );
      if(response.statusCode ==200){

      }else{
        return false;
      }

    }
  }*/

void remove (Alimento alimento) async{
  _items.remove(alimento.id);
  databaseReference.child(alimento.id).remove();
  notifyListeners();
}


}