import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification_firebase/getxhowbloc/pokedex/presentation/controller/dio_controller.dart';

import '../../domain/model/pokemon_model.dart';

class PokedexPage extends GetView<DioController> {
  const PokedexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Page'),
      ),
      body: controller.obx((state) {
        final List<PokemonModel> pokemons = state as List<PokemonModel>;
        return ListView.builder(
          itemCount: pokemons.length,
          itemBuilder: (context, index) {
            final pokemon = pokemons[index].name;
            return ListTile(
              title: Text(pokemon.toString()),
            );
          },
        );
      }, onError: (error) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error!),
              TextButton(
                onPressed: () => controller.getPokemon(),
                child: Text('Tentar novamente'),
              )
            ],
          ),
        );
      }),
    );
  }
}
