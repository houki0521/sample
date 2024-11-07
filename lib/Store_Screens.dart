// import 'package:flutter/material.dart';



// class Store_ScreensPage extends StatefulWidget {
//   final Map<String, String> store;
//   const Store_ScreensPage({super.key, required this.store});
  

//   @override
//   State<Store_ScreensPage> createState() => _Store_ScreensPageState();
// }

// class _Store_ScreensPageState extends State<Store_ScreensPage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.store['name'] ?? '店舗名がありません'), // storeから店名を表示
//       ),
//       body: Column(
//         children: [
//           // 店舗の画像
//           widget.store['image'] != null
//               ? Image.asset(
//                   widget.store['image']!, // 画像パスがnullでない場合、画像を表示
//                   width: double.infinity,
//                   height: 200,
//                   fit: BoxFit.cover,
//                 )
//               : SizedBox(
//                   height: 200,
//                   child: Center(child: Text('画像がありません')), // 画像がない場合のフォールバック
//                 ),
//           // 店舗の説明
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               widget.store['details']?.isNotEmpty == true
//                   ? widget.store['details']!
//                   : '詳細情報がありません', // detailsが空文字やnullの場合
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }