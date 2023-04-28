import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pretty_logger.g.dart';

@riverpod
PrettyDioLogger prettyDioLogger(PrettyDioLoggerRef ref) {
  return PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: false,
    maxWidth: 90,
  );
}
