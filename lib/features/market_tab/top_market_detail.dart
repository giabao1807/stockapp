import 'package:flutter/material.dart';

class TopMarketDetail extends StatefulWidget {
  final String _sExchange;

  const TopMarketDetail(
    this._sExchange,
  );

  @override
  State<StatefulWidget> createState() => TopMarketDetailState();
}

class TopMarketDetailState extends State<TopMarketDetail> {
  List<Widget> indexNames = <Widget>[
    const Text('HSX'),
    const Text('HNX'),
    const Text('UPC'),
  ];
  List<bool> isSelected = [true, false, false];

  void setExchange(String newExchange) {
    if (widget._sExchange != newExchange) {
      // Unsub: _sExchange
      // Sub: newExchange
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      // decoration: new BoxDecoration(color: Colors.greenAccent),
      child: new Column(
        children: [
          Text(widget._sExchange),
          // ToggleButtons(
          //     // list of booleans
          //     isSelected: isSelected,
          //     // text color of selected toggle
          //     selectedColor: Colors.white,
          //     // text color of not selected toggle
          //     color: Colors.blue,
          //     // fill color of selected toggle
          //     fillColor: Colors.lightBlue.shade900,
          //     // when pressed, splash color is seen
          //     splashColor: Colors.red,
          //     // long press to identify highlight color
          //     highlightColor: Colors.orange,
          //     // if consistency is needed for all text style
          //     textStyle: const TextStyle(fontWeight: FontWeight.bold),
          //     // border properties for each toggle
          //     renderBorder: true,
          //     borderColor: Colors.black,
          //     borderWidth: 1.5,
          //     borderRadius: BorderRadius.circular(10),
          //     selectedBorderColor: Colors.pink,
          //     // add widgets for which the users need to toggle
          //     children: indexNames,
          //     // to select or deselect when pressed
          //     onPressed: (int newIndex) {}
          // )
        ],
      ),
    );
  }
}
