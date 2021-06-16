import 'package:flutter/material.dart';
class Alimento{
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

  const Alimento({
    this.id,
    @required this.nome,
    @required this.marca,
    @required this.caloria,
    @required this.carboidrato,
    @required this.proteina,
    @required this.gordura,
    @required this.tamanho,
    @required this.unidade,
    @required this.barcode,


  });

  factory Alimento.fromJson(Map<String, dynamic> json) {
    return Alimento(
      nome: json['nome'],
      marca: json['marca'],
      caloria: json['caloria'],
      carboidrato: json['carboidrato'],
      proteina: json['proteina'],
      gordura: json['gordura'],
      tamanho: json['tamanho'],
      unidade: json['unidade'],
      barcode: json['barcode'],
    );
  }
}