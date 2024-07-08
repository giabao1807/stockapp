import 'dart:async';
import 'dart:convert';

import 'package:mtsv4/model/subscribed_mesage.dart';

import 'socket_client.dart';

/// [BaseStreamClient] được kế thừa từ [SocketClient]
/// Để đảm bảo performance và bộ nhớ
/// [BaseStreamClient] không được gọi trực tiếp ra mà phải gọi từ 1 class khác kế thừa [BaseStreamClient] và class này phải là Singleton
/// Với mỗi path khác nhau cần phải tạo 1 client mới
abstract class BaseStreamClient extends SocketClient {
  BaseStreamClient(this.path) : super(path);

  final String path;

  // Các topic đã request có response
  Set<String> subscribedTopics = <String>{};

  // Request subscribe chưa nhận được response
  // {clientSeq: [topics]}
  Map<String, List<String>> requestedSubscribes = <String, List<String>>{};

  Map<int, SubscribedMessage> subscribeMessages = {};

  final Map<String, List<String>> subscribing = {};

  final Map<int, String> requestedHistoryData = {};

  final streamController = StreamController<dynamic>.broadcast();

  Future<bool> subscribe(List<String> topics, List<String> values) {
    var seq = getClientSeq();
    var requestStream = {
      "ClientSeq": seq,
      "TransId": '123-abc',
      "topic": topics,
      "value": values,
    };

    final options = ioSocket.io.options;

    print(
        'SUB_REQ $requestStream ${'hostname: ${options?['hostname']}, path: ${options?['path']}'}');
    ioSocket.emit('SUB_REQ', requestStream);

    Completer<bool> c = Completer<bool>();

    c.future.timeout(const Duration(seconds: 10), onTimeout: () {
      subscribe(topics, values);
      return false;
    });

    final requestedValue = subscribeMessages[seq] ??= SubscribedMessage(
      completer: c,
      request: requestStream,
    );

    for (var item in topics) {
      List<String>? subscribingValue = subscribing[item];
      if (subscribingValue == null) {
        subscribing[item] = values.map((e) => e).toList();
      } else {
        subscribingValue.addAll(values.map((e) => e).toList());
        subscribingValue.toSet().toList();
        subscribing[item] = subscribingValue;
      }
    }

    requestedSubscribes[clientSeq.toString()] = <String>[];
    for (final topic in topics) {
      for (final value in values) {
        String fullTopic = topic + '|' + value;
        requestedSubscribes[clientSeq.toString()]?.add(fullTopic);
      }
    }

    return requestedValue.completer.future;
  }

  // void history(String topic, String value) {
  //   var requestStream = {
  //     "ClientSeq": getClientSeq(),
  //     "TransId": '123-abc',
  //     "topic": [topic],
  //     "value": [value],
  //     'fromseq': ['0'],
  //     'size': ['500'],
  //   };

  //   ioSocket.emit('HIST_REQ', requestStream);

  //   requestedHistoryData[requestStream["ClientSeq"] as int] = value;
  // }

  void unsubscribe(List<String> topics, List<String> values) {
    var requestUnsub = {
      "ClientSeq": getClientSeq(),
      "TransId": '123-abc',
      "topic": topics,
      "value": values,
    };
    ioSocket.emit('UNSUB_REQ', jsonEncode(requestUnsub));

    for (var item in topics) {
      final subscribingValue = subscribing[item];
      if (subscribingValue != null) {
        subscribingValue.removeWhere((e) => values.contains(e));
      }
    }

    for (final topic in topics) {
      for (final value in values) {
        String fullTopic = topic + '|' + value;

        if (subscribedTopics.contains(fullTopic)) {
          subscribedTopics.remove(fullTopic);
        }
      }
    }
  }

  // handleSubscribe(Map<String, dynamic> msg) {
  //   String clientSeq = msg['ClientSeq'].toString();
  //   String result = msg['Result'].toString();
  //   final subcribedValue = subscribeMessages[int.parse(clientSeq)];
  //   if (subcribedValue == null) {
  //     return;
  //   }
  //   subcribedValue.completer.complete(true);
  //   subscribeMessages.remove(int.parse(clientSeq));
  //   if (result == '0') {
  //     requestedSubscribes.remove(clientSeq);
  //   } else if (result == '1') {
  //     for (final topic in requestedSubscribes[clientSeq] ?? []) {
  //       subscribedTopics.add(topic);
  //     }
  //     requestedSubscribes.remove(clientSeq);
  //   }
  // }

  // handleStreamResponse(Map<String, dynamic> msg) {
  //   streamController.sink.add(msg);
  // }

  // handleHistoryData(dynamic msg) {
  //   final data = {
  //     "his_res": {
  //       'status': msg['Code'] == 'DONE',
  //       'data': msg['Data'],
  //       'stockCode': requestedHistoryData[msg['ClientSeq']],
  //     }
  //   };
  //   if (data['his_res']?['status'] == true) {
  //     requestedHistoryData.remove(msg['ClientSeq']);
  //   }
  //   streamController.sink.add(data);
  // }

  handleSubscribe(Map<String, dynamic> msg) {
    String clientSeq = msg['ClientSeq'].toString();
    String result = msg['Result'].toString();
    final subcribedValue = subscribeMessages[int.parse(clientSeq)];
    if (subcribedValue == null) {
      return;
    }
    subcribedValue.completer.complete(true);
    subscribeMessages.remove(int.parse(clientSeq));
    if (result == '0') {
      requestedSubscribes.remove(clientSeq);
    } else if (result == '1') {
      for (final topic in requestedSubscribes[clientSeq] ?? []) {
        subscribedTopics.add(topic);
      }
      requestedSubscribes.remove(clientSeq);
    }
  }

  handleStreamResponse(Map<String, dynamic> msg) {
    print('msg $msg');
    streamController.sink.add(msg);
  }

  @override
  disconnect() {}
}
