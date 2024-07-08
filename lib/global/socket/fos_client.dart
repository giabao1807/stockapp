import 'dart:async';

import 'base_socket_client.dart';

class FosClient extends BaseSocketClient {
  static FosClient? _instance;

  factory FosClient() => _instance ??= FosClient._();

  final streamController = StreamController<dynamic>.broadcast();

  Map<String, List<String>> requestedSubscribes = {};

  final Map<String, List<String>> subscribing = {};

  final streamSystemMessage =
      StreamController<Map<String, dynamic>>.broadcast();

  FosClient._() : super('/services') {
    //-- Nhận thông báo hệ thống
    ioSocket.on('SYS_MSG', (data) {
      disconnect();
      streamSystemMessage.sink.add(Map<String, dynamic>.from(data));
    });

    //-- Nhận phản hồi của server cho một request thông thường
    ioSocket.on(
      'RES_MSG',
      (data) {
        handleResponse(data, showLog: true);
      },
    );

    //-- Nhận dữ liệu notify
    ioSocket.on('NTF_MSG', (data) {
      streamController.sink.add({'NTF_MSG': data});
    });
  }
}
