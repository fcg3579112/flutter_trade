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

class _MarketsPageState extends State<MarketsPage> {
  final List<Widget> children = [
    WatchListPage(),
    MarketSZPage(),
    MarketSHPage(),
    MarketBJPage(),
  ];
  static List<String> titles = ['自选', '上证', '深圳', '创业'];
  final List<Widget> texts = titles.map((f) => Text(f)).toList();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: children.length,
      child: Scaffold(
        body: Container(
          child: Column(
            children: <Widget>[
              TabBar(
                isScrollable: true,
                tabs: texts,
              ),
              TabBarView(
                children: children,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
