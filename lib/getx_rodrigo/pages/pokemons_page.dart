import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification_firebase/getx_rodrigo/controller/pokemon_controller.dart';

import '../../shared/models/pokemon_model.dart';

class PokemonsPage extends StatelessWidget {
  PokemonsPage({super.key});
  
  final _pokemonController = Get.put(PokemonController(Get.find()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Page Rodrigueira'),
      ),
      body: _pokemonController.obx(
        (state) {
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
        },
        onError: (error) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(error!),
                TextButton(
                  onPressed: () => _pokemonController.getPokemon(),
                  child: Text('Tentar novamente'),
                )
              ],
            ),
          );
        },
        
      ),
    );
  }
}

  // body: controller.obx(
  //       (state) {
  //         final List<Pokemon> pokemons = state;
  //         return ListView.builder(
  //           itemCount: pokemons.length,
  //           itemBuilder: (context, index) {
  //             final pokemon = pokemons[index].name;
  //             return ListTile(
  //               title: Text(pokemon.toString()),
  //             );
  //           },
  //         );
  //       },
  //       onError: (error) {
  //         return SizedBox(
  //           width: double.infinity,
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               Text(error!),
  //               TextButton(
  //                 onPressed: () => controller.getPokemon(),
  //                 child: Text('Tentar novamente'),
  //               )
  //             ],
  //           ),
  //         );
  //       },
  //     ),