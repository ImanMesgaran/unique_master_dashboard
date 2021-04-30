class HTTPStatusCodeEnum {
  int _value;

  HTTPStatusCodeEnum._internal(this._value);

  HTTPStatusCodeEnum(int value) {
    this._value = value;
  }

  toString() => 'HTTPStatusCodeEnum.$_value';

  /// 1×× Informational
  static final continueStatus = HTTPStatusCodeEnum._internal(100);
  static final switchingProtocols = HTTPStatusCodeEnum._internal(101);
  static final processing = HTTPStatusCodeEnum._internal(102);

  /// 2×× Success
  static final ok = HTTPStatusCodeEnum._internal(200);
  static final created = HTTPStatusCodeEnum._internal(201);
  static final accepted = HTTPStatusCodeEnum._internal(202);
  static final nonAuthoritativeInformation = HTTPStatusCodeEnum._internal(203);
  static final noContent = HTTPStatusCodeEnum._internal(204);
  static final resetContent = HTTPStatusCodeEnum._internal(205);
  static final partialContent = HTTPStatusCodeEnum._internal(206);
  static final multiStatus = HTTPStatusCodeEnum._internal(207);
  static final alreadyReported = HTTPStatusCodeEnum._internal(208);
  static final imUsed = HTTPStatusCodeEnum._internal(226);

  /// 3×× Redirection
  static final multipleChoices = HTTPStatusCodeEnum._internal(300);
  static final movedPermanently = HTTPStatusCodeEnum._internal(301);
  static final found = HTTPStatusCodeEnum._internal(302);
  static final seeOther = HTTPStatusCodeEnum._internal(303);
  static final notModified = HTTPStatusCodeEnum._internal(304);
  static final useProxy = HTTPStatusCodeEnum._internal(305);
  static final temporaryRedirect = HTTPStatusCodeEnum._internal(307);
  static final permanentRedirect = HTTPStatusCodeEnum._internal(308);

  /// 4×× Client Error
  static final badRequest = HTTPStatusCodeEnum._internal(400);
  static final unauthorized = HTTPStatusCodeEnum._internal(401);
  static final paymentRequired = HTTPStatusCodeEnum._internal(402);
  static final forbidden = HTTPStatusCodeEnum._internal(403);
  static final notFound = HTTPStatusCodeEnum._internal(404);
  static final methodNotAllowed = HTTPStatusCodeEnum._internal(405);
  static final notAcceptable = HTTPStatusCodeEnum._internal(406);
  static final proxyAuthenticationRequired = HTTPStatusCodeEnum._internal(407);
  static final requestTimeout = HTTPStatusCodeEnum._internal(408);
  static final conflict = HTTPStatusCodeEnum._internal(409);
  static final gone = HTTPStatusCodeEnum._internal(410);
  static final lengthRequired = HTTPStatusCodeEnum._internal(411);
  static final preconditionFailed = HTTPStatusCodeEnum._internal(412);
  static final payloadTooLarge = HTTPStatusCodeEnum._internal(413);
  static final requestUriTooLong = HTTPStatusCodeEnum._internal(414);
  static final unsupportedMediaType = HTTPStatusCodeEnum._internal(415);
  static final requestedRangeNotSatisfiable = HTTPStatusCodeEnum._internal(416);
  static final expectationFailed = HTTPStatusCodeEnum._internal(417);
  static final imaTeapot = HTTPStatusCodeEnum._internal(418);
  static final misdirectedRequest = HTTPStatusCodeEnum._internal(421);
  static final unprocessableEntity = HTTPStatusCodeEnum._internal(422);
  static final locked = HTTPStatusCodeEnum._internal(423);
  static final failedDependency = HTTPStatusCodeEnum._internal(424);
  static final upgradeRequired = HTTPStatusCodeEnum._internal(426);
  static final preconditionRequired = HTTPStatusCodeEnum._internal(428);
  static final tooManyRequests = HTTPStatusCodeEnum._internal(429);
  static final requestHeaderFieldsTooLarge = HTTPStatusCodeEnum._internal(431);
  static final connectionClosedWithoutResponse =
      HTTPStatusCodeEnum._internal(444);
  static final unavailableForLegalReasons = HTTPStatusCodeEnum._internal(451);
  static final clientClosedRequest = HTTPStatusCodeEnum._internal(499);

  /// 5×× Server Error
  static final internalServerError = HTTPStatusCodeEnum._internal(500);
  static final notImplemented = HTTPStatusCodeEnum._internal(501);
  static final badGateway = HTTPStatusCodeEnum._internal(502);
  static final serviceUnavailable = HTTPStatusCodeEnum._internal(503);
  static final gatewayTimeout = HTTPStatusCodeEnum._internal(504);
  static final httpVersionNotSupported = HTTPStatusCodeEnum._internal(505);
  static final variantAlsoNegotiates = HTTPStatusCodeEnum._internal(506);
  static final insufficientStorage = HTTPStatusCodeEnum._internal(507);
  static final loopDetected = HTTPStatusCodeEnum._internal(508);
  static final notExtended = HTTPStatusCodeEnum._internal(510);
  static final networkAuthenticationRequired =
      HTTPStatusCodeEnum._internal(511);
  static final networkConnectTimeoutError = HTTPStatusCodeEnum._internal(599);

  /// MANUAL
  static final networkUnreachable = HTTPStatusCodeEnum._internal(700);

  /// is informational result
  bool isInformational() {
    return this._value >= 100 && this._value < 200;
  }

  /// is success result
  bool isSuccess() {
    return this._value >= 200 && this._value < 300;
  }

  /// is Redirection result
  bool isRedirection() {
    return this._value >= 300 && this._value < 400;
  }

  /// is client error result
  bool isClientError() {
    return this._value >= 400 && this._value < 500;
  }

  /// is Server Error result
  bool isServerError() {
    return this._value >= 500 && this._value < 600;
  }

  /// is Network Unreachable result
  bool isNetworkUnreachable() {
    return this._value == HTTPStatusCodeEnum.networkUnreachable._value;
  }

  @override
  bool operator ==(dynamic other) {
    if (runtimeType != other.runtimeType) return false;
    return other.toString() == this.toString();
  }
}
