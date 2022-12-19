import 'dart:convert';

import 'package:dio/dio.dart';

import '../../shared/models/pokemon_model.dart';
import '../../shared/repositories/i_pokedex_repository.dart';

class PokemonRepository implements IPokedexRepositoryRodrigo {
  final Dio _dio;

  PokemonRepository(this._dio);

  @override
  Future<List<Pokemon>> getPokemonsRodrigo() async {
    try {
      final response = await _dio.get('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
      final json = jsonDecode(response.data);
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => Pokemon.fromMap(e)).toList();
    } on DioError catch (error) {
      if (error.response?.statusCode == 404) {
        throw Exception('Pokemon não encontrado');
      } else if (error.response?.statusCode == 401) {
        throw Exception('Não autorizado');
      } else if (error.response?.statusCode == 500) {
        throw Exception('Erro interno do servidor');
      } else {
        throw Exception('Erro desconhecido');
      }
    }
  }
}
