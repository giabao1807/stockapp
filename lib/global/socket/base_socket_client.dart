import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:mtsv4/model/data_request.dart';
import 'package:mtsv4/model/input_service_body.dart';
import 'package:mtsv4/model/request_mesage.dart';
import 'package:mtsv4/model/request_response.dart';
import 'package:mtsv4/presentation/auth_controller.dart';
import 'socket_client.dart';

/// [BaseSocketClient] được kế thừa từ [SocketClient]
/// Để đảm bảo performance và bộ nhớ
/// [BaseSocketClient] không được gọi trực tiếp ra mà phải gọi từ 1 class khác kế thừa [BaseSocketClient] và class này phải là Singleton
/// Với mỗi path khác nhau cần phải tạo 1 client mới

abstract class BaseSocketClient extends SocketClient {
  final String path;
  BaseSocketClient(this.path) : super(path);
  String otp = '';

  final Map<int, RequestedMessage> requestedMessages = {};

  final StreamController<dynamic> streamTokenController =
      StreamController.broadcast();

  Future<RequestResponse> sendRequest({
    required String workerName,
    required String serviceName,
    required String operation,
    Headers? headers,
    inputParams,
    timeOut = 15,
    String aprStat = 'N',
    String aprSeq = '',
    String makerDt = '',
    String? otp,
    int? clientSeq,
  }) async {
    var seq = clientSeq ?? getClientSeq();

    final AuthService _auth = Get.find();
    

    final input = InputServiceBody(
      appLoginID: headers?.token?.ud?.u,
      appLoginPswd: _auth.sessionInfo.passID,
      sessionID: headers?.token?.ud?.sid,
      otp: otp ?? this.otp,
      aprStat: aprStat,
      aprSeq: aprSeq,
      makerDt: makerDt,
      clientSeq: seq,
      serviceName: serviceName,
      workerName: workerName,
      operation: operation,
      inVal: inputParams,
      totInVal: inputParams.length,
      timeOut: timeOut,
      secCode: '004',
      mwLoginPswd: ",+A,3-)-C.*,6,9,=+F*K.N*M.=+)+J,004",
      mwLoginID: 'Android',
      mdmTp: '03',
      lang: 'EN',
      cltVersion: '3.0.0',
    );

    final data = jsonEncode(input);
    print('REQ_MSG $data');
    ioSocket.emit('REQ_MSG', data);
//     Logger.debugLog('Send Request', '''
// AppLoginID: ${headers?.token?.ud?.u ?? ''}
// SessionID: ${headers?.token?.ud?.sid ?? ''}
// WorkerName: $workerName
// ServiceName: $serviceName
// Lang: ${(Get.locale?.languageCode ?? 'en').toUpperCase()}
// Operation: $operation
// ActToken: ${actToken ?? ''}
// ''');

    /// Sau khi emit data lên thì khởi tạo 1 [RequestedMessage] có chứa Completer
    final requestedValue = requestedMessages[seq] ??= RequestedMessage(
      completer: Completer<RequestResponse>(),
      request: input,
    );

    requestedValue.completer.future.timeout(
      Duration(seconds: timeOut + 5),
      onTimeout: () {
        if (requestedValue.completer.isCompleted) {
          return requestedValue.completer.future;
        }
        final res = RequestResponse(
          code: '123456',
          response: jsonEncode(
            {
              "TransId": "XXXXXX",
              "ClientSeq": seq.toString(),
              "Packet": "0",
              "Data": "",
              "Code": "010005",
              "Message": "an_error_occurred_please_try_again_later",
              "Result": "0"
            },
          ),
        );
        requestedValue.completer.complete(res);
        return res;
      },
    );
    return requestedValue.completer.future;
  }

  handleResponse(Map<String, dynamic> msg, {bool showLog = false}) {
    var messageCode = msg["Code"];
    var _clientSeq = int.parse(msg['ClientSeq'].toString());
    final requestedValue = requestedMessages[_clientSeq];
    if (requestedValue == null) {
      return;
    }
    final request = requestedValue.request;
    final serviceName = request.serviceName;
    if (showLog) {
      print('handleResponse $msg');
    }

    final response = requestedValue.response ??= {};
    response.addAll(msg);
    String effectiveResponse = json.encode(response);
    if (messageCode == '010083') {
      streamTokenController.sink.addError(response['Message'] ?? '');
      reConnnect();
      requestedMessages.clear();
      return;
    }
    requestedValue.completer.complete(
      RequestResponse(
        code: messageCode,
        response: effectiveResponse,
        shouldParseToHtml: false,
        shouldFilterBeforeParse: false,
      ),
    );
    requestedMessages.remove(_clientSeq);
  }

  // Future<PackageInfo> _getPackageInfo() async {
  //   final newInfo = _info;
  //   if (newInfo != null) {
  //     return newInfo;
  //   } else {
  //     return await PackageInfo.fromPlatform();
  //   }
  // }

  // _refreshToken() async {
  //   _showLoadingCirlce();
  //   final res = await NetUtils.refreshToken();
  //   NetUtils.tokenRefreshing = false;
  //   AppDialogs.hideLoadingCircle();
  //   if (res.result) {
  //     streamTokenController.sink.add(res.items);
  //   } else {
  //     streamTokenController.sink.addError('XXXXX7_code_message'.tr);
  //   }
  // }

  // _showLoadingCirlce() {
  //   final BuildContext? context = navigatorKey.currentState?.overlay?.context;
  //   final widget = WillPopScope(
  //     onWillPop: () async => false,
  //     child: SizedBox.expand(
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           Image.asset(
  //             AssetPath.avatar,
  //             height: 100,
  //             width: 100,
  //           ),
  //           Gaps.vGap20,
  //           SizedBox(
  //             width: Get.width / 3,
  //             child: const LinearProgressIndicator(
  //               color: AppColors.greenButton,
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  //   if (context == null) {
  //     Get.dialog(
  //       barrierColor: AppColors.blueBg.withOpacity(0.6),
  //       barrierDismissible: false,
  //       widget,
  //       routeSettings: const RouteSettings(name: 'refresh_token'),
  //     );
  //   } else {
  //     showDialog(
  //       context: context,
  //       barrierDismissible: false,
  //       barrierColor: AppColors.blueBg.withOpacity(0.6),
  //       builder: (context) => widget,
  //       routeSettings: const RouteSettings(name: 'refresh_token'),
  //     );
  //   }
  // }

  // retryRequestIncomplete() {
  //   final data = requestedMessages.entries
  //       .where((e) => e.value.completer.isCompleted == false);
  //   inspect(data);
  //   for (var e in data) {
  //     final request = e.value.request;
  //     request.actToken = AuthRepo.accessToken;
  //     request.sessionID = AuthRepo.headers?.token?.ud?.sid;
  //     request.appLoginID = AuthRepo.headers?.token?.ud?.u;
  //     sendRequest(
  //       workerName: request.workerName,
  //       serviceName: request.serviceName,
  //       operation: request.operation,
  //       aprSeq: request.aprSeq,
  //       aprStat: request.aprStat,
  //       clientSeq: e.key,
  //       actToken: AuthRepo.accessToken,
  //       headers: AuthRepo.headers,
  //       inputParams: request.inVal,
  //       makerDt: request.makerDt,
  //       otp: request.otp,
  //       timeOut: request.timeOut,
  //     );
  //   }
  // }
}
