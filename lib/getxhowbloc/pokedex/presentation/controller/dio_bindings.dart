import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../external/pokedex_data_source_impl.dart';
import 'dio_controller.dart';

class DioBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put(PokedexDataSourceImpl(Get.find()));
    Get.put(DioController(Get.find()));
  }
}
