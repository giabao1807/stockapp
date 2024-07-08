import 'dart:async';


class SubscribedMessage {
  final Completer<bool> completer;
  Map? response;
  Map<String, dynamic> request;

  SubscribedMessage({
    required this.completer,
    this.response,
    required this.request,
  });
}
