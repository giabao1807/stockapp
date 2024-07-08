import 'package:get/get.dart';

enum REVENUE_BY { INCOME, BALANCE, CASH_FLOW }

extension RevenueByExt on REVENUE_BY {
  static const _name = {
    REVENUE_BY.INCOME: 'income_statement',
    REVENUE_BY.BALANCE: 'balance_sheet',
    REVENUE_BY.CASH_FLOW: 'cash_flow_statement',
  };
  static const _commands = {
    REVENUE_BY.INCOME: '01',
    REVENUE_BY.BALANCE: '02',
    REVENUE_BY.CASH_FLOW: '03',
  };

  String get command => _commands[this] ?? '';

  String get name => _name[this]?.tr ?? '';
}
