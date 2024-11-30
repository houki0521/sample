import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<Marker> markers = [];
  // 入力された値を保存するコントローラー
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // マーカーを初期化（`context`を使用しない範囲で行う）
    markers.add(
      Marker(
        width: 30.0,
        height: 30.0,
        point: LatLng(35.658034, 139.701636), // 初期位置のマーカー、渋谷駅
        child: GestureDetector(

          // ダイアログを表示
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                titlePadding: EdgeInsets.only(top: .0),
                title: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0), // 左上を丸める
                    topRight: Radius.circular(10.0), // 右上を丸める
                  ),
                  child: Image.asset(
                    'assets/images/IMG_8718.jpg',
                    height: 200, 
                    fit: BoxFit.cover, // 写真が周りに目一杯広がるようにする
                  ),
                ),
                content: const Column(
                  mainAxisSize: MainAxisSize.min, // 必要な分だけスペースを確保
                  crossAxisAlignment: CrossAxisAlignment.start, // 左揃え
                  children: [
                    Text('店名',//ここに表示する店名や情報はデータベースができてから
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10), // 余白
                    Text(
                      'お店の情報: ここに説明文が入ります。例えば営業時間や所在地などを記載します。',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                
                actions: <Widget>[
                  ElevatedButton(
                    child: const Text('Close'),
                    style: ElevatedButton.styleFrom(shadowColor: Colors.black),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          },
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
        backgroundColor: Colors.white,
        title: const Text('Map'),
      ),
      body: Stack(
        children: [
          // 背景にマップを配置
          FlutterMap(
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

          // サーチバーを配置
          Positioned(top: 10,left: 10, right: 10, 
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: const SearchBar(
                hintText: 'お店を検索',
                leading: Icon(Icons.search), // 左側のアイコン
              ),
            ),
          ),
        ],
      ),
    );
  }
}