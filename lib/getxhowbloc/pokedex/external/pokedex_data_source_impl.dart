import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:push_notification_firebase/getxhowbloc/pokedex/domain/model/pokemon_model.dart';

import '../infra/datasource/i_pokedex_datasource.dart';

class PokedexDataSourceImpl implements IPokedexDatasource {
  final Dio _dio;

  PokedexDataSourceImpl(this._dio);

  @override
  Future<List<PokemonModel>> getPokemon() async {
    try {
      final response = await _dio.get('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
      final json = jsonDecode(response.data);
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => PokemonModel.fromMap(e)).toList();
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

