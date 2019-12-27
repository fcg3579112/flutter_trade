import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/markets_page.dart';
import '../pages/search_page.dart';
import '../pages/my_page.dart';
import '../pages/trade_page.dart';

class TabNavigater extends StatefulWidget {
  @override
  _TabNavigaterState createState() => _TabNavigaterState();
}

class _TabNavigaterState extends State<TabNavigater> {
  static List<Item> items = [
    Item('市场', Icon(Icons.shopping_cart), MarketsPage()),
    Item('发现', Icon(Icons.search), SearchPage()),
    Item('交易', Icon(Icons.memory), TradePage()),
    Item('我的', Icon(Icons.person), MyPage()),
  ];
  final tabs = items
      .map((f) => BottomNavigationBarItem(title: Text(f.title), icon: f.icon))
      .toList();
  final CupertinoTabController _controller = CupertinoTabController();
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: tabs,
      ),
      controller: _controller,
      tabBuilder: (context, index) {
        return CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            middle: Text(
              items[index].title,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.green,
          ),
          child: items[index].page,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class Item {
  final String title;
  final Icon icon;
  final Widget page;
  Item(this.title, this.icon, this.page);
}
