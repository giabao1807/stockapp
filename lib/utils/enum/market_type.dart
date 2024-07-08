enum MARKET {
  HSX,
  HNX,
  UPC,
  NONE,
}

extension Market on MARKET {
  static const markets = {
    MARKET.HSX: '01',
    MARKET.HNX: '03',
    MARKET.UPC: '05',
  };
  static const _names = {
    MARKET.HSX: 'HOSE',
    MARKET.HNX: 'HNX',
    MARKET.UPC: 'UPCOM',
  };
  static const _codes = {
    MARKET.HSX: 'HSX',
    MARKET.HNX: 'HNX',
    MARKET.UPC: 'UPC',
  };

  String? get market => markets[this];
  String get display => _names[this] ?? '';
  String get code => _codes[this] ?? '';
}

class MarketType {
  static const _values = {
    "01": MARKET.HSX,
    "03": MARKET.HNX,
    "05": MARKET.UPC,
  };

  static MARKET valueOf(String id) {
    if (id.isEmpty || id == '0') return MARKET.NONE;
    MARKET value = _values[id] ?? MARKET.NONE;
    return value;
  }
}
