import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mtsv4/global/socket/fos_client.dart';
import 'package:mtsv4/model/data_request.dart';
import 'package:mtsv4/model/login_model.dart';


class AuthRepo {
  final FosClient _client;

  final Function(LoginModel res)? onRefreshTokenSuccess;

  final Function(String error)? onRefreshTokenError;

  final Function(Map<String, dynamic> value)? onReceivedSystemMessage;

  final _storage = const FlutterSecureStorage();

  FlutterSecureStorage get storage => _storage;

  /// Use for dont show error when user not continue social login
  final String notHaveValueLogin = 'Not have value';

  AuthRepo({
    this.onRefreshTokenSuccess,
    this.onRefreshTokenError,
    this.onReceivedSystemMessage,
  })  : _client = FosClient(){
    _init();
    _client.streamSystemMessage.stream.listen(
      (event) {
        onReceivedSystemMessage?.call(event);
      },
    );
  }

  static String get loginId => headers?.token?.ud?.u ?? '';

  static String? accessToken;

  static Headers? headers;

  _init() async {

  }

  Future<LoginModel> authenticate(List<String> inputParam) async {
    try {
      final res = await _client.sendRequest(
        workerName: 'FOSxID02',
        serviceName: 'FOSxID02_Login',
        operation: 'U',
        inputParams: inputParam,
      );

      if (res.result) {
        final response = res.items;
        return _handleLoginResponse(response, inputParam[2]);
      } else {
        if (res.code == '010010') {
          throw res.code;
        } else {
          throw res.messages;
        }
      }
    } catch (e) {
      rethrow;
    }
  }

  LoginModel _handleLoginResponse(List response, String password) {
    final id = response[0]['c1'];
    final sessionId = response[0]['c0'];
    final _headers = {
      'token': {
        'ud': {
          'u': id,
          'sid': sessionId,
          'p': password
        }
      }
    };

    final loginModel = LoginModel.fromJson(response[0]);
    accessToken = loginModel.accessToken;
    headers = Headers.fromJson(_headers);
    _storage.write(key: 'act_token', value: loginModel.accessToken);
    _storage.write(key: 'loginId', value: id);
    _storage.write(key: 'sessionId', value: sessionId);
    _storage.write(key: 'refresh_token', value: loginModel.refreshToken);
    return loginModel;
  }

  Future<bool> recordStatistics({required List<String> params}) async {
    final result = await _client.sendRequest(
      workerName: 'FOSxID03',
      serviceName: 'FOSxID03_Statistics',
      operation: 'Q',
      inputParams: params,
      headers: AuthRepo.headers,
    );
    if (result.hasError) {
      throw result.messages;
    } else {
      return true;
    }
  }

}
