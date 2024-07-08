import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:socket_io_client/socket_io_client.dart';

var clientSeq = 0;
int getClientSeq() {
  clientSeq++;
  return clientSeq;
}

class SocketClient with WidgetsBindingObserver {
  late Socket ioSocket;

  static const ipAddress = 'https://ysvnfos.altisss.vn';

  SocketClient(String path) {
    WidgetsBinding.instance.addObserver(this);

    ioSocket = io(
      ipAddress,
      OptionBuilder()
          .setPath(path)
          .enableForceNew() // bắt buộc khởi tạo mới nếu path thay đổi
          .disableReconnection()
          .setTransports(['websocket', 'polling']).build(),
    );

    ioSocket.onConnect((data) {
      print('onConnect ${_toString()}');
      onReconnectSuccess();
    });

    ioSocket.onConnectError((data) {
      print('onConnectError $data');
      Future.delayed(const Duration(milliseconds: 500), reConnnect);
    });
    ioSocket.onReconnectAttempt((data) {});
    ioSocket.onDisconnect((data) {
      print('onDisconnect $data');
      Future.delayed(const Duration(milliseconds: 500), reConnnect);
    });
  }

  disconnect() {
    clientSeq = 0;
    ioSocket.disconnect();
  }

  reConnnect() {
    ioSocket.disconnect();
    ioSocket.connect();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      log('${_toString()} - has disconnected : ${ioSocket.disconnected}');
      log('${_toString()} - ioSocket has connected : ${ioSocket.connected}');
      if (ioSocket.disconnected) {
        reConnnect();
      }
    }
  }

  onReconnectSuccess() {}

  String _toString() {
    final options = ioSocket.io.options;
    return 'hostname: ${options?['hostname']}, path: ${options?['path']}';
  }

  String toStringJson() {
    final options = ioSocket.io.options;
    return 'hostname: ${options?['hostname']}, path: ${options?['path']}';
  }
}
