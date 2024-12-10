import 'package:flutter/material.dart';
import 'Store_Screens.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, dynamic>> stores = [
    {
      'name': 'しんぱち食堂',
      'image': [
        'assets/images/IMG_8718.jpg',
        'assets/images/IMG_0823.jpg',
        'assets/images/IMG_8731.jpg',
      ],
      'description': '渋谷駅徒歩6~7分の定食屋。朝食・モーニングあり。',
      'details': '定食なら大盛りでも1200円以内!!!',
      'isBookmarked': false, // 初期状態
      'star': 3.5, //星評価の平均値を代入します
      'price': '¥700〜¥1500',
      'hours': '7:00 ~ 23:00 / 年中無休',
      'address': '東京都新宿区西新宿1-15-9  KCビル1階',
    },
    {
      'name': 'そこら辺食堂',
      'image': [
        'assets/images/IMG_8718.jpg',
        'assets/images/IMG_0823.jpg',
        'assets/images/IMG_8731.jpg',
      ],
      'description': '恵比寿駅徒歩4分の定食屋。朝食・モーニングあり。',
      'details': '定食なら大盛りでも\n2000円以内!!!',
      'isBookmarked': false, // 初期状態
      'star': 3.0,
      'price': '¥1000〜¥2000',
      'hours': '9:30 ~ 22:30 / 年中無休',
    },
    {
      'name': '辺境の地食堂',
      'image': [
        'assets/images/IMG_8718.jpg',
        'assets/images/IMG_0823.jpg',
        'assets/images/IMG_8731.jpg',
      ],
      'description': '澁谷駅徒歩560分の定食屋。辺鄙な地にあるため暖かな食事をご用意しております',
      'details': '定食なら大盛りでも\n4000円以内!!!',
      'isBookmarked': false, // 初期状態
      'star': 1.3,
      'price': '¥1000〜¥4000',
      'hours': '11:00 ~ 20:00 / 土日祝日休み',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 220, 183),
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
        itemCount: stores.length,
        itemBuilder: (context, index) {
          final store = stores[index]; // 各店舗データを取得

          return Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // 店舗名
                  Text(
                    store['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8), // テキストとアイコンの間に余白を入れる

                  // ブックマークアイコン
                  IconButton(
                    icon: Icon(
                      store['isBookmarked']
                          ? Icons.bookmark
                          : Icons.bookmark_border,
                      color: store['isBookmarked'] ? const Color.fromARGB(255, 255, 209, 2) : Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        //押した時の動作
                        store['isBookmarked'] = !store['isBookmarked'];
                      });
                    },
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // 店舗の画像
                  Image.asset(
                    store['image'].first,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 10),
                  // 店の説明
                  store['description'] == null || store['description']!.isEmpty
                  ? const SizedBox.shrink() // 高さ0の空のウィジェット
                  : Text(store['description']!),
                  SizedBox(height: 10),

                  //店の星評価
                  Row(
                    children: [
                      RatingBar.builder(
                        initialRating: store['star'],
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
                      Text(store['star'].toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 23),)
                    ],
                  ),
                  
                  Row(
                    children: [
                      Icon(Icons.paid,color: Color.fromARGB(255, 232, 190, 1)),
                      Text(store['price']),
                      SizedBox(width: 11),
                      Icon(Icons.schedule,color: const Color.fromARGB(255, 229, 198, 57)),
                      Text(store['hours']),
                    ],
                  ),

                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Store_ScreensPage(
                      store: store,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
