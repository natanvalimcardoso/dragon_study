// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../shared/repositories/i_cep_repository.dart';
import '../repositories/cep_repository.dart';

class CepBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ICepRepository>(CepRepository(dio: Get.find()));
    Get.put(CepController(repository: Get.find()));
  }
}

class CepController extends GetxController with StateMixin {
  final ICepRepository repository;

  CepController({
    required this.repository,
  });

  @override
  void onInit() {
    getCep('');
    super.onInit();
  }

  void getCep(String cep) async {
    if (cep.isEmpty) {
      change(null, status: RxStatus.empty());
      return;
    } else {
      change(null, status: RxStatus.loading());
    }
    try {
      final response = await repository.receberCep(cep);
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
