import 'dart:convert';

/// type : "https://tools.ietf.org/html/rfc7231#section-6.5.1"
/// title : "Bad Request"
/// status : 400
/// traceId : "00-4b61812d5c9c9849a5cd22f0302989fb-532a7177ff828d4e-00"

ErrorBadRequestResposneModel errorBadRequestResposneModelFromJson(String str) =>
    ErrorBadRequestResposneModel.fromJson(json.decode(str));
String errorBadRequestResposneModelToJson(ErrorBadRequestResposneModel data) =>
    json.encode(data.toJson());

class ErrorBadRequestResposneModel {
  ErrorBadRequestResposneModel({
    this.type,
    this.title,
    this.status,
    this.traceId,
  });

  ErrorBadRequestResposneModel.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'];
    status = json['status'];
    traceId = json['traceId'];
    if ((type == null || type!.isEmpty) &&
        (title == null || title!.isEmpty) &&
        (status == null) &&
        (traceId == null || traceId!.isEmpty)) {
      throw Exception();
    }
  }
  String? type;
  String? title;
  int? status;
  String? traceId;
  ErrorBadRequestResposneModel copyWith({
    String? type,
    String? title,
    int? status,
    String? traceId,
  }) =>
      ErrorBadRequestResposneModel(
        type: type ?? this.type,
        title: title ?? this.title,
        status: status ?? this.status,
        traceId: traceId ?? this.traceId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['title'] = title;
    map['status'] = status;
    map['traceId'] = traceId;
    return map;
  }
}
