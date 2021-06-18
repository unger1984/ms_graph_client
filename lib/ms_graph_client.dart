library ms_graph_client;

import 'dart:typed_data';

import 'package:dio/dio.dart';

T _sendData<T>(response) => response.data as T;

class MSGraphClient {
  final String? token;
  final _dio = Dio();

  MSGraphClient(this.token) {
    _dio.options.baseUrl = 'https://graph.microsoft.com/v1.0/';
    _dio.options.headers = {'Content-Type': 'application/json; charset=UTF-8'};
    _dio.options.headers['Authorization'] = token;
  }

  Future<R> get<R>(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.get<R>(path, queryParameters: queryParameters).then(_sendData);
  }

  Future<Uint8List> download(String path,
      {Map<String, dynamic>? queryParameters}) {
    return _dio
        .get<Uint8List>(
          path,
          queryParameters: queryParameters,
          options: Options(responseType: ResponseType.bytes),
        )
        .then(_sendData);
  }

  Future<R> post<R>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _dio
        .post<R>(path, data: data, queryParameters: queryParameters)
        .then(_sendData);
  }

  Future<R> put<R>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _dio
        .put<R>(path, data: data, queryParameters: queryParameters)
        .then(_sendData);
  }

  Future<R> delete<R>(String path,
      {dynamic data, Map<String, dynamic>? queryParameters}) {
    return _dio
        .delete<R>(path, data: data, queryParameters: queryParameters)
        .then(_sendData);
  }
}
