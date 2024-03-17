import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';

import '../consts/index.dart';
import '../consts/user.dart';

final _retryInterceptor = RetryInterceptor(
  dio: httpApi,
  retryEvaluator: DefaultRetryEvaluator(
    {
      status408RequestTimeout,
      status429TooManyRequests,
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
    },
  ).evaluate,
);

final Dio httpApi = Dio(
  BaseOptions(baseUrl: httpApiBaseUrl, contentType: 'application/json'),
)
  ..httpClientAdapter = Http2Adapter(ConnectionManager())
  ..interceptors.add(_retryInterceptor);

final Dio cognitoApi = Dio(
  BaseOptions(baseUrl: cognitoApiBaseUrl, contentType: 'application/json'),
)
  ..httpClientAdapter = Http2Adapter(ConnectionManager())
  ..interceptors.add(_retryInterceptor);
