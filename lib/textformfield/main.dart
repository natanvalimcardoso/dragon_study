import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_text_page.dart';


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
          page: () =>  const HomeTextPage(),
        ),
      ],
    
    );
  }
}


