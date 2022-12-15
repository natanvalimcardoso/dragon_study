import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PokedexPage extends GetView<PokedexController> {

  const PokedexPage({ Key? key }) : super(key: key);

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Pokedex'),),
           body: Container(),
       );
  }
}