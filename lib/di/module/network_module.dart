import 'dart:convert';
import 'dart:io';

import 'package:app_briidea/data/sharedpref/shared_preference_helper.dart';
import 'package:dio/adapter.dart';
import 'package:app_briidea/data/network/constants/endpoints.dart';
import 'package:dio/dio.dart';

abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  static Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final dio = Dio();
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout = Endpoints.connectionTimeout
      ..options.receiveTimeout = Endpoints.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
      ))
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions options,
              RequestInterceptorHandler handler) async {
            // getting token
            var token = await sharedPrefHelper.userToken;
            if(token!.isEmpty) {
               token = await sharedPrefHelper.authToken;
            }
            var refreshtoken = await sharedPrefHelper.refreshToken;
            print('!!!!####refreshtoken: $refreshtoken');
            if (token != null) {
              print(token);
              options.headers.putIfAbsent('Authorization', () => token);
            } else {
              print('Auth token is null');
            }

            return handler.next(options);
          },
          onError: (e, handler) async {
            return handler.next(e);
            /*if (e.response!.data
                .toString()
                .contains('SecurityTokenExpiredException')) {
              try {*/
                /*var refreshToken = await sharedPrefHelper.refreshToken;
                var response = await dio.post(
                  "https://www.yunipe.com/api/account/RefreshTokenMobile?refreshToken=$refreshToken",
                );
                if (response.statusCode == 200) {
                  //get new tokens ...
                  print("RefreshTokenMobile" + response.statusCode.toString());
                  var register = Register.fromJson(response.data);
                  await sharedPrefHelper.saveAuthToken(register.data!.token!);
                  await sharedPrefHelper
                      .saveRefreshToken(register.data!.refreshToken!);
                  //set bearer
                  e.requestOptions.headers["Authorization"] =
                        "bearer " + register.data!.token!;
                  //create request with new access token
                  final opts = new Options(
                      method: e.requestOptions.method,
                      headers: e.requestOptions.headers);
                  final cloneReq = await dio.request(e.requestOptions.path,
                      options: opts,
                      data: e.requestOptions.data,
                      queryParameters: e.requestOptions.queryParameters);

                  return handler.resolve(cloneReq);
                }
                return e.requestOptions.data;*/
             /* } catch (e, st) {}
            }*/
          },
        ),
      );

    return dio;
  }
}
