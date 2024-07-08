import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mtsv4/features/market_tab/market_tabbar.dart';
import 'package:mtsv4/presentation/global_controller.dart';
import 'top_market_detail.dart';
import 'top_trading_page.dart';

class MarketTab extends StatefulWidget {
  const MarketTab({super.key});

  @override
  State<MarketTab> createState() => _MarketTabState();
}

// enum StockExchangeEnum { HSX, HNX, UPC }

class _MarketTabState extends State<MarketTab> {
  List<Widget> indexNames = <Widget>[
    const Text('HSX'),
    const Text('HNX'),
    const Text('UPC'),
  ];

  // StockExchangeEnum stockEnum = StockExchangeEnum.HSX;
  TopMarketDetail topMarketDetail = const TopMarketDetail('HSX');

  @override
  Widget build(BuildContext context) {
    final GlobalService _g = Get.find();
    return Column(
      children: [
        SegmentedButton(
          style: SegmentedButton.styleFrom(
            selectedBackgroundColor: Colors.red,
            selectedForegroundColor: Colors.greenAccent,
            foregroundColor: Colors.pink,
          ),
          segments: const <ButtonSegment<String>>[
            ButtonSegment<String>(
                value: 'HSX',
                label: Text('HSX'),
                icon: Icon(Icons.calendar_view_day)),
            ButtonSegment<String>(
                value: 'HNX',
                label: Text('HNX'),
                icon: Icon(Icons.calendar_view_week)),
            ButtonSegment<String>(
                value: 'UPC',
                label: Text('UPC'),
                icon: Icon(Icons.calendar_view_month)),
          ],
          selected: <String>{_g.currentExchange.value},
          onSelectionChanged: (Set<String> newSelection) {
            setState(() {
              if (_g.currentExchange.value != newSelection.first) {
                // UNSUB currentExchange

                // SUB new currentExchange
                _g.currentExchange.value = newSelection.first;
       
                print('MarketTab onSelectionChanged: ${newSelection.first}');
              }
            });
          },
        ),
        Flexible(child: TopTradingPage())
      ],
    );
  }
}

// class _MarketTabState extends State<MarketTab> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//           appBar: AppBar(
//             centerTitle: true,
//             bottom: PreferredSize(
//                 preferredSize: const Size.fromHeight(0),
//                 child: TabBar(isScrollable: false, tabs: const [
//                   Tab(
//                     child: Text('HSX'),
//                   ),
//                   Tab(
//                     child: Text('HNX'),
//                   ),
//                   Tab(
//                     child: Text('UPC'),
//                   ),
//                 ])),
//           ),
//           body: TabBarView(
//             children: <Widget>[
//               const TopMarketDetail('HSX'),
//               const TopMarketDetail('HNX'),
//               const TopMarketDetail('UPC'),
//             ],
//           )),
//     );
//   }
// }
