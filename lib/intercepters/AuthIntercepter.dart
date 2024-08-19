import 'dart:async';
import 'package:flutter_firebase_websocket_chat/helper/common.dart';
import 'package:http_interceptor/http_interceptor.dart';

class AuthIntercepter implements InterceptorContract {
  @override
  Future<BaseRequest> interceptRequest({required BaseRequest request}) async {
    String? token = await getToken();

    if (token != null) {
      request.headers['Authorization'] = "Bearer $token";
    }
    return request;
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) {
    return response;
  }

  @override
  FutureOr<bool> shouldInterceptRequest() {
    return true;
  }

  @override
  FutureOr<bool> shouldInterceptResponse() {
    return false;
  }
}
