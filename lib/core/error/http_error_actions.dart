import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../util/http_status_code_enum.dart';
import 'exceptions.dart';
import 'server_response_models/error_action_result.dart';
import 'server_response_models/function_errors_enum.dart';

/// create an extension method to run on catch exception
extension OnDioError on DioError {
  void action(DioError e) {}
}

class OnDioErrorActions {
  OnDioErrorActions({
    @required DioError exception,
    @required StackTrace stackTrace,
    @required FunctionsErrorType functionErrorType,
  }) {
    HttpErrorActions(
      exception: exception,
      stackTrace: stackTrace,
      errorType: functionErrorType,
    );
  }
}

// ! create base class for exceptions result, like models, etc.
// TODO: do something when an error accures, like showing snack bar or setting field and non-field errors, using erro action methods set in the swith/case
class HttpErrorActions {
  HttpErrorActions({
    @required DioError exception,
    @required StackTrace stackTrace,
    @required FunctionsErrorType errorType,
  }) {
    final _statusCode = exception?.response?.statusCode;
    print(exception);

    // decide on Client errors
    if (HTTPStatusCodeEnum(_statusCode).isClientError()
        //|| HTTPStatusCodeEnum(_statusCode).isRedirection()
        ) {
      final _message = 'Client Error: ${HTTPStatusCodeEnum(_statusCode)}';
      //final _message = exception?.response?.data;
      print(_message);

      ErrorActionResult _functionResult;
      // execute function on error
      switch (errorType) {
        case FunctionsErrorType.loginRequest:
          break;
        case FunctionsErrorType.recoverPassword:
          break;
        case FunctionsErrorType.registerUser:
          break;

        default:
      }

      throw ServerException(
        exception: exception,
        fieldErrors: _functionResult?.fieldErrors,
        nonFieldError: _functionResult?.nonFieldError,
        message: _message,
        detail: _functionResult?.detail,
        uiVisible: true,
      );
    }
    // decide on Server errors
    else if (HTTPStatusCodeEnum(_statusCode).isServerError()) {
      // TODO: must be logged, must be synced to the server
      // ! must show relevant error about server ('try again later')
      // send exception to the server in case of 500 - 600
      // Catcher.reportCheckedError(error, stackTrace);

      final _message = 'Server Error: ${HTTPStatusCodeEnum(_statusCode)}';
      print(_message);

      throw ServerException(
        message: _message,
        exception: exception,
        fieldErrors: null,
        nonFieldError: exception.response.data,
        uiVisible: false,
      );
    }
    // decide on Network unreachable errors
    else if (HTTPStatusCodeEnum(_statusCode).isNetworkUnreachable()) {
      // TODO: change theme
      final _message =
          'Network Unreachable Error: ${HTTPStatusCodeEnum(_statusCode)}';
      print(_message);

      // execute function on error
      //if (function != null) function();

      throw ServerException(
        message: _message,
        exception: exception,
        fieldErrors: null,
        nonFieldError: null,
        uiVisible: true,
      );
    }
  }
}
