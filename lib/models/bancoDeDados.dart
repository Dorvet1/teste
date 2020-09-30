class BancoDeDados {
  int _id;
  String _nome;
  String _value;

  int get id => _id;

  set id(int value) => _id = value;

  String get nome => _nome;

  set nome(String value) => _nome = value;

  String get value => _value;

  set value(String value) => _value = value;
  BancoDeDados(this._id, this._nome, this._value);

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["id"] = _id;
    map["nome"] = _nome;
    map["value"] = _value;
    return map;
  }

  BancoDeDados.deMapParaModel(Map<String, dynamic> dados) {
    this._id = dados["id"];
    this._nome = dados["nome"];
    this._value= dados["value"];
  }
}
