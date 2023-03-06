import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'modules/cep/controller/cep_controller.dart';
import 'modules/cep/pages/cep_page.dart';


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
          page: () =>  const CepPageGetx(),
          binding: CepBindings(),
        ),
      ],
    
    );
  }
}


