import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../domain/repositories/i_pokedex_repository.dart';
import '../../external/pokedex_api.dart';
import 'dio_controller.dart';

class DioBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<IPokedexRepository>(PokedexApi(Get.find()));
    Get.put(DioController(Get.find()));
  }
}
