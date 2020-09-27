import 'package:appengenharia/bancoDeDados_2.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'bancoDeDados.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'bancoDeDados_2.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'APP Engenharia ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: _LoginPage(),
    );
  }
}

class _LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  DataBaseHelper db = DataBaseHelper();
  List<BancoDeDados> bd = List<BancoDeDados>();
  void initState() {
    super.initState();
   // BancoDeDados bd1 = BancoDeDados(1, " velocidade", 10);
    //BancoDeDados bd2 = BancoDeDados(2, " velocidade ", 20);
    //db.insertBd(bd1);
   // db.insertBd(bd2);//
    db.getDados().then((lista) {
      setState(() {
        bd = lista;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: bd.length,
      itemBuilder: (context, index) {
        _listaExemplo(context, index);
      },
    ));
  }

  _listaExemplo(BuildContext context, int index) {
    return Container(
        child: Column(
      children: <Widget>[Text(bd[index].nome)],
    ));
  }
}
