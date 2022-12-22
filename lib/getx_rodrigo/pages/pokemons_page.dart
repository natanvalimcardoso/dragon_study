import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification_firebase/getx_rodrigo/controller/pokemon_controller.dart';

import '../../shared/models/pokemon_model.dart';


class PokemonsPage extends GetView<PokemonController> {
  const PokemonsPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Page Rodrigueira'),
      ),
      body: controller.obx((state) {
        final List<Pokemon> pokemons = state;
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
