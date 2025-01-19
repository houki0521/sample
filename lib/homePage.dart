import 'package:flutter/material.dart';
import 'Store_Screens.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'models/store_data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io';
import 'package:auto_route/auto_route.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

@RoutePage()
class _MyHomePageState extends State<MyHomePage> {
  final supabase = Supabase.instance.client;
  List<StoreData>? stores;


  @override
  void initState() {
    super.initState();
    _getAllData(); // データを初期化時に取得
  }
  
 Future<void> _getAllData() async {
  final session = supabase.auth.currentSession; // 現在のセッション
  final user = session?.user; // ユーザー情報
  try {
    // データベース取得
    final response = await supabase
      .from('stores')
      .select();
    // print('取得したデータ: $response');
    // 取得したデータを StoreData クラスに変換
    final storesList = (response as List<dynamic>)
        .map((storeJson) => StoreData.fromJson(storeJson)).toList()
        .toList();
    setState(() {
      // リストをセット状態で更新
      stores = storesList;
    });
  } catch (e) {
    print('エラーが発生しました: ${e.toString()}');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextField(
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: 'お店を検索',
          ),
        ),
      ),
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.fromLTRB(2, 4, 2, 4),
          children: [
            const DrawerHeader(
              child: Text('メニュー'),
            ),
            ListTile(
              title: Text('レビュアーを探す'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('このアプリについて'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('ヘルプ・お問い合わせ'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              title: Text('利用規約'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: stores?.length ?? 0,
        itemBuilder: ((context, index) {
          final store = stores![index];
          return Card(
            child: ListTile(
              title: Text(store.storeName),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1, // カラム数
                      crossAxisSpacing: 0, // カラム間のスペース
                      mainAxisSpacing: 0, // 行間のスペース
                    ),
                    itemCount: store.storeImages.length,
                    itemBuilder: ((context, index) {
                      return AspectRatio(
                        aspectRatio: 20/16,
                        child: Image.file(File(store.storeImages[index]))
                      );
                    })
                  ),
                  Text(store.prText),
                   //店の星評価
                  Row(
                    children: [
                      RatingBar.builder(
                        // initialRating: !store['star'],
                        itemSize: 25,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: Color.fromARGB(255, 255, 188, 2),
                        ),
                        onRatingUpdate: (rating) {
                          //評価が更新されたときの処理を書く
                        },
                      ),
                      SizedBox(width: 5),
                      // Text(store['star'].toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Store_ScreensPage(store: store)),
                );
              },
            ),
          );
        })
      ),
    );
  }
}