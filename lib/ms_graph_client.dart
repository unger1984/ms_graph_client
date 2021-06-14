library ms_graph_client;

import 'dart:typed_data';

import 'package:dio/dio.dart';

T _sendData<T>(response) => response.data;

class MSGraphClient {
  final String? token;
  final _dio = Dio();

  MSGraphClient(this.token) {
    _dio.options.baseUrl = 'https://graph.microsoft.com/v1.0/';
    _dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    _dio.options.headers['Authorization'] = token;
  }

  get(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters).then(_sendData);
  }

  Future<Uint8List> download(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio
        .get<Uint8List>(path,
            queryParameters: queryParameters,
            options: Options(responseType: ResponseType.bytes))
        .then(_sendData);
  }

  post(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _dio
        .post(path, data: data, queryParameters: queryParameters)
        .then(_sendData);
  }

  put(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _dio
        .put(path, data: data, queryParameters: queryParameters)
        .then(_sendData);
  }

  delete(String path, {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _dio
        .delete(path, data: data, queryParameters: queryParameters)
        .then(_sendData);
  }
}
