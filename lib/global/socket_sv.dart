// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'package:mtsv4/global/global_app_config.dart';
// import 'package:mtsv4/global/global_sv.dart';
// import 'package:mtsv4/global/interface/i_service_info.dart';
// import 'package:mtsv4/utils/constants/channels.dart';
// import 'package:mtsv4/utils/models/input_service_body.dart';
// import 'package:mtsv4/utils/models/request_Info.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// import '../utils/common.dart';

// class SocketService {
//   final String TAG = 'SocketService';

//   int requestSeq = 0;
//   Map<dynamic, dynamic> requestMap = {};
//   Map<String, dynamic> channels = listChannels;
//   // bool socket_public_flag = false;

//   late IO.Socket serviceSocket = IO.io(
//     serviceUrlArr[0],
//     IO.OptionBuilder()
//         .setTransports(['websocket', 'polling'])
//         .disableReconnection()
//         .disableAutoConnect()
//         .enableForceNewConnection()
//         .setPath('/services')
//         .build(),
//   );
//   // bool socket_market_flag = false;
//   late IO.Socket marketSocket = IO.io(
//     marketUrlArr[0],
//     IO.OptionBuilder()
//         .setTransports(['websocket', 'polling'])
//         .disableReconnection()
//         .disableAutoConnect()
//         .enableForceNewConnection()
//         .setPath('/market')
//         .build(),
//   );
//   // bool socket_trading_flag = false;
//   List<String> marketUrlArr = [];
//   List<String> serviceUrlArr = [];
//   int marketUrlIndex = 0;
//   int serviceUrlIndex = 0;
//   List<ServerNode> serverNodeArr = [];
//   int serverNodeIndex = 0;
//   // bool authen_conect_first = false;
//   int countAuthenReq = 0;
//   bool anotherLoginFlag = false;
//   int getRqSeq() => ++requestSeq;
//   Map<String, String> connectEventMap = {};

//   void establishSocketConnect(
//       String typeConnect, Map<String, dynamic> options) {}

//   // void send2Sv(dynamic key, InputServiceBody message) {
//   //   // LogUtils.showLog('send2Sv', key + message);
//   //   if (channels['LIST_CHANNELS_STREAM'] != null &&
//   //       channels['LIST_CHANNELS_STREAM']!.contains(key)) {
//   //     socket_stream.emit(key, message.toString());
//   //   } else {
//   //     if (message != null && message?.ServiceName == 'FOSxID02_Login') {
//   //       this.countAuthenReq = 0;
//   //     }
//   //     print('send to service ======================' + message.toJson());
//   //     socket_trading.emit(key, message.toJson());
//   //   }
//   // }

//   void setNewServiceConnection(int index) {
//     if (serviceSocket.connected) {
//       print("Aldeady connected to stream socket!: ${serviceSocket.id}");
//       return;
//     }

//     serviceSocket = IO.io(
//       serviceUrlArr[0],
//       IO.OptionBuilder()
//           .setTransports(['websocket', 'polling'])
//           .disableReconnection()
//           .disableAutoConnect()
//           .enableForceNewConnection()
//           .setPath('/services')
//           .build(),
//     );

//     serviceSocket.onConnect((_) {
//       print('connect');
//       serviceSocket.emit('msg', 'test');
//     });
//     serviceSocket.on('event', (data) => print(data));

//     serviceSocket.on('fromServer', (_) => print(_));

//     serviceSocket.connect();
//     // socket_stream.onDisconnect((_) => print('disconnect'));
//   }

//   void setNewMarketConnection(int index) {
//     if (marketSocket.connected) {
//       print("Aldeady connected to trading socket!: ${marketSocket.id}");
//       return;
//     }
//     marketSocket = IO.io(
//       marketUrlArr[0],
//       IO.OptionBuilder()
//           .setTransports(['websocket', 'polling'])
//           .disableReconnection()
//           .disableAutoConnect()
//           .enableForceNewConnection()
//           .setPath('/market')
//           .build(),
//     );
//     marketSocket.connect();
//   }

//   void createSocketConnection() {
//     setNewServiceConnection(0);
//     setNewMarketConnection(0);

//     createMarketSocketListener();
//     createServiceSocketListener();
//   }

//   void createMarketSocketListener() {
//     marketSocket.onConnect((data) {
//       print('${TAG} marketSocket connected');
//     });

//     marketSocket.on("connect", (data) {
//       print('${TAG} marketSocket connected');
//     });

//     marketSocket.on('SUB_RES', (data) {
//       print('marketSocket SUB_RES: ${data}');
//       handleSubscribe(data);
//     });

//     marketSocket.on('UNSUB_RES', (data) {
//       print('marketSocket UNSUB_RES: ${data}');
//     });

//     marketSocket.onDisconnect((data) {
//       // Future.delayed(const Duration(milliseconds: 500), reConnnect);
//     });

//     marketSocket.onConnectError((data) {
//       // Future.delayed(const Duration(milliseconds: 500), reConnnect);
//     });

//     marketSocket.connect();
//   }

//   handleSubscribe(Map<String, dynamic> msg) {
//     String clientSeq = msg['ClientSeq'].toString();
//     String result = msg['Result'].toString();
//     // final subcribedValue = subscribeMessages[int.parse(clientSeq)];
//     // if (subcribedValue == null) {
//     //   return;
//     // }
//     // subcribedValue.completer.complete(true);
//     // subscribeMessages.remove(int.parse(clientSeq));
//     // if (result == '0') {
//     //   requestedSubscribes.remove(clientSeq);
//     // } else if (result == '1') {
//     //   for (final topic in requestedSubscribes[clientSeq] ?? []) {
//     //     subscribedTopics.add(topic);
//     //   }
//     //   requestedSubscribes.remove(clientSeq);
//     // }
//   }

//   void createServiceSocketListener() {
//     serviceSocket.on("connect", (data) {
//       print('${TAG} serviceSocket connected');
//     });

//     serviceSocket.connect();
//   }

//   void reConnectSocket(String typeReconnect, String socketNm) {
//     // print('Re-connect socket: $typeReconnect');
//     if (baseIsEqual(socketNm, 'socket_stream')) {
//       if (!serviceSocket.connected) {
//         setNewServiceConnection(marketUrlIndex);
//       }
//     }
//     if (baseIsEqual(socketNm, 'socket_trading')) {
//       setNewMarketConnection(serviceUrlIndex);
//     }
//   }

//   void socket_StartListener_Stream(IO.Socket socket,
//       {String socket_nm = 'socket_stream'}) {
//     socket.on('connect_error', (data) {
//       socket.sendBuffer = [];
//       // xử lý khi gặp lỗi connect_error
//       if (glb_sv.isInternetReachable) {
//         // Trường hợp mạng vẫn đang kết nối ổn định nhưng server sập thì đổi server khác và thông báo để connect lại
//         //TODO: swictch connect socket here
//         // if (this.switchSocketOnNode(socket_nm)) {
//         //               console.warn("Server lost", socket_nm, socket.io.uri);
//         //               // glb_sv.eventConnect.next({ type: this.connect_event.SERVER_LOST, data: socket_nm, uri: socket.io.uri })
//         //               setTimeout(() => {
//         //                   this.reConnectSocket('reconnect_on_server_lost', { socket_nm })
//         //               }, 1000);
//         // }
//       } else {
//         socket.destroy();

//         Timer(const Duration(seconds: 1), () {
//           reConnectSocket('reconnect_on_error', socket_nm);
//         });
//       }
//     });

//     marketSocket = IO.io(
//       serviceUrlArr[0],
//       IO.OptionBuilder()
//           .setTransports(['websocket', 'polling'])
//           .disableReconnection()
//           .disableAutoConnect()
//           .enableForceNewConnection()
//           .setPath('/services')
//           .build(),
//     );
//     marketSocket.connect();

//     socket_StartListener_Stream(serviceSocket);
//     marketSocket.on("connect", (data) {
//       print(
//           '===========> connected to trading socket${marketSocket.id}========${marketSocket.io.uri}');
//     });
//     // socket_trading.on('event', (data) => streamSocket.addResponse);

//     socket.on('disconnect', (data) {
//       if (anotherLoginFlag) return;
//       socket.sendBuffer = [];
//       //TODO: Gửi event reconnect socket REQ_RECONNECT_ON_DISCONNECT
//       Timer(const Duration(seconds: 1), () {
//         reConnectSocket('reconnect_on_disconnect', socket_nm);
//       });
//     });

//     socket.on(channels['RES_MSG'], (data) {
//       var mssg;
//       if (baseIsEqual(data.runtimeType, 'String')) {
//         mssg = jsonDecode(data);
//       } else {
//         mssg = data;
//       }
//       try {
//         var cltSeqResult = int.parse(mssg['ClientSeq']);
//       } catch (e) {
//         print('error khi parse mssg $mssg ============== $e');
//         return;
//       }
//       var cltSeqResult = int.parse(mssg['ClientSeq']);
//       if (cltSeqResult.isNaN) return;
//       RequestInfo? reqInfoMap = glb_sv.getReqInfoMapValue(cltSeqResult);
//       if (reqInfoMap == null) {
//         return;
//       }
//       // Trycatch parse before send to handleResult
//       try {
//         jsonDecode(mssg["Data"]);
//       } catch (err) {
//         print('error khi parse data $err ${mssg.toString()}');
//         mssg['Data'] = '';
//       }

//       reqInfoMap.receiveFunct(reqInfoMap, IServiceRespone.fromJson(mssg));

//       // glb_sv.commonEvent.next({ type: eventList.RES_COMMON_MSG, ...mssg }) //todo: gọi service subscribe common event here
//       // Clear timeOut //todo: Chỉnh lại control timeout ở chỗ này
//       // if (reqInfoMap == null) {
//       //     var controlTimeOutKey = reqInfoMap.reqFunct + '|' + reqInfoMap.WorkerName + '|' + reqInfoMap.ServiceName + '|' + jsonDecode(reqInfoMap.inputParam);
//       //     glb_sv.clearTimeOutRequest(controlTimeOutKey);
//       // }
//     });
//   }
// }

// SocketService socket_sv = SocketService();
