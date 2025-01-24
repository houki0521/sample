import 'package:flutter/material.dart';
import 'models/store_data.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
class Store_ScreensPage extends StatefulWidget {
  final StoreData store;
  const Store_ScreensPage({Key? key, required this.store}) : super(key: key);

  @override
  State<Store_ScreensPage> createState() => _Store_ScreensPageState();
}

class _Store_ScreensPageState extends State<Store_ScreensPage> {
  final List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    markers.add(
      Marker(
        width: 30.0,
        height: 30.0,
        point: LatLng(35.658034, 139.701636), // 初期位置のマーカー、渋谷駅
        child: GestureDetector(
          child: const Icon(
            Icons.location_on,
            color: Colors.red,
            size: 50,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.store.storeName ?? '店舗名がありません'), // storeから店名を表示
      ),
      body: SingleChildScrollView(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 店舗の画像 
            Column(
              children: List.generate(widget.store.storeImages.length, (index) {
                final image = widget.store.storeImages[index];
                return Column(
                  children: [
                    Image.network(image)
                  ],
                );
              }),
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
                    Image.network(image),
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
                    Image.network(image),
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
                    Image.network(image),
                    Text(text)
                  ],
                );
              }),
            ),
            const SizedBox(height: 10),
            Text('ドリンク'),
            Column(
              children: List.generate(widget.store.drinkImages.length, (index) {
                final image = widget.store.drinkImages[index];
                final text = widget.store.drinkText.length > index ? widget.store.drinkText[index] : 'No Text'; // 安全にアクセス
                return Column(
                  children: [
                    Image.network(image), // 対応する画像
                    Text(text),  // 対応するテキスト
                  ],
                );
              }),
            ),
            Text('口コミ'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 200,
                child: FlutterMap(
                  options: const MapOptions(
                    initialZoom: 16.0,
                    maxZoom: 20.0,
                    minZoom: 12.0,
                    initialCenter: LatLng(35.658034, 139.701636), // 地図の初期位置
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    ),
                    MarkerLayer(
                      markers: markers, // マーカーを表示
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
