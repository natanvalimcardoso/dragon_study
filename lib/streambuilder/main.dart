import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:push_notification_firebase/streambuilder/pokedex/presentation/pages/pokedex_page.dart';

void main(){
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
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const PokedexPage(),
      },
    );
  }
}
