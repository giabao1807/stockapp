class LendingMarginModel {
  LendingMarginModel({
    required this.c0,
    required this.c1,
    required this.c2,
    required this.c3,
    required this.c4,
    required this.c5,
    required this.c6,
    required this.c7,
    required this.c8,
    required this.c9,
    required this.c10,
    required this.c11,
  });

  final num c0;
  final num c1;
  final num c2;
  final num c3;
  final num c4;
  final num c5;
  final num c6;
  final num c7;
  final num c8;
  final num c9;
  final num c10;
  final num c11;

  factory LendingMarginModel.fromMap(Map<String, dynamic> json) =>
      LendingMarginModel(
        c0: num.tryParse(json["c0"]) ?? 0,
        c1: num.tryParse(json["c1"]) ?? 0,
        c2: num.tryParse(json["c2"]) ?? 0,
        c3: num.tryParse(json["c3"]) ?? 0,
        c4: num.tryParse(json["c4"]) ?? 0,
        c5: num.tryParse(json["c5"]) ?? 0,
        c6: num.tryParse(json["c6"]) ?? 0,
        c7: num.tryParse(json["c7"]) ?? 0,
        c8: num.tryParse(json["c8"]) ?? 0,
        c9: num.tryParse(json["c9"]) ?? 0,
        c10: num.tryParse(json["c10"]) ?? 0,
        c11: num.tryParse(json["c11"]) ?? 0,
      );

  // Service FOSqMargin/FOSqLendingMargin_Online_1450_2
  // Dư nợ ứng trước: c0
  // Phí ứng trước: c1
  // Dư nợ HĐ ký quỹ: c2
  // Lãi HD ký quỹ: c3
  // Nợ tạm tính: c4
  // Tổng nợ thực tế: c6
  // CMR: c8
  // Dư ký quỹ (EE): c11
  // Số tiền phải nộp: c9
  // Hạn mức ký quỹ: c10
  Map<String, num> toMap() => {
        'pia_loan_current': c0,
        'pia_loan_fee': c1,
        'margin_debt': c2,
        'margin_debt_fee': c3,
        'temporary_loan': c4,
        'total_current_loand': c6,
        'cmr': c8,
        'margin_EE': c11,
        'adding_amount': c9,
        'remain_margin_amount': c10,
      };
}
