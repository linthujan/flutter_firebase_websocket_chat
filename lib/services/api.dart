import 'dart:convert';
import 'package:flutter_firebase_websocket_chat/intercepters/InterceptedClient.dart';
import 'package:flutter_firebase_websocket_chat/models/HttpModel.dart';
import 'package:http/http.dart' as http;

const String baseurl = "https://tough-terminally-koala.ngrok-free.app/api";

Future<HttpResponseModel?> signUp(String mobile, String username) async {
  final response = await http.post(Uri.parse('$baseurl/user'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'mobile': mobile,
        'username': username,
      }));

  final data = HttpResponseModel.fromJSON(jsonDecode(response.body));
  if (data.status) {
    return data;
  } else if (data.error?['isAppError'] == true) {
    throw Exception(data.meta.message);
  } else {
    throw Exception("SignUp failed");
  }
}

Future<HttpResponseModel?> login(String mobile) async {
  final response = await http.post(Uri.parse('$baseurl/auth/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'mobile': mobile,
      }));

  final data = HttpResponseModel.fromJSON(jsonDecode(response.body));
  if (data.status) {
    return data;
  } else if (data.error?['isAppError'] == true) {
    throw Exception(data.meta.message);
  } else {
    throw Exception("Login failed");
  }
}

Future<HttpResponseModel?> getChats() async {
  final response = await client.get(
    Uri.parse('$baseurl/chat'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    },
  );

  final data = HttpResponseModel.fromJSON(jsonDecode(response.body));
  if (data.status) {
    return data;
  } else if (data.error?['isAppError'] == true) {
    throw Exception(data.meta.message);
  } else {
    throw Exception("Get chats failed");
  }
}

Future<http.Response> registerToken(
    String fcmToken, String manufacturer, String model, String androidId) {
  return client.post(Uri.parse('$baseurl/firebase/messaging/register'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(<String, String>{
        'name': manufacturer + model,
        'device_id': androidId,
        'fcm_token': fcmToken,
        'device_unique_id': androidId,
        'device_unique_id_type': 'androidId',
        'platform': 'ANDROID',
        'app_version': '1.0'
      }));
}
