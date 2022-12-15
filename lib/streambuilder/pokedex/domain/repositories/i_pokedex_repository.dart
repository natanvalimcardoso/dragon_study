import '../model/pokemon_model.dart';

abstract class IPokedexRepository { 
  Future<List<PokemonModel>> getPokemons();
}