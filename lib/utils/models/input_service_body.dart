// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:convert';

// import 'package:flutter/foundation.dart';

// import 'package:mtsv4/global/global_sv.dart';

// // import 'package:uuid/uuid.dart';

// class InputServiceBody {
//   String? CltVersion;
//   num? ClientSeq;
//   String? SecCode;
//   String? WorkerName;
//   String? ServiceName;
//   int? TimeOut;
//   String MWLoginID;
//   String MWLoginPswd;
//   String? AppLoginID;
//   String? AppLoginPswd;
//   String? ClientSentTime;
//   String Lang;
//   String MdmTp;
//   dynamic InVal;
//   int? TotInVal;
//   dynamic AprStat;
//   String Operation;
//   String CustMgnBrch;
//   String CustMgnAgc;
//   String BrkMgnBrch;
//   String BrkMgnAgc;
//   String LoginBrch;
//   String LoginAgnc;
//   dynamic AprSeq;
//   dynamic MakerDt;
//   String AprIP;
//   String AprID;
//   String AprAmt;
//   String IPPrivate;
//   dynamic Otp;
//   String AcntNo;
//   String SubNo;
//   String BankCd;
//   String PCName;
//   String SessionID;

//   InputServiceBody({
//     required num clientSeq,
//     required String workerName,
//     required String serviceName,
//     required dynamic inVal,
//     required String operation,
//     String? appLoginID,
//     String? appLoginPswd,
//     dynamic otp,
//     dynamic aprStat,
//     dynamic aprSeq,
//     dynamic makerDt,
//     int? timeOut,
//   })  : CltVersion = '3.1.0', //todo: fix config info in here
//         ClientSeq = clientSeq,
//         SecCode = glb_sv.activeCode ?? '004', //todo:
//         WorkerName = workerName,
//         ServiceName = serviceName,
//         TimeOut = timeOut ?? 15,
//         MWLoginID =
//             defaultTargetPlatform == TargetPlatform.android ? 'Android' : 'IOS',
//         MWLoginPswd = defaultTargetPlatform == TargetPlatform.android
//             ? ',+A,3-)-C.*,6,9,=+F*K.N*M.=+)+J,004'
//             : '4,D+M,**K/O--+D-D-F-B,E+A,E,B,7',
//         AppLoginID = '', //todo: fix objectShareGlb info in here
//         AppLoginPswd = '', //todo: fix objectShareGlb info in here
//         ClientSentTime = '0',
//         Lang = glb_sv.language ?? 'VI',
//         MdmTp = defaultTargetPlatform == TargetPlatform.android ? '03' : '04',
//         InVal = inVal,
//         TotInVal = inVal.length,
//         AprStat = aprStat ?? 'N',
//         Operation = operation,
//         CustMgnBrch = '',
//         CustMgnAgc = '',
//         BrkMgnBrch = '',
//         BrkMgnAgc = '',
//         LoginBrch = '',
//         LoginAgnc = '',
//         AprSeq = aprSeq ?? '',
//         MakerDt = makerDt ?? '',
//         AprIP = '',
//         AprID = '',
//         AprAmt = '',
//         IPPrivate = '192.168.1.113',
//         Otp = '', //todo: fix objectShareGlb info in here
//         AcntNo = '',
//         SubNo = '',
//         BankCd = '',
//         PCName = glb_sv.deviceName ?? '',
//         SessionID = ''; //todo: fix objectShareGlb info in here

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'CltVersion': CltVersion,
//       'ClientSeq': ClientSeq,
//       'SecCode': SecCode,
//       'WorkerName': WorkerName,
//       'ServiceName': ServiceName,
//       'TimeOut': TimeOut,
//       'MWLoginID': MWLoginID,
//       'MWLoginPswd': MWLoginPswd,
//       'AppLoginID': AppLoginID,
//       'AppLoginPswd': AppLoginPswd,
//       'ClientSentTime': ClientSentTime,
//       'Lang': Lang,
//       'MdmTp': MdmTp,
//       'InVal': InVal,
//       'TotInVal': TotInVal,
//       'AprStat': AprStat,
//       'Operation': Operation,
//       'CustMgnBrch': CustMgnBrch,
//       'CustMgnAgc': CustMgnAgc,
//       'BrkMgnBrch': BrkMgnBrch,
//       'BrkMgnAgc': BrkMgnAgc,
//       'LoginBrch': LoginBrch,
//       'LoginAgnc': LoginAgnc,
//       'AprSeq': AprSeq,
//       'MakerDt': MakerDt,
//       'AprIP': AprIP,
//       'AprID': AprID,
//       'AprAmt': AprAmt,
//       'IPPrivate': IPPrivate,
//       'Otp': Otp,
//       'AcntNo': AcntNo,
//       'SubNo': SubNo,
//       'BankCd': BankCd,
//       'PCName': PCName,
//       'SessionID': SessionID,
//     };
//   }

//   String toJson() => json.encode(toMap());
// }
