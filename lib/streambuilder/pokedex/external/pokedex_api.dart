import 'package:dio/dio.dart';
import 'package:push_notification_firebase/streambuilder/pokedex/domain/model/pokemon_model.dart';

import '../domain/repositories/i_pokedex_repository.dart';

class PokedexApi implements IPokedexRepository {
  final Dio _dio;

  PokedexApi(this._dio);

  @override
  Future<List<PokemonModel>> getPokemons() async {
    try {
      final response = await _dio.get('https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
      return (response.data['pokemon']).map((e) => PokemonModel.fromMap(e)).toList();
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
