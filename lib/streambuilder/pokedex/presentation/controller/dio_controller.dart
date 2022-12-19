import 'dart:async';

import 'package:dio/dio.dart';
import 'package:push_notification_firebase/streambuilder/pokedex/domain/usecases/get_pokemons_usecase.dart';
import 'package:push_notification_firebase/streambuilder/pokedex/external/pokedex_data_source_impl.dart';
import 'package:push_notification_firebase/streambuilder/pokedex/infra/repositories/pokedex_repository_imp.dart';

class DioController {
  final StreamController _stream = StreamController.broadcast();
  Stream get stream => _stream.stream;

  getPokemons() {
    final usecase = GetAllPokemonUsecaseImp(PokedexRepositoryImp(PokedexDataSourceImpl(Dio())));
    usecase.repository.getPokemons().then((value) {
      _stream.add(value);
    });
    return _stream.stream;
  }
}

// void main(List<String> args) {
//   final controller = DioController();
//   controller.getPokemons().then((value) {
//     print(value[13].img);
//     print(value[13].name);
//   });
// }


