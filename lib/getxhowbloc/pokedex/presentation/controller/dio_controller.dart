import 'package:get/get.dart';
import 'package:push_notification_firebase/getxhowbloc/pokedex/external/pokedex_api.dart';

import '../../domain/repositories/i_pokedex_repository.dart';

class DioController extends GetxController with StateMixin {
  final PokedexApi pokedexApi;

  DioController(this.pokedexApi);

  @override
  void onInit() {
    super.onInit();
    getPokemon();
  }

  getPokemon() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await pokedexApi.getPokemon();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }
}

// Future<void> main(List<String> args) async {
//   final usecase = GetAllPokemonUsecaseImp(PokedexRepositoryImp(PokedexApi(Dio())));
//   final result = await usecase.repository.getPokemons();
//   print(result[13].img);
//   print(result[13].name);
// }

// void main() {
//   DioController controller = DioController(PokedexRepositoryImp(PokedexApi(Dio())));
//   final result = controller.getPokemon();
//   print(result[13].img);
//   print(result[13].name);
// }
