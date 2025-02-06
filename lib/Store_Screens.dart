import 'dart:io';
import 'package:flutter/material.dart';
import 'models/store_data.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'add_phot_Image.dart';
import 'models/wordOfMouthData.dart';


class Store_ScreensPage extends StatefulWidget {
  final StoreData store;
  const Store_ScreensPage({Key? key, required this.store}) : super(key: key);

  @override
  State<Store_ScreensPage> createState() => _Store_ScreensPageState();
}

class _Store_ScreensPageState extends State<Store_ScreensPage> {
  final List<Marker> markers = [];
  final SupabaseClient supabase = Supabase.instance.client;
  List<WordOfMouthData>? wordOfMouthDatas;
  List<dynamic>? storeDetailsData;

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
    getAllData();
  }

  Future<void> getAllData() async {
  final session = supabase.auth.currentSession; // 現在のセッション
  final user = session?.user; // ユーザー情報
  try {
    // 1. 口コミデータ取得
    final wordOfMouthResponse = await supabase
      .from('wordOfMouthData')
      .select('*');
    
    // 口コミデータをWordOfMouthDataクラスに変換
    final wordOfMouthList = (wordOfMouthResponse as List<dynamic>)
        .map((storeJson) => WordOfMouthData.fromJson(storeJson))
        .toList();
    
    // 2. 店舗データ取得
    final storeDetailsResponse = await supabase
      .from('storeDetailsData')
      .select('*');
    
    // 店舗データをMapに変換
    final storeDetailsList = (storeDetailsResponse as List<dynamic>)
        .map((storeJson) => storeJson as Map<String, dynamic>)
        .toList();

    setState(() {
      // リストをセット状態で更新
      wordOfMouthDatas = wordOfMouthList;
      storeDetailsData = storeDetailsList;
    });
  } catch (e) {
    print('データ取得時にエラーが発生しました: ${e.toString()}');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.store.storeName ?? '店舗名がありません'), // storeから店名を表示
      ),
      body: SingleChildScrollView(
        child: Column(
            children: [
            // 店舗の画像
            ...List.generate(widget.store.storeImages.length, (index) {
              return Image.network(widget.store.storeImages[index]);
            }),
            // 店舗の説明
            Align(
              alignment: Alignment.topLeft, // Textの配置位置を調整
              child: Text(
                widget.store.prText,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft, // Textの配置位置を調整
              child: Text(widget.store.featureText),
            ),
            Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft, // Textの配置位置を調整
                      child: Text(
                        'お店のこだわり',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.store.fastidiousnessImages.length,
                      itemBuilder: (context, index) {
                        final image = widget.store.fastidiousnessImages[index];
                        final text = widget.store.fastidiousnessText[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                          children: [
                            Image.network(
                              image,
                              width: 150, // 幅を100に指定
                              height: 100, // 高さを100に指定
                              fit: BoxFit.cover,
                            ),
                            SizedBox(height: 8),
                            Text(text)
                          ],
                        ),
                      );
                    })
                  )
                ],
              )
            ),
            Card(
              shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              color: Colors.white,
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: Alignment.topLeft, // Textの配置位置を調整
                      child: Text(
                        '座席',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.store.seatImages.length,
                      itemBuilder: ((context, index) {
                        final image = widget.store.seatImages[index];
                        final text = widget.store.seatText[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            children: [
                              Image.network(
                                image,
                                width: 150, // 幅を100に指定
                                height: 100, // 高さを100に指定
                                fit: BoxFit.cover,
                              ),
                              SizedBox(height: 8),
                              Text(text)
                            ],
                          ),
                        );
                      })
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft, // Textの配置位置を調整
              child: Container(
                width: double.infinity,
                child: Card(
                  shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Align(
                      alignment: Alignment.topLeft, // Textの配置位置を調整
                      child: Text(
                        'コース',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    ),
                    ...List.generate(widget.store.coursImages.length, (index) {
                      final image = widget.store.coursImages[index];
                      final text = widget.store.coursText[index]?? 'テキストがありません';
                      return Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft, // Textの配置位置を調整
                            child: Row(
                              children : [
                                Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  margin: const EdgeInsets.only(top: 10),
                                  child: Image.network(
                                    image,
                                    width: 150, // 幅を100に指定
                                    height: 100, // 高さを100に指定
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 10),
                                SizedBox(width: 10),
                                Text(text,),
                              ]
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      );
                    }),
                  ]
                ),
              ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft, // Textの配置位置を調整
              child: Container(
                width: double.infinity,
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft, // Textの配置位置を調整
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: [
                            Text(
                              '投稿写真',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topLeft, // Textの配置位置を調整
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children: [
                            ...List.generate(widget.store.officialPhotoImage.length, (index) {
                              final image = widget.store.officialPhotoImage[index] ?? '';
                              return Image.network(
                                image,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                                );
                            }),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: wordOfMouthDatas?.length ?? 0,
                              itemBuilder: ((context, index) {
                                final wordOfMouthData = wordOfMouthDatas![index];
                                if (widget.store.storeName == wordOfMouthData.store_name) {
                                  return Wrap(
                                    spacing: 10,
                                    runSpacing: 10,
                                    children: [
                                      ...List.generate(wordOfMouthData.wordOfMouthPhot.length, (index) {
                                        final image = wordOfMouthData.wordOfMouthPhot[index];
                                        return Image.network(
                                          image,
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        );
                                      })
                                    ],
                                  ); 
                                }
                              })
                            ),
                            TextButton.icon(
                              onPressed: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Add_photImage(storeid: widget.store.id),
                                  ),
                                );
                              },
                              label: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(5),
                                child: const SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_a_photo_outlined,
                                        size: 30,
                                        color: Colors.grey,
                                        ), 
                                      SizedBox(height: 20,),
                                      Text('写真を追加'),
                                    ],
                                  ),
                                ),
                              ),
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero, // ボタンの内側の余白を無くす
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.topLeft, // Textの配置位置を調整
              child: Container(
                width: double.infinity,
                child: Card(
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  color: Colors.white,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft, // Textの配置位置を調整
                        child: Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: [
                            Text(
                              '口コミ',
                              style: TextStyle(
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ...List.generate(wordOfMouthDatas!.length, (index) {
                        final wordOfMouthData = wordOfMouthDatas![index];
                        return Text(wordOfMouthData.wordOfMouthText);
                      })
                    ],
                  ),
                ),
              ),
            ),
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
            storeDetailsData == null || storeDetailsData!.isEmpty
              ? Center(child: Text('No data available')) // モデルなしの場合の表示
              : Column(
                children: List.generate(storeDetailsData!.length, (index) {
                  final storeName = storeDetailsData![index]['storeName'] ?? 'No Name'; // nullならデフォルト値
                  final furigana = storeDetailsData![index]['furigana'] ?? 'No Name';
                  if (storeName == widget.store.storeName) {
                    return Column(
                      children: [
                        Text(storeName),
                        Text(furigana)
                      ],
                    );
                  }
                  return Container();
              }),
            ),
          ],
        ),
      )
    );
  }
}
