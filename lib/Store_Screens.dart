import 'package:flutter/material.dart';
import 'models/store_data.dart';
class Store_ScreensPage extends StatefulWidget {
  final StoreData store;
  const Store_ScreensPage({Key? key, required this.store}) : super(key: key);

  @override
  State<Store_ScreensPage> createState() => _Store_ScreensPageState();
}

class _Store_ScreensPageState extends State<Store_ScreensPage> {

  @override
  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.store.storeName ?? '店舗名がありません'), // storeから店名を表示
      ),
      body: Column(
        children: [
          // 店舗の画像
          widget.store.storeImages != null
          ? Image.network(
            widget.store.storeImages.toString(),
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          )
          : SizedBox(
              height: 200,
              child: Center(child: Text('画像がありません')), // 画像がない場合のフォールバック
          ),
          // 店舗の説明
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(widget.store.prText),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(widget.store.featureText),
          ),
          Container(
            padding: EdgeInsets.only(top: 10, bottom: 10),
            child: Text(widget.store.commitment),
          ),
          Column(
            children: List.generate(widget.store.seatImages.length, (index) {
              final image = widget.store.seatImages[index];
              final text = widget.store.seatText[index]?? 'テキストがありません';
              return Column(
                children: [
                  Text(image),
                  Text(text)
                ],
              );
            }),
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(widget.store.coursImages.length, (index) {
              final image = widget.store.coursImages[index];
              final text = widget.store.coursText[index]?? 'テキストがありません';
              return Column(
                children: [
                  Text(image),
                  Text(text)
                ],
              );
            }),
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(widget.store.menuImages.length, (index) {
              final image = widget.store.menuImages[index];
              final text = widget.store.menuText[index]?? 'テキストがありません';
              return Column(
                children: [
                  Text(image),
                  Text(text)
                ],
              );
            }),
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(widget.store.drinkImages.length, (index) {
              final image = widget.store.drinkImages[index];
              final text = widget.store.drinkText.length > index ? widget.store.drinkText[index] : 'No Text'; // 安全にアクセス
              return Column(
                children: [
                  Text(image), // 対応する画像
                  Text(text),  // 対応するテキスト
                ],
              );
            }),
          )
        ],
      ),
    );
  }
}
