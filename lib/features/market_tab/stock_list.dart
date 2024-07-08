import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/features/top_trading/top_trading_controller.dart';
import 'package:mtsv4/model/stock_top_model.dart';
import 'package:mtsv4/utils/models/stock_item.dart';

class StockList extends StatefulWidget {
  // const StockList({super.key});

  @override
  State<StockList> createState() => _StockListState();
}

class _StockListState extends State<StockList> {
  List<StockInfo> stockList = [];
  StockInfo stockInfo = StockInfo();
  final topStockList = <StockTopModel>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stockInfo.stockCode = 'AAA';
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
    // stockList.add(stockInfo);
  }

  @override
  Widget build(BuildContext context) {
    final topTradingController =
        GetInstance().putOrFind(() => TopTradingController());
    // final TopTradingController topTradingController =
    // Get.put(TopTradingController());

    return ListView.builder(
        itemCount: stockList.length,
        itemBuilder: (context, index) =>
            CustomListItem(item: stockList[index]));
  }
}

class CustomListItem extends StatelessWidget {
  final StockInfo item;

  const CustomListItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(item.stockCode),
        Text(item.stockCode),
        Text(item.stockCode),
        Text(item.stockCode)
      ],
    );
  }
}
