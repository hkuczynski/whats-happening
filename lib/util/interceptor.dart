import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class ApiKeyInterceptor extends Interceptor {
  ApiKeyInterceptor({@required String apiKey})
      : assert(apiKey != null),
        _apiKey = apiKey;

  final String _apiKey;

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    return options..queryParameters.addAll({"apiKey": _apiKey});
  }
}
