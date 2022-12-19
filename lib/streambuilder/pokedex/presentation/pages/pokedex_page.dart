import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/dio_controller.dart';

import '../../domain/model/pokemon_model.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  final controller = Get.put(DioController());
  late Stream stream;

  @override
  void initState() {
    stream = controller.getPokemons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Dio Page'),
        ),
        body: StreamBuilder(
          stream: stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return SizedBox(
                child: Center(
                  child: Text(snapshot.error.toString()),
                ),
              );
            }
            if (snapshot.hasData) {
              final List<PokemonModel> pokemons = snapshot.data!;
              return ListView.builder(
                itemCount: pokemons.length,
                itemBuilder: (context, index) {
                  final pokemon = pokemons[index].name;
                  return ListTile(
                    title: Text(pokemon.toString()),
                  );
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}



// return ListView.builder(
//           itemCount: pokemons.length,
//           itemBuilder: (context, index) {
//             final pokemon = pokemons[index].name;
//             return ListTile(
//               title: Text(pokemon.toString()),
//             );
//           },
//         );

// onPressed: () => controller.getPokemon(),