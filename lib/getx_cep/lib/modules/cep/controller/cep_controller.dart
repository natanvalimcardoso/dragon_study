import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:push_notification_firebase/bloc_cep/lib/src/modules/cep/repositories/cep_repository.dart';
import 'package:push_notification_firebase/bloc_cep/lib/src/shared/repositories/i_cep_repository.dart';

class CepBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(Dio());
    Get.put<ICepRepository>(CepRepository());
    Get.put(CepController());
  }
}

class CepController extends GetxController with StateMixin {
  final CepRepository repository = CepRepository();

  void getCep(String cep) async {
    change(null, status: RxStatus.loading());
    try {
      final response = await repository.receberCep(cep);
      change(response, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}
