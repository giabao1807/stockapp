import 'package:flutter/material.dart';
import 'package:mtsv4/features/market_tab/stock_list.dart';

class MarketTabbar extends StatefulWidget {
  const MarketTabbar({super.key});

  @override
  State<MarketTabbar> createState() => _MarketTabbarState();
}

class _MarketTabbarState extends State<MarketTabbar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        if (!_tabController.indexIsChanging) {
          int tabIndex = _tabController.index;
          print("Current tab: $tabIndex ");
        } else {}
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SafeArea(
          child: Container(
            color: Colors.blue,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(icon: Icon(Icons.home), text: "Top GTGD"),
                Tab(icon: Icon(Icons.search), text: "TOP KLGD"),
                Tab(icon: Icon(Icons.person), text: "Top Tăng Giá"),
                Tab(icon: Icon(Icons.person), text: "Top Giảm Giá"),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              Center(child: StockList()),
              Center(child: Text("Profile Tab Content")),
              Center(child: Text("Profile Tab Content")),
              Center(child: Text("Profile Tab Content")),
            ],
          ),
        ),
      ],
    );
  }
}
