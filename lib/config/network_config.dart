import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpodstream/config/env.dart';

part 'network_config.g.dart';

@riverpod
Dio dio(DioRef ref) {
  var appUrl = '${Env.baseUrl}/api/v1';

  var dio = Dio(
    BaseOptions(
      baseUrl: appUrl,
      headers: {
        "Accept": "application/json",
      },
    ),
  );

  return dio;
}
