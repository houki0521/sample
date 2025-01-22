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
        mainAxisSize: MainAxisSize.min,
        children: [
          // Expanded(
          //   child: GridView.builder(
          //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 1,
          //       crossAxisSpacing: 10.0,
          //       mainAxisSpacing: 10.0,
          //     ),
          //     itemCount: widget.store.storeImages.length,
          //     itemBuilder: (context, index) {
          //       return Image.network(widget.store.storeImages[index]);
          //     },
          //   ),
          // ),
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
        ],
      ),
    );
  }
}
