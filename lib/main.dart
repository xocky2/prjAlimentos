import 'package:flutter/material.dart';
import 'package:prj_alimentos_2/provider/alimentos.dart';
import 'package:prj_alimentos_2/routes/app_routes.dart';
import 'package:prj_alimentos_2/views/alimento_list.dart';
import 'package:provider/provider.dart';
import 'package:prj_alimentos_2/views/alimento_form.dart';

import 'alimento_details.dart';
import 'exemplo_barcode.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
        create: (ctx) =>  new Alimentos(),
        )
    ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          //home: ExemploBarCode(),
          routes: {
            AppRoutes.HOME: (_) => AlimentoList(),
            AppRoutes.ALIMENTO_FORM: (_) => AlimentoForm(),
            AppRoutes.BARCODE: (_) => ExemploBarCode(),
           // AppRoutes.DETAILS: (_) => DetailsAlimento(),
          },
        ),
      );
  }
}
