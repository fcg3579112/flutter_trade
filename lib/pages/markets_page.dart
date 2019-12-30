import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'market_bj_page.dart';
import 'market_sh_page.dart';
import 'market_sz_page.dart';
import 'watch_list_page.dart';

class MarketsPage extends StatefulWidget {
  @override
  _MarketsPageState createState() => _MarketsPageState();
}

class _MarketsPageState extends State<MarketsPage>
    with SingleTickerProviderStateMixin {
  final List<Widget> children = [
    WatchListPage(),
    MarketSZPage(),
    MarketSHPage(),
    MarketBJPage(),
  ];
  static List<String> titles = ['自选列表', '上证指数', '深圳指数', '创业指数'];
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: children.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 40,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              labelColor: Colors.red,
              labelPadding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              unselectedLabelColor: Colors.black45,
              indicatorColor: Colors.red,
              indicator: UnderlineTabIndicator(
                  insets: EdgeInsets.fromLTRB(15, 0, 15, 0),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 3,
                    style: BorderStyle.solid,
                  )),
              tabs: titles
                  .map((f) => Tab(
                        text: f,
                      ))
                  .toList(),
            ),
          ),
          Flexible(
            child: TabBarView(
              controller: _tabController,
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
