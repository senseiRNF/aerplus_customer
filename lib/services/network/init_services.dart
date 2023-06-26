import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class InitServices {
  static Future<Dio> init() async {
    Dio result = Dio();

    result.options = BaseOptions(
      baseUrl: 'https://aerplus.xcted.com',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(minutes: 1),
      headers: {
        'Accept': 'application/json',
      },
    );

    IOHttpClientAdapter clientAdapter = IOHttpClientAdapter(
      createHttpClient: () {
        HttpClient client = HttpClient();

        client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;

        return client;
      },
    );

    result.httpClientAdapter = clientAdapter;

    return result;
  }
}