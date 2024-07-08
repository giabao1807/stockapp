// import 'package:mtsv4/global/global_sv.dart';
// import 'package:mtsv4/global/socket_sv.dart';
// import 'package:mtsv4/global/interface/i_service_info.dart';
// import 'package:mtsv4/utils/models/input_service_body.dart';
// import 'package:mtsv4/utils/models/request_Info.dart';

// import 'common.dart';

// typedef ThandleResultFunc = void Function(
//     RequestInfo reqInfoMap, IServiceRespone message);

// sendRequest(ISserviceInfo serviceInfo, List<String?> inputParams,
//     ThandleResultFunc handleResultFunc,
//     {bool isControlTimeOut = true,
//     Function? handleTimeOutCallback,
//     String? OTP,
//     int? time,
//     String? isClearReqInfoMap}) {
//   // if (!glb_sv.isInternetReachable || !glb_sv.isConnectApp) {
//   //   print(
//   //       "Mạng không ổn định, vui lòng thử lại sau: [ServiceInfo]: ${serviceInfo}, [inputParams]: ${inputParams}");
//   //   handleTimeOutCallback?.call({'type': 'error_network'});
//   //   return;
//   // }

//   // glb_sv.sendDataStatictis();

//   final controlTimeOutKey =
//       "${serviceInfo.reqFunct}|${serviceInfo.WorkerName}|${serviceInfo.ServiceName}|${inputParams.toString()}";
//   // if (glb_sv.ControlTimeOutObj.containsKey(controlTimeOutKey)) {
//   //   return;
//   // }

//   final clientSeq = socket_sv.getRqSeq();

//   final inputServiceBody = InputServiceBody(
//       clientSeq: clientSeq,
//       workerName: serviceInfo.WorkerName,
//       serviceName: serviceInfo.ServiceName,
//       inVal: inputParams,
//       operation: serviceInfo.operation,
//       appLoginID: null,
//       appLoginPswd: null,
//       otp: OTP,
//       aprStat: serviceInfo.AprStat,
//       aprSeq: serviceInfo.AprSeq,
//       makerDt: serviceInfo.MakerDt,
//       timeOut: serviceInfo.TimeOut);

//   final reqInfo = RequestInfo(
//       reqFunct: serviceInfo.reqFunct,
//       receiveFunct: handleResultFunc,
//       inputParam: inputParams,
//       WorkerName: serviceInfo.WorkerName,
//       ServiceName: serviceInfo.ServiceName);

//   glb_sv.setReqInfoMapValue(clientSeq, reqInfo);

//   // socket_sv.send2Sv(socket_sv.channels['REQ_MSG'], inputServiceBody);
//   if (isClearReqInfoMap == 'equal_input') {
//     for (var i = 1; i < clientSeq; i++) {
//       final reqInfoMap = glb_sv.getReqInfoMapValue(i);
//       if (reqInfoMap != null &&
//           reqInfoMap.reqFunct == serviceInfo.reqFunct &&
//           reqInfoMap.WorkerName == serviceInfo.WorkerName &&
//           reqInfoMap.ServiceName == serviceInfo.ServiceName &&
//           baseIsEqual(reqInfoMap.inputParam, inputParams)) {
//         final controlTimeOutKeyClear =
//             "${serviceInfo.reqFunct}|${serviceInfo.WorkerName}|${serviceInfo.ServiceName}|${reqInfoMap.inputParam.toString()}";
//         glb_sv.clearTimeOutRequest(controlTimeOutKeyClear);
//         glb_sv.setReqInfoMapValue(i, null);
//       }
//     }
//   }

//   if (isClearReqInfoMap == 'equal_service') {
//     for (var i = 1; i < clientSeq; i++) {
//       final reqInfoMap = glb_sv.getReqInfoMapValue(i);
//       if (reqInfoMap != null &&
//           reqInfoMap.reqFunct == serviceInfo.reqFunct &&
//           reqInfoMap.WorkerName == serviceInfo.WorkerName &&
//           reqInfoMap.ServiceName == serviceInfo.ServiceName &&
//           reqInfoMap.inputParam[0] == inputParams[0]) {
//         final controlTimeOutKeyClear =
//             "${serviceInfo.reqFunct}|${serviceInfo.WorkerName}|${serviceInfo.ServiceName}|${reqInfoMap.inputParam.toString()}";
//         glb_sv.clearTimeOutRequest(controlTimeOutKeyClear);
//         glb_sv.setReqInfoMapValue(i, null);
//       }
//     }
//   }

//   // if (isControlTimeOut) {
//   //   glb_sv.ControlTimeOutObj[controlTimeOutKey] =
//   //       Timer(Duration(milliseconds: time ?? 15000), () {
//   //     handleTimeOut(serviceInfo, controlTimeOutKey, handleTimeOutCallback,
//   //         reqInfo, clientSeq, inputParams);
//   //   });
//   // }
// }

// void handleTimeOut(
//   ISserviceInfo serviceInfo,
//   String controlTimeOutKey,
//   Function handleTimeOutCallback,
//   RequestInfo reqInfo,
//   int clientSeq,
//   List<String?> inputParams,
// ) {
//   print(
//       "Request bị timeOut [reqFunct]: $serviceInfo, [controlTimeOutKey]: $controlTimeOutKey");
//   glb_sv.clearTimeOutRequest(controlTimeOutKey);
//   glb_sv.clearReqInfoMapRequest(clientSeq);
//   handleTimeOutCallback.call({'type': 'timeout', 'inputParams': inputParams});
// }
