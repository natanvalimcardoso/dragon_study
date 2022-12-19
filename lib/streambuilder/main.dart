import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pokedex/presentation/pages/pokedex_page.dart';

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
        primarySwatch: Colors.red ,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () =>  PokedexPage(),
        ),
      ],
    );
  }
}
