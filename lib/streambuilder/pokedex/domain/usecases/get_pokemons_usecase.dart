import '../model/pokemon_model.dart';
import '../repositories/i_pokedex_repository.dart';

abstract class IGetAllPokemonUsecase {
  Future<List<PokemonModel>> call();
}

class GetAllPokemonUsecaseImp implements IGetAllPokemonUsecase {
  const GetAllPokemonUsecaseImp(this.repository);

  final IPokedexRepository repository;

  @override
  Future<List<PokemonModel>> call() async {
    return repository.getPokemonss();
  }
}
