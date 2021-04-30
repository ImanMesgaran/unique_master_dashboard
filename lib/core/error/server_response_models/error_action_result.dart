import 'package:meta/meta.dart';

class ErrorActionResult {
  final String nonFieldError;
  final Map<String, String> fieldErrors;
  final String detail;

  ErrorActionResult({
    @required this.nonFieldError,
    @required this.fieldErrors,
    @required this.detail,
  });
}
