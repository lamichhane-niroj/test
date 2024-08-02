import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Dio Cookie Example')),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              print("Hello 5");
              await fetchWithCookies();
            },
            child: Text('Fetch Data'),
          ),
        ),
      ),
    );
  }

  Future<void> fetchWithCookies() async {
    print("Hello 4");

    // Create a Dio instance
    final dio = Dio();

    print("Hello 3");

    // Ensure the app's document directory is accessible
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;

    // Use PersistCookieJar for persistent cookie storage
    final cookieJar = PersistCookieJar(storage: FileStorage(appDocPath));

    print("Hello 2");

    // Add CookieManager to Dio
    dio.interceptors.add(CookieManager(cookieJar));

    print("Hello 1");

    try {
      print("Hello ");
      // First request to get and store cookies
      final initialResponse = await dio.post(
        'https://api.edtraa.com/api/users/login/email/normal',
        data: {
          "username": "cafedemad05@gmail.com",
          "password": "Moir@i@12345",
        },
      );
      print('Initial Response:');
      print('Status Code: ${initialResponse.statusCode}');
      print('Headers: ${initialResponse.headers}');
      print('Body: ${initialResponse.data}');

      // Get stored cookies
      final cookies = cookieJar.loadForRequest(Uri.parse('https://api.edtraa.com'));
      print('Stored Cookies: $cookies');

      // Make a subsequent request with cookies automatically managed
      final subsequentResponse = await dio.get('https://api.edtraa.com/api/users/token/refresh');
      print('Subsequent Response:');
      print('Status Code: ${subsequentResponse.statusCode}');
      print('Headers: ${subsequentResponse.headers}');
      print('Body: ${subsequentResponse.data}');
    } catch (error, stackTrace) {
      print('Error: $error');
      print('StackTrace: $stackTrace');
    }
  }
}