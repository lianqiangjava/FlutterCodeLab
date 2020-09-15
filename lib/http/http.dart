import 'package:dio/dio.dart';

///Dio单例
BaseOptions options = BaseOptions(
  baseUrl: "https://api.github.com/",
  connectTimeout: 5000,
  receiveTimeout: 3000,

);
var dio = Dio(options);

