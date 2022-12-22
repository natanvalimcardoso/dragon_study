import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../shared/repositories/i_pokedex_repository.dart';
import 'pokemon_controller.dart';
import '../repository/pokemon_repository.dart';

class PokemonBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<IPokedexRepositoryRodrigo>(PokemonRepositoryRodrigo(Get.find()));
    Get.put(PokemonController(Get.find()));
  }
}
