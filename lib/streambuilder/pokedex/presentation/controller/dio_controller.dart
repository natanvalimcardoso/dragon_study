import 'package:get/get.dart';

import '../../domain/repositories/i_pokedex_repository.dart';

class DioController extends GetxController with StateMixin { 

  final IPokedexRepository _dioRepository;

  DioController(this._dioRepository);

  @override
  void onInit() {
    super.onInit();
    findUsers();
  }

  Future<void> findUsers() async {
    change([], status: RxStatus.loading());
    try {
      final dados = await _dioRepository.findAllUsers();
      change(dados, status: RxStatus.success());
    } catch (e) {
      print(e);
      change([], status: RxStatus.error('Erro ao buscar usuários'));
    }
  }

}