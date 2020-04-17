import 'dart:io';

import 'package:dart_week_mobile/app/repositories/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CustomDio {
  var _dio;

  CustomDio() {
    _dio = Dio(_options);
  }

  CustomDio.withAuthentication() {
    _dio = Dio(_options);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }

  BaseOptions _options = BaseOptions(
    baseUrl: Platform.isIOS ? 'localhost:8888' : 'http://192.168.0.2:8888',
    connectTimeout: 30000,
    receiveTimeout: 30000,
  );

  Dio get instance => _dio;

  _onRequest(RequestOptions options) async {
    var token = await UserRepository().getToken();
    options.headers['Authorization'] = token;
  }

  _onResponse(Response e) {
    print('######### Response Log #########');
    print(e.data);
    print('######### Response Log #########');
  }

  _onError(DioError e) {
    if (e.response?.statusCode == 403 || e.response?.statusCode == 401) {
      UserRepository().signOut();
      Get.offAllNamed('/');
    }
    return e;
  }
}
