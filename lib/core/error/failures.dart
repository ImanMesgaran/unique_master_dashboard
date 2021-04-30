import 'package:equatable/equatable.dart';

import 'exceptions.dart';

abstract class Failure extends Equatable {
  // TODO: we should add parameters like error-code & message to identify the errors and also to compare different failures(exceptions)
  Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure {
  final ServerException serverException;

  ServerFailure({this.serverException});

  @override
  List<Object> get props => [serverException];
}

class CacheFailure extends Failure {
  final String message;

  CacheFailure({this.message});

  @override
  List<Object> get props => [message];
}

class InternetFailure extends ServerFailure {
  InternetFailure();

  @override
  List<Object> get props => [];
}
