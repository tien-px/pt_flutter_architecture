import 'dart:developer' as developer;

import 'package:dio/dio.dart';
import 'package:pt_flutter_object_mapper/pt_flutter_object_mapper.dart';
import 'package:rxdart/rxdart.dart';

import 'base_api_input.dart';
import 'base_api_output.dart';

class BaseAPIService {
  /// Create variables
  late final Dio dio;

  bool debug = false;
  int maxDebugStringLength = 500;

  BaseAPIService([BaseOptions? options]) {
    dio = new Dio(options);
  }

  BaseAPIInput preprocess(BaseAPIInput input) {
    return input;
  }

  bool precheck(BaseAPIInput input) {
    return true;
  }

  void handleResponseError(DioError error) {}

  void log(Object? object) {
    developer.log(object.toString(), name: "API DEBUG");
  }

  Stream<T> request<T extends BaseAPIOutput>(BaseAPIInput input) {
    return Stream.value(precheck(input)).where((isPass) => isPass).switchMap((_) => Stream.fromFuture(_request(input)));
  }

  Future<T> requestFuture<T extends BaseAPIOutput>(BaseAPIInput input) {
    if (precheck(input)) {
      return _request(input);
    }
    return Future<T>.error("Pre-check failed");
  }

  Future<T> _request<T extends BaseAPIOutput>(BaseAPIInput input) async {
    final Response dioResponse;
    var _input = preprocess(input);
    log("🌍 [${_input.httpMethod.toString().replaceAll("HttpMethod.", "").toUpperCase()}] ${_input.urlString}");
    if (debug) {
      if (_input.params?.isNotEmpty ?? false) {
        log("🌍 [PARAMS] ${_input.params}");
      }
      if (_input.bodyParams?.isNotEmpty ?? false) {
        log("🌍 [BODY PARAMS] ${_input.bodyParams}");
      }
    }
    try {
      switch (_input.httpMethod) {
        case HttpMethod.get:
          dioResponse = await dio.get(
            _input.urlString,
            queryParameters: _input.params,
            options: Options(
              headers: _input.headers,
            ),
          );
          break;
        case HttpMethod.post:
          dioResponse = await dio.post(
            _input.urlString,
            queryParameters: _input.params,
            data: _input.bodyParams,
            options: Options(
              headers: _input.headers,
            ),
          );
          break;
        case HttpMethod.put:
          dioResponse = await dio.put(
            _input.urlString,
            queryParameters: _input.params,
            data: _input.bodyParams,
            options: Options(
              headers: _input.headers,
            ),
          );
          break;
        case HttpMethod.delete:
          dioResponse = await dio.delete(
            _input.urlString,
            queryParameters: _input.params,
            data: _input.bodyParams,
            options: Options(
              headers: _input.headers,
            ),
          );
          break;
      }
      log("👍 [${dioResponse.statusCode}] ${_input.urlString}");
      if (debug) {
        final dataString = dioResponse.data.toString();
        if (dataString.length >= maxDebugStringLength) {
          log("👍 [Response] ${dioResponse.data.toString().substring(0, maxDebugStringLength)}...[Max Length: $maxDebugStringLength]");
        } else {
          log("👍 [Response] ${dioResponse.data.toString()}");
        }
      }
      return Future<T>.value(Mapper.fromJson(dioResponse.data).toObject<T>());
    } on DioError catch (error) {
      log("❌ [${error.message}] ${_input.urlString}");
      if (debug) {
        log("❌ [Response] ${error.response}");
      }
      handleResponseError(error);
      return Future<T>.error(error);
    } on Exception catch (error) {
      log("❌ [$error] ${_input.urlString}");
      if (debug) {
        log("❌ [Response] $error");
      }
      handleResponseError(DioError(error: -1, requestOptions: RequestOptions(path: _input.urlString)));
      return Future<T>.error(error);
    }
  }
}
