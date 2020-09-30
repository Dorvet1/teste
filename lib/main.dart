import 'package:appengenharia/models/bancoDeDados_2.dart';
import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../models/bancoDeDados.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../models/bancoDeDados_2.dart';

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
  DataBaseHelpers db = DataBaseHelpers();
  void initState() {
    DataBaseHelpers db = new DataBaseHelpers();
    BancoDeDados bd = BancoDeDados(1, "ve", "10");
    bd.toMap();
    
    db.inserirDados(bd);
    print(db);
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<_LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(
      children: <Widget>[],
    )));
  }
}
