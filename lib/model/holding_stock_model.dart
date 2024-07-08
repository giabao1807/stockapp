class HoldingStockModel {
  HoldingStockModel({
    required this.stockCode,
    required this.waitingQty,
    required this.currentPrice,
    required this.currentValue,
    required this.avgPrice,
    required this.avgValue,
    required this.profitloss,
    required this.profitlossRate,
    required this.total,
    required this.availableStock,
    this.booster = false,
  });

  final String stockCode;
  final num waitingQty;
  num currentPrice;
  num currentValue;
  final num avgPrice;
  num avgValue;
  num profitloss;
  num profitlossRate;
  final num total;
  final num availableStock;
  final bool booster;

  factory HoldingStockModel.fromJson(Map<String, dynamic> json) =>
      HoldingStockModel(
        stockCode: json["c2"],
        waitingQty: num.parse(json["c14"]),
        currentPrice: num.parse(json["c15"]),
        currentValue: num.parse(json["c16"]),
        avgPrice: num.parse(json["c17"]),
        avgValue: num.parse(json["c18"]),
        profitloss: num.parse(json["c19"]),
        profitlossRate: num.parse(json["c20"]),
        total: num.parse(json["c25"]) + num.parse(json["c14"]),
        availableStock: num.parse(json["c25"]),
      );
}
