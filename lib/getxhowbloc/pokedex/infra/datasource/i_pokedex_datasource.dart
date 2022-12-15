
import '../../domain/model/pokemon_model.dart';

abstract class IPokedexDatasource {
  Future<List<PokemonModel>> getPokemon();
}