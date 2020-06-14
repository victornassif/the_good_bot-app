class Receita {
  String id, nome;
  List<Info> listInfos;
 
  Receita({this.id, this.nome, this.listInfos});

  factory Receita.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['secao'] as List;
    List<Info> listInfos = list.map((i) => Info.fromJson(i)).toList();
    
    return Receita(
      nome: parsedJson['nome'] as String,
      listInfos: listInfos
      );
  }
}

class Info {
  String nome;
  List<String> conteudo;

  Info({this.nome, this.conteudo});
  
  factory Info.fromJson(Map<String, dynamic> parsedJson) {
    return Info(
        nome: parsedJson['nome'],
        conteudo: parsedJson['conteudo'].cast<String>());
  }
}
