import 'package:flutter/material.dart';

class Store_ScreensPage extends StatefulWidget {
  const Store_ScreensPage({super.key, required this.store});
  final Map<String, String> store;

  @override
  State<Store_ScreensPage> createState() => _Store_ScreensPage();
}

class _Store_ScreensPage extends State<Store_ScreensPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.store['name'] ?? '店舗名がありません')
      ),
      body: Column(
        children: <Widget>[
          // 店舗の画像
          Image.asset(
          widget.store['image'] ?? '画像がありません',
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          ),
          Text(widget.store['details'] ?? '説明がありません')
        ],
      ),
    );
  }
}