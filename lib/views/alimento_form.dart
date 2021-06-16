import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:prj_alimentos_2/models/alimento.dart';
import 'package:prj_alimentos_2/provider/alimentos.dart';
import 'package:prj_alimentos_2/widgets/button.dart';
import 'package:provider/provider.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class AlimentoForm extends StatefulWidget {
  @override
  _AlimentoFormState createState() => _AlimentoFormState();
}

class _AlimentoFormState extends State<AlimentoForm> {
  String codigoLido;
  final _form = GlobalKey<FormState>();
  bool _isLoading = false;

  final Map<String, String> _formData = {};

  void _loadFormData(Alimento alimento){
    if (alimento != null){
      _formData['id'] =alimento.id;
      _formData['nome'] =alimento.nome;
      _formData['marca'] =alimento.marca;
      _formData['caloria'] =alimento.caloria;
      _formData['carboidrato'] =alimento.carboidrato;
      _formData['proteina'] =alimento.proteina;
      _formData['gordura'] =alimento.gordura;
      _formData['tamanho'] =alimento.tamanho;
      _formData['unidade'] =alimento.unidade;
      _formData['barcode'] =alimento.barcode;

    }
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final Alimento alimento = ModalRoute.of(context).settings.arguments ;
    _loadFormData(alimento);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Formulário de Alimentos'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () async {
                final isValid = _form.currentState.validate();

                if(isValid){
                  _form.currentState.save();
                  setState(() {
                    _isLoading = true;
                  });

                 await Provider.of<Alimentos>(context, listen: false).put(Alimento(
                    id: _formData['id'],
                    nome: _formData['nome'],
                    marca: _formData['marca'],
                    caloria: _formData['caloria'],
                    carboidrato: _formData['carboidrato'],
                    proteina: _formData['proteina'],
                    gordura: _formData['gordura'],
                    tamanho: _formData['tamanho'],
                    unidade: _formData['unidade'],
                    barcode: _formData['barcode'],
                    ),
                  );
                  setState(() {
                    _isLoading = false;
                  });
                  Navigator.of(context).pop();
                }

              }
          ),
        ],
      ),
      body: _isLoading
          ? Center(
          child: CircularProgressIndicator(),
      ):
      Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['nome'],
                decoration: InputDecoration(labelText: 'Nome'),
                validator :(value) {
                  if ( value == null || value.trim().isEmpty){
                    return 'Nome inválido';
                  }
                  if (value.trim().length<3){
                    return 'Nome muito pequeno. No mínimo 3 letras';
                  }
                  return null ;
                  },
                onSaved: (value) => _formData['nome'] = value,

              ),
              TextFormField(
                initialValue: _formData['marca'],
                decoration: InputDecoration(labelText: 'Marca'),
                onSaved: (value) => _formData['marca'] = value,

              ),
              TextFormField(
                initialValue: _formData['caloria'],
                decoration: InputDecoration(labelText: 'Caloria'),
                onSaved: (value) => _formData['caloria'] = value,

              ),
              TextFormField(
                initialValue: _formData['carboidrato'],
                decoration: InputDecoration(labelText: 'Carboidrato'),
                onSaved: (value) => _formData['carboidrato'] = value,

              ),
              TextFormField(
                initialValue: _formData['proteina'],
                decoration: InputDecoration(labelText: 'Proteina'),
                onSaved: (value) => _formData['proteina'] = value,

              ),
              TextFormField(
                initialValue: _formData['gordura'],
                decoration: InputDecoration(labelText: 'Gordura'),
                onSaved: (value) => _formData['gordura'] = value,

              ),
              TextFormField(
                initialValue: _formData['tamanho'],
                decoration: InputDecoration(labelText: 'Tamanho da porção'),
                onSaved: (value) => _formData['tamanho'] = value,

              ),
              TextFormField(
                initialValue: _formData['unidade'],
                decoration: InputDecoration(labelText: 'Unidade da porção ( gramas, ml, kg ...)'),
                onSaved: (value) => _formData['unidade'] = value,

              ),
              TextFormField(
                initialValue: _formData['barcode'],
                decoration: InputDecoration(labelText: 'Código de barras'),
                //onSaved: (value) => _formData['barcode'] = codigoLido,
                onTap: leitura,


              ),
              codigoLido!=null?Text("Código de barras:"+codigoLido):Text("Código não identificado"),
              //Botoes("Cadastrar código de barras", onPressed: leitura),

            ],
          ),

        ),
      ),
    );

  }
  Future <void> leitura() async{
    String resultadoLeitura;
    try{
      resultadoLeitura = await FlutterBarcodeScanner.scanBarcode(
          "#ff0000", "Cancelar", true, ScanMode.QR);

    }on PlatformException{
      resultadoLeitura="Falha na leitura";
    }
    if (!mounted)return;
    setState(() {
      codigoLido = resultadoLeitura;
      _formData['barcode'] = codigoLido;

    });
  }
}

