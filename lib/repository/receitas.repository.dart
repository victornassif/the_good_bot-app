import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_good_bot/models/receitas.model.dart';

class ReceitasRepository {
  Future<List<Receita>> getReceitaFromRepository(String query) async {
    final response = await http
        .get('https://json-server-beers.azurewebsites.net/json?' + query);
    final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

    return parsed.map<Receita>((json) => Receita.fromJson(json)).toList();
  }

  Future<List<Receita>> getReceitasAleatorias() async {
    //preciso de 1 numero entre 0 e 690 - (length do documento da API)
    Random random = Random();
    int start = random.nextInt(690);
    int end = start + 10;

    String query = '_start=$start&_end=$end';

    return getReceitaFromRepository(query);
  }

  Future<List<Receita>> getReceitaFromTermo(String termo) async {
    String query = 'q=' + termo;
    List<Receita> list = await getReceitaFromRepository(query);
    return list.length > 3 ? list.take(3).toList() : list.toList();
  }
}
