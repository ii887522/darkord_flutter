import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

final Dio dio = Dio(
  BaseOptions(
    baseUrl: const String.fromEnvironment('REST_API_BASE_URL'),
    headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'connection': 'keep-alive',
    },
  ),
)
  ..httpClientAdapter = Http2Adapter(ConnectionManager())
  ..interceptors.add(
    RetryInterceptor(
      dio: dio,
      retryEvaluator: DefaultRetryEvaluator({
        status408RequestTimeout,
        status429TooManyRequests,
        status502BadGateway,
        status503ServiceUnavailable,
        status504GatewayTimeout,
        status440LoginTimeout,
        status460ClientClosedRequest,
        status499ClientClosedRequest,
        status520WebServerReturnedUnknownError,
        status521WebServerIsDown,
        status522ConnectionTimedOut,
        status523OriginIsUnreachable,
        status524TimeoutOccurred,
        status525SSLHandshakeFailed,
        status527RailgunError,
        status598NetworkReadTimeoutError,
        status599NetworkConnectTimeoutError,
      }).evaluate,
    ),
  );
