import 'base_stream_client.dart';

class MarketStreamClient extends BaseStreamClient {
  static MarketStreamClient? _instance;

  factory MarketStreamClient() => _instance ??= MarketStreamClient._();

  MarketStreamClient._() : super('/market') {
    ioSocket.on('SUB_RES', (data) {
      print('SUB_RES $data');
      handleSubscribe(data);
    });

    ioSocket.on('UNSUB_RES', (data) {});

    ioSocket.on(
      'onFOSStream',
      (data) {
        print('onFOSStream $data');
        // Logger.debugLog('stream FOS', jsonEncode(data));
        handleStreamResponse(data);
      },
    );

    ioSocket.on('HIST_RES', (data) {
      // Logger.debugLog('stream history response', jsonEncode(data));
      // handleHistoryData(data);
    });

    ioSocket.on('AUTHEN_RES', (data) {
      // Logger.debugLog('stream authenticate response', '$data');
    });
  }

  @override
  onReconnectSuccess() {
    // if (subscribing.isNotEmpty) {
    // for (var element in subscribing.keys) {
    // subscribe([element], subscribing[element] ?? []);
    // }
    // }
    return super.onReconnectSuccess();
  }
}
