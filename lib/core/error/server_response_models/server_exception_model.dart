import 'dart:convert';

class ServerExceptionModel {
  ServerExceptionModel({
    this.data,
    this.message,
    this.code,
  });

  final Data data;
  final String message;
  final int code;

  ServerExceptionModel copyWith({
    Data data,
    String message,
    int code,
  }) =>
      ServerExceptionModel(
        data: data ?? this.data,
        message: message ?? this.message,
        code: code ?? this.code,
      );

  factory ServerExceptionModel.fromRawJson(String str) =>
      ServerExceptionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ServerExceptionModel.fromJson(Map<String, dynamic> json) =>
      ServerExceptionModel(
      //  data: json["data"] == null ? null : Data.fromMap(json["data"]),
        message: json["message"] == null ? null : json["message"],
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toMap(),
        "message": message == null ? null : message,
        "code": code == null ? null : code,
      };
}

class Data {
  Data({
    this.code,
  });

  final String code;

  Data copyWith({
    String code,
  }) =>
      Data(
        code: code ?? this.code,
      );

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        code: json["code"] == null ? null : json["code"],
      );

  Map<String, dynamic> toMap() => {
        "code": code == null ? null : code,
      };
}
