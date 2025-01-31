import 'package:flutter/material.dart';
import 'Store_Screens.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'models/store_data.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'menu_Reviewer.dart';
import 'menu_abouttheapp.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

@RoutePage()
class _MyHomePageState extends State<MyHomePage> {
  final supabase = Supabase.instance.client;
  final TextEditingController searchController = TextEditingController();
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
      .select('*');
    print('取得したデータ: $response');
    // 取得したデータを StoreData クラスに変換
    final storesList = (response as List<dynamic>)
        .map((storeJson) => StoreData.fromJson(storeJson)).toList()
        .toList();
    setState(() {
      // リストをセット状態で更新
      stores = storesList;
    });

  } catch (e) {
    print('取得時にエラーが発生しました: ${e.toString()}');
  }
}

Future<void> searchStores(String query) async {
    try {
      final response = await supabase
          .from('stores')
          .select()
          .ilike('storeName', '%$query%'); // storeName を部分一致で検索

      final filteredStores = (response as List<dynamic>)
          .map((storeJson) => StoreData.fromJson(storeJson))
          .toList();

      setState(() {
        stores = filteredStores; // 検索結果を更新
      });
    } catch (e) {
      print('検索エラー: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.search, color: Colors.black),
            const SizedBox(width: 7),
            Expanded(
              child: TextField(
                controller: searchController,
                style: const TextStyle(fontSize: 16, color: Colors.black),
                decoration: const InputDecoration(
                  hintText: 'お店を検索',
                  filled: true,
                  fillColor: Color.fromARGB(124, 176, 176, 176),
                  border: InputBorder.none,
                ),
                onSubmitted: (query) {
                  searchStores(query); // 検索を実行
                },
              ),
            ),
          ],
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuReviewer(),)
                );
              },
              title: Text('レビュアーを探す'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MenuAbouttheapp(),)
                );
              },
              title: Text('このアプリについて'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {},
              title: Text('ヘルプ・お問い合わせ'),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
            ListTile(
              onTap: () {},
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
                      return Image.network(store.storeImages[index]);
                    })
                  ),
                  Text(store.prText),
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