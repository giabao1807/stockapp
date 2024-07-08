// // ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:mtsv4/utils/send_request.dart';

// class RequestInfo {
//   dynamic reqFunct;
//   ThandleResultFunc receiveFunct;
//   bool? resSucc;
//   dynamic inputParam;
//   dynamic WorkerName;
//   dynamic ServiceName;

//   RequestInfo({
//     required this.reqFunct,
//     required this.receiveFunct,
//     this.resSucc,
//     required this.inputParam,
//     required this.WorkerName,
//     required this.ServiceName,
//   }) {
//     // this.reqTime = new DateTime.now(); //-- time that client send request
//     // this.resTime = new DateTime.now(); //-- time receive result from server
//     resSucc = true; //-- status process request of service (false => error)
//   }
// }

// /**
//  * tất cả các request từ client được lưu vào Hashmap, với key là request sequence tăng dần, value là
//  * object như model trên
//  */
