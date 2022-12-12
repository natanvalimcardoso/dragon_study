import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class HomeService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );

    _onMessage();
    _getDeviceFirebaseToken();
  }

  //Método para receber a mensagem quando o app está em foreground	
  _onMessage() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

 //Método para ver o token do dispositivo
  _getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    debugPrint('=======================================');
    debugPrint('TOKEN: $token');
    debugPrint('=======================================');
  }

//Método para para redirecionar para uma página específica depois de receber a mensagem

//   _goToPageAfterMessage(message) {
//     final String route = message.data['route'] ?? '';
//     if (route.isNotEmpty) {
//       print('vou para rotas $route');
//     }
// }
}
