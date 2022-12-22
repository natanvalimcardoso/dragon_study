import 'package:get/get.dart';

import '../../shared/repositories/i_pokedex_repository.dart';

class PokemonController extends GetxController with StateMixin {
  final IPokedexRepositoryRodrigo _repository;

  PokemonController(this._repository);

  @override
  void onInit() {
    super.onInit();
    getPokemon();
  }

  getPokemon() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _repository.getPokemonsRodrigo();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }

}
