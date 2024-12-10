import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
//import 'package:carousel_slider/carousel_slider.dart';

class Store_ScreensPage extends StatefulWidget {
  const Store_ScreensPage({super.key, required this.store});
  final Map<String, dynamic> store;

  @override
  State<Store_ScreensPage> createState() => _Store_ScreensPage();
}

class _Store_ScreensPage extends State<Store_ScreensPage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.store['name'] ?? '店舗名がありません')
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // 画像のスライダー（CarouselSlider）
          // CarouselSlider.builder(
          //   options: CarouselOptions(
          //     height: 200,
          //     initialPage: 0,
          //     viewportFraction: 1,
          //     enlargeCenterPage: true,
          //     autoPlay: true,  // 自動スライドを有効にする
          //     autoPlayInterval: const Duration(seconds: 3), // スライド間のインターバル
          //     autoPlayAnimationDuration: const Duration(milliseconds: 800), // アニメーションの速度
          //     onPageChanged: (index, reason) {
          //       setState(() {
          //         activeIndex = index;
          //       });
          //     },
          //   ),
          //   itemCount: widget.store['image'].length, // 画像の数
          //   itemBuilder: (context, index, realIndex) {
          //     final path = widget.store['image'][index]; // 画像リストを取得
          //     return buildImage(path); // 画像を表示
          //   },
          // ),
          // 他のコンテンツ（店舗名、詳細など）
          Image.asset(
            widget.store['image'].first,
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // アイコンボタン（ブックマーク）
                    IconButton(
                      icon: Icon(
                        widget.store['isBookmarked'] == true
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: widget.store['isBookmarked'] == true
                            ? const Color.fromARGB(255, 255, 209, 2)
                            : Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          widget.store['isBookmarked'] = !(widget.store['isBookmarked'] ?? false);
                        });
                      },
                    ),
                  ],
                ),
                Text(
                  widget.store['name']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: widget.store['star'],
                      itemSize: 25,
                      allowHalfRating: true,
                      ignoreGestures: true,
                      itemBuilder: (context, index) => const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 255, 188, 2),
                      ),
                      onRatingUpdate: (rating) {
                        // 評価が更新されたときの処理
                      },
                    ),
                    SizedBox(width: 5),
                    Text(widget.store['star'].toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color: Colors.red))
                  ],
                ),
                Text(widget.store['details'] ?? '説明がありません'),
                Text(widget.store['price'] ?? '説明がありません'),
                Text(widget.store['hours'] ?? '説明がありません'),
                
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 画像表示用のウィジェット
  Widget buildImage(String path) => Container(
    margin: const EdgeInsets.symmetric(horizontal: 5),
    child: Image.asset(
      path,
      fit: BoxFit.cover,
    ),
  );
}
