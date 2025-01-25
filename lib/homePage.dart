import 'package:flutter/material.dart';
import 'package:sample/lists.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Store_Screens.dart';
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

  