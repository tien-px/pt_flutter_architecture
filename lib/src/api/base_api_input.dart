enum HttpMethod {
  get,
  post,
  put,
  delete,
}

class BaseAPIInput {
  Map<String, dynamic>? headers;
  String urlString;
  HttpMethod httpMethod;
  Map<String, dynamic>? params;
  dynamic bodyParams;
  bool? requireAccessToken;

  // ignore: avoid_positional_boolean_parameters
  BaseAPIInput(
      {this.headers,
      required this.urlString,
      required this.httpMethod,
      this.params,
      this.bodyParams,
      this.requireAccessToken});
}
