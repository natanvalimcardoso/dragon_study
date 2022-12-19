import 'package:get/get.dart';

import '../../external/pokedex_data_source_impl.dart';

class DioController extends GetxController with StateMixin {
  final PokedexDataSourceImpl dataSource;

  DioController(this.dataSource);

  @override
  
  void onInit() {
    super.onInit();
    getPokemon();
  }

  getPokemon() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await dataSource.getPokemon();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }
}

// Future<void> main(List<String> args) async {
//   final usecase = GetAllPokemonUsecaseImp(PokedexRepositoryImp(PokedexDataSourceImpl(Dio())));
//   final result = await usecase.repository.getPokemons();
//   print(result[13].img);
//   print(result[13].name);
// }

// Future<void> main() async {
//   final controller = DioController(PokedexDataSourceImpl(Dio()));
//   final result = await controller.getPokemon();
//   print(result[13].img);
// }
