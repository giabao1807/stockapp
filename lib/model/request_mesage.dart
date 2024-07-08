import 'dart:async';

import 'package:mtsv4/model/input_service_body.dart';
import 'package:mtsv4/model/request_response.dart';

class RequestedMessage {
  final Completer<RequestResponse> completer;
  Map? response;
  InputServiceBody request;

  RequestedMessage({
    required this.completer,
    this.response,
    required this.request,
  });
}
