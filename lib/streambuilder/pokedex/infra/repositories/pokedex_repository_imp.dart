import '../../domain/model/pokemon_model.dart';
import '../../domain/repositories/i_pokedex_repository.dart';
import '../datasource/i_pokedex_datasource.dart';


class PokedexRepositoryImp implements IPokedexRepository {
  final IPokedexDatasource datasource;

  PokedexRepositoryImp(this.datasource);


  @override
  Future<List<PokemonModel>> getPokemons() {
    try {
      return datasource.getPokemon();
    } catch (e) {
      return throw ('Erro ao carregar lista de pokemons');
    }
  }
}
