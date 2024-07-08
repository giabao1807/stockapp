class SessionInfo {
  String sessionId;
  String userID;
  String passID;
  String otp;
  String loginId;

  SessionInfo({
    required this.sessionId,
    required this.userID,
    required this.passID,
    required this.otp,
    required this.loginId,
  });

  bool get verifyOtp => otp != '';

  factory SessionInfo.init() => SessionInfo(
        sessionId: '',
        userID: '',
        passID: '',
        otp: '',
        loginId: '',
      );
}
