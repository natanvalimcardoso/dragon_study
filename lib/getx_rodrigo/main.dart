import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/pokemon_bindinds.dart';
import 'pages/pokemons_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () =>  PokemonsPage(),
          binding: PokemonBindings(),
        ),
      ],
    );
  }
}
