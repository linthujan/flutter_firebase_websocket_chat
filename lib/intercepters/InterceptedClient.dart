import 'package:flutter_firebase_websocket_chat/intercepters/AuthIntercepter.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';

final http.Client client = InterceptedClient.build(interceptors: [
  AuthIntercepter(),
]);
