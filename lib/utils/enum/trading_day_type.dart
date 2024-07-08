enum TradingDayType {
  T('0', 'T'),
  T1('1', 'T-1'),
  T2('2', 'T-2'),
  T3('3', 'T-3'),
  T4('4', 'T-4');

  const TradingDayType(this.id, this.name);
  final String id;
  final String name;
}
