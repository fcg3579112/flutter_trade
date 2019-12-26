import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../page/markets.dart';
import '../page/trade.dart';
import '../page/me.dart';
import '../page/discover.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  static List<Item> items = [
    Item('市场', Icon(Icons.shopping_cart), MarketsPage()),
    Item('发现', Icon(Icons.search), DiscoverPage()),
    Item('交易', Icon(Icons.memory), TradePage()),
    Item('我的', Icon(Icons.person), MePage()),
  ];
  final tabs = items
      .map((f) => BottomNavigationBarItem(title: Text(f.title), icon: f.icon))
      .toList();
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabs,
      ),
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(items[index].title),
            backgroundColor: Colors.green,
          ),
          child: items[index].page,
        );
      },
    );
  }
}

class Item {
  final String title;
  final Icon icon;
  final Widget page;
  Item(this.title, this.icon, this.page);
}
