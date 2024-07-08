// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:mtsv4/utils/string_utils.dart';

const _jsonCodec = JsonCodec();

class RequestResponse {
  final dynamic response;
  final String code;
  Error? error;
  late final Map<String, dynamic> json;
  final bool shouldFilterBeforeParse;
  final bool shouldParseToHtml;

  RequestResponse({
    this.response,
    required this.code,
    this.shouldFilterBeforeParse = false,
    this.shouldParseToHtml = false,
  }) {
    try {
      json = response is String && response != ''
          ? _jsonCodec.decode((response as String).trim())
          : response == ''
              ? {}
              : response is Map
                  ? response
                  : {};
      error = json['Result'] == '1'
          ? null
          : Error(
              code: json['Result'],
              messages: json['Message'],
            );
    } catch (e) {
      error = Error(
        code: "353071860",
        messages: e.toString(),
      );
    }
  }

  bool get result {
    try {
      return json['Result'] == '1';
    } catch (e) {
      throw _buildJsonErrorMessage(e, 'result');
    }
  }

  String get messages => json['Message'] ?? '';

  bool get hasError => error != null;

  List get items {
    try {
      var value = json['Data'];
      if (value == null || value == '') return [];

      if (shouldFilterBeforeParse) {
        value = StringUtils.filterStrBfParse(value);
      }
      if (shouldParseToHtml) {
        value = StringUtils.paresStringToHtml(value);
      }
      final decodedValue = jsonDecode(value);
      return value == null || value == '' || (decodedValue is List == false)
          ? []
          : decodedValue;
    } catch (e) {
      throw _buildJsonErrorMessage(e, 'Data - items');
    }
  }

  Map<String, dynamic> get data {
    try {
      final value = json['Data'];
      if (value == null || value == '') return {};
      final decodedValue = jsonDecode(json['Data']);
      return value == null || value == '' || (decodedValue is Map == false)
          ? {}
          : decodedValue;
    } catch (e) {
      throw _buildJsonErrorMessage(e, 'Data - data');
    }
  }

  _buildJsonErrorMessage(Object e, String key) {
    if (error != null) return error!.messages;

    if (e.runtimeType.toString().contains('_TypeError')) {
      print('''
${e.toString()}
==> Response json did not contain key: $key
    reponse data: ${response.toString()}
''');
    }

    if (e is NoSuchMethodError) {
      print('''
NoSuchMethodError: The method '[]' was called on null
==> Response json did not contain key: $key
    reponse data: ${response.toString()}
''');

      return 'Rrror Happened Try Again';
    }

    return e.toString();
  }

  @override
  String toString() {
    return 'RequestResponse(response: $response, code: $code, error: $error, json: $json)';
  }
}

class Error {
  Error({
    required this.code,
    required this.messages,
  });

  String code;
  String messages;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        code: json["code"] ?? '0',
        messages: json["message"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "messages": messages,
      };
}
