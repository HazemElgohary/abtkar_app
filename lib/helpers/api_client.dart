import 'package:dio/dio.dart';
import 'package:laravel_exception/laravel_exception.dart';
import 'package:queen/queen.dart';

import 'end_points.dart';

// ignore: non_constant_identifier_names
final Api = ApiClient();

class ApiClient {
  Dio get dio {
    final _dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        validateStatus: (_) => true,
        followRedirects: false,
        contentType: 'application/json',
        headers: {'accept': 'application/json'},
        listFormat: ListFormat.csv,
      ),
    );
    return _dio;
  }

  Response _validate(Response res) {
    if (res.statusCode == 500) {
      throw LServerException(
        response: res.data,
        exception: res.data['exception'],
        file: '',
        line: null,
      );
    } else if (res.statusCode == 404) {
      throw LNotFoundException.parse(res.data!);
    } else if (res.statusCode == 422) {
      throw LValidationException(res.data!);
    } else if (res.data == null) {
      throw 'api returned null response';
    }
    return res;
  }

  /// sends a [GET] request to the given [url]
  Future<Response> get(
    String url, {
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    bool attachToken = true,
  }) async {
    final res = await dio.get(
      url,
      queryParameters: {'api_key': EndPoints.apiKey, ...query},
      options: Options(
        headers: {
          // if (attachToken)
          //   HttpHeaders.authorizationHeader:
          //       'Bearer ' + Prefs.getString("accessToken"),
          'accept-lang': Lang.current.languageCode,
          ...headers,
        },
      ),
    );
    return _validate(res);
  }

  Future<Response> post(
    String path, {
    Object body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
    String? contentType,
    bool attachToken = true,
  }) async {
    final res = await dio.post(
      path,
      data: body,
      queryParameters: {'api_key': EndPoints.apiKey, ...query},
      options: Options(
        headers: {
          // if (attachToken)
          //   HttpHeaders.authorizationHeader:
          //       'Bearer ' + Prefs.getString("accessToken"),
          'accept-lang': Lang.current.languageCode,
          ...headers,
        },
        contentType: contentType,
      ),
    );
    return _validate(res);
  }

  Future<Response> put(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    final res = await dio.put(
      path,
      data: body,
      queryParameters: {'api_key': EndPoints.apiKey, ...query},
      options: Options(
        headers: {
          // HttpHeaders.authorizationHeader: Auth.bearerToken,
          'accept-lang': Lang.current.languageCode,
          ...headers,
        },
      ),
    );
    return _validate(res);
  }

  Future<Response> delete(
    String path, {
    dynamic body = const {},
    Map<String, dynamic> headers = const {},
    Map<String, dynamic> query = const {},
  }) async {
    final res = await dio.delete(
      path,
      data: body,
      queryParameters: {'api_key': EndPoints.apiKey, ...query},
      options: Options(
        headers: {
          // HttpHeaders.authorizationHeader: Auth.bearerToken,
          'accept-lang': Lang.current.languageCode,
          ...headers,
        },
      ),
    );
    return _validate(res);
  }
}
