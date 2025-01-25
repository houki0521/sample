import 'package:flutter/material.dart';
import 'Store_Screens.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'models/store_data.dart';
import 'package:auto_route/auto_route.dart';
import 'menu_Reviewer.dart';
import 'menu_abouttheapp.dart';

class Hysteresis extends StatefulWidget {
  const Hysteresis({super.key, required this.title});
  final String title;

  @override
  State<Hysteresis> createState() => _HysteresPageState();
}

@RoutePage()
class _HysteresPageState extends State<Hysteresis> {
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
            hintText: '保存したお店から検索',
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
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 40, 0, 30),
            child: Center(child: Text('''お店が保存されていません、
ホームで保存してからご利用ください''', textAlign: TextAlign.center,style: TextStyle(fontSize: 18),)),
          ),
          Container(
            height: 5,
            width: 300,
            color: Colors.orange,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft, // 左寄せにする
              child: Text(
                'おすすめのお店を保存しませんか？',
                textAlign: TextAlign.left,
              ),
            ),
          ),


          Expanded(
            child: ListView.builder(
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
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
          ),
        ],
      ),
    );
  }
}