import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> isConnected();
}

class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl({required this.connectivity});

  @override
  Future<bool> isConnected() async {
    List<ConnectivityResult> results = await connectivity.checkConnectivity();
    return results.contains(ConnectivityResult.wifi) ||
        results.contains(ConnectivityResult.mobile);
  }
}

class NetworkService {
  final Dio _dioInstance = Dio();
  final bool withLogger;
  String? token;

  Dio get dio => _dioInstance;

  BaseOptions get dioOptions => _dioInstance.options;

  Options createRequestOptions({String? token, String? dataType}) {
    return Options(
      headers: {
        "Content-Type": dataType ?? "application/json",
        "Accept": "*/*",
        "X-Accept-All-Languages": "True",
        if (token != null) "Authorization": "Bearer $token",
      },
    );
  }

  Future<void> getAccessToken() async {
    if (token == null) {
      final response = await dio.post(
        "https://login.microsoftonline.com/6960921c-9555-4fa0-ae99-2b5a385deedc/oauth2/v2.0/token",
        options: Options(
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}),
        data: {
          'grant_type': 'client_credentials',
          'client_id': 'cefdd43b-ca9d-4043-9285-9b9006c48f24',
          'client_secret': 'MVh8Q~MZWuW0IVTDJMq1yJP8npKZiQtraxvsNaEL',
          'scope': 'https://ititasks.crm11.dynamics.com/.default',
        },
      );

      if (response.statusCode == 200) {
        print("success______________");
        final data = jsonDecode(response.toString());
        token = data['access_token'];
        baseOptions.headers.addAll({'Authorization': 'Bearer $token'});
        _dioInstance.options = baseOptions;
      } else {
        print("fail______________");
        print('Error: ${response.statusMessage}');
      }
    }
  }

  BaseOptions baseOptions = BaseOptions(
    method: 'Get',
    receiveDataWhenStatusError: true,
    receiveTimeout: const Duration(seconds: 120),
    connectTimeout: const Duration(seconds: 30),
    sendTimeout: const Duration(seconds: 30),
    followRedirects: false,
    headers: {
      "Content-Type": "application/json",
      "Accept": "*/*",
      "X-Accept-All-Languages": "True",
    },
  );

  NetworkService({this.withLogger = true}) {
    // Default base options:
    _dioInstance.options = baseOptions;
    addInterceptors();
  }

  void addInterceptors() {
    _dioInstance.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException err, ErrorInterceptorHandler handler) async {
          return handler.next(err);
        },
      ),
    );

    if (withLogger) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          error: true,
          compact: true,
          maxWidth: 140,
        ),
      );
    }
  }
}
