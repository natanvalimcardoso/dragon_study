import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class ServiceNotification extends GetxService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  Future<void> initialize() async {
    NotificationSettings settings = await messaging.requestPermission(
      badge: true,
      sound: true,
      alert: true,
    );
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _onMessage();
  }
}

//*Aplicativo fechado
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

//*Aplicativo Aberto
_onMessage() {
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    print('Message Title: ${message.notification?.title}');
    print('Message body: ${message.notification?.body}');
  
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
    
  });
}

//Método para para redirecionar para uma página específica depois de receber a mensagem

//   _goToPageAfterMessage(message) {
//     final String route = message.data['route'] ?? '';
//     if (route.isNotEmpty) {
//       print('vou para rotas $route');
//     }
// }

//* Pegar token
//  _getDeviceFirebaseToken() async {
//     final token = await FirebaseMessaging.instance.getToken();
//   }
