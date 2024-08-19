import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_firebase_websocket_chat/services/api.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title ${message.notification?.title}');
  print('Body ${message.notification?.body}');
  print('Payload ${message.data}');
}

void _handleMessage(RemoteMessage message) {
  print('Title ${message.notification?.title}');
  print('Body ${message.notification?.body}');
  print('Payload ${message.data}');
}

class CloudMessaging {
  final _messagingInstance = FirebaseMessaging.instance;

  Future<void> init() async {
    NotificationSettings notificationSettings =
        await _messagingInstance.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: true,
      criticalAlert: true,
      provisional: true,
      sound: true,
    );

    print("adfasdf$notificationSettings");

    final fcmToken = await _messagingInstance.getToken();
    if (fcmToken != null) {
      if (Platform.isAndroid) {
        DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        String manufacturer = androidInfo.manufacturer;
        String model = androidInfo.model;
        String androidId = androidInfo.androidId;
        print("\n");
        print('Device Name: ${androidInfo.manufacturer} ${androidInfo.model}');
        print('Device Id: ${androidInfo.androidId}');
        print("\n");
        await registerToken(fcmToken, manufacturer, model, androidId);
      }

      print('Token: $fcmToken');

      FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
      FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        print('Title ${message.notification?.title}');
        print('Body ${message.notification?.body}');
        print('Payload ${message.data}');

        if (message.notification != null) {
          print(
              'Message also contained a notification: ${message.notification}');
        }
      });
    }
  }
}
