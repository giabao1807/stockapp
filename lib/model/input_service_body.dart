class InputServiceBody {
  final dynamic cltVersion;
  final dynamic clientSeq;
  final String secCode;
  final String workerName;
  final String serviceName;
  final int timeOut;
  final String mwLoginID;
  final String mwLoginPswd;
  String? appLoginID;
  final String? appLoginPswd;
  final String clientSentTime;
  final String lang;
  final String mdmTp;
  final List inVal;
  final int totInVal;
  final String aprStat;
  final String operation;
  final String custMgnBrch;
  final String custMgnAgc;
  final String brkMgnBrch;
  final String brkMgnAgc;
  final String loginBrch;
  final String loginAgnc;
  final String aprSeq;
  final String makerDt;
  final String aprIP;
  final String aprID;
  final String aprAmt;
  final String ipPrivate;
  final String? otp;
  final String acntNo;
  final String subNo;
  final String bankCd;
  final String pcName;
  String? sessionID;

  InputServiceBody({
    required this.workerName,
    required this.serviceName,
    required this.inVal,
    required this.operation,
    this.totInVal = 0,
    this.secCode = '004',
    this.mwLoginPswd = ",+A,3-)-C.*,6,9,=+F*K.N*M.=+)+J,004",
    this.cltVersion = '3.0.0',
    this.clientSeq,
    this.timeOut = 15,
    this.mwLoginID = 'Android',
    this.appLoginID,
    this.appLoginPswd,
    this.clientSentTime = '0',
    this.lang = "EN",
    this.mdmTp = '03',
    this.aprStat = "N",
    this.custMgnBrch = '',
    this.custMgnAgc = '',
    this.brkMgnBrch = '',
    this.brkMgnAgc = '',
    this.loginBrch = '',
    this.loginAgnc = '',
    this.aprSeq = '',
    this.makerDt = '',
    this.aprIP = '',
    this.aprID = '',
    this.aprAmt = '',
    this.ipPrivate = "192.168.1.1",
    this.otp,
    this.acntNo = '',
    this.subNo = '',
    this.bankCd = '',
    this.pcName = '',
    this.sessionID,
  });

  Map toJson() => {
        'CltVersion': cltVersion,
        'ClientSeq': clientSeq,
        'SecCode': secCode,
        'WorkerName': workerName,
        'ServiceName': serviceName,
        'TimeOut': timeOut,
        'MWLoginID': mwLoginID,
        'MWLoginPswd': mwLoginPswd,
        'AppLoginID': appLoginID ?? '',
        'AppLoginPswd': appLoginPswd ?? '',
        'ClientSentTime': clientSentTime,
        'Lang': lang,
        'MdmTp': mdmTp,
        'InVal': inVal,
        'TotInVal': inVal.length,
        'AprStat': aprStat,
        'Operation': operation,
        'CustMgnBrch': custMgnBrch,
        'CustMgnAgc': custMgnAgc,
        'BrkMgnBrch': brkMgnBrch,
        'BrkMgnAgc': brkMgnAgc,
        'LoginBrch': loginBrch,
        'LoginAgnc': loginAgnc,
        'AprSeq': aprSeq,
        'MakerDt': makerDt,
        'AprIP': aprIP,
        'AprID': aprID,
        'AprAmt': aprAmt,
        'IPPrivate': ipPrivate,
        'Otp': otp ?? '',
        'AcntNo': acntNo,
        'SubNo': subNo,
        'BankCd': bankCd,
        'PCName': pcName,
        'SessionID': sessionID ?? '',
      };
}
