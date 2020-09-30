import 'bancoDeDados.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class DataBaseHelpers {
  static DataBaseHelpers _dataBaseHelpers;
  static Database _dataBase;
  DataBaseHelpers._createInstance();
  factory DataBaseHelpers() {
    if (_dataBaseHelpers == null) {
      _dataBaseHelpers = DataBaseHelpers._createInstance();
    }
    return _dataBaseHelpers;
  }
  // ignore: unused_element
  Future<Database> get _database async {
    if (_database == null) {
      _dataBase = await inicializaBanco();
    }
    return _dataBase;
  }

  String nomeTabela = "tbl_App";
  String colId = "id";
  String colNome = "nome";
  String colValue = "value";
  void _criaBanco(Database db, int version) async {
    await db.execute('CREATE TABLE $nomeTabela('
        '$colId INTEGER PRIMARY KEY AUTOINCREMENT,'
        '$colNome Text,'
        '$colValue Text)');
  }

  Future<Database> inicializaBanco() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String caminho = directory.path + "bdApp.bd";
    var bancodeDados =
        await openDatabase(caminho, version: 1, onCreate: _criaBanco);
    return bancodeDados;
  }

  Future<int> inserirDados(BancoDeDados obj) async {
    Database db = await this._database;
    var resultado = await db.insert(nomeTabela, obj.toMap());
    return resultado;
  }
}
