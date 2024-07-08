enum BoosterFlag {
  GetAll('%', 'Get all stock'),
  GetBooster('Y', 'Booster stock only'),
  GetNormal('N', 'Normal stock');

  const BoosterFlag(this.value, this.name);
  final String value;
  final String name;
}
