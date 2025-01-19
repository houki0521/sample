import 'package:flutter/material.dart';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'models/store_data.dart';
import 'wordOfMouth.dart';

class AddPhoto extends StatefulWidget {
  const AddPhoto({super.key});

  @override
  State<AddPhoto> createState() => _AddPhotoState();
}

class _AddPhotoState extends State<AddPhoto> {
  
  final supabase = Supabase.instance.client;
  List<StoreData>? stores;
  void initState() {
    super.initState();
    _getAllData();
  }


   Future<void> _getAllData() async {
  final session = supabase.auth.currentSession; // 現在のセッション
  final user = session?.user; // ユーザー情報
  try {
    // データベース取得
    final response = await supabase
      .from('stores')
      .select();
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
      appBar: AppBar(title: Text('投稿するお店を選ぶ'),),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: stores?.length ?? 0,
                  itemBuilder: ((context, index) {
                    final store = stores![index];
                    return Card(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WordOfMouth(store: store,)),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            store.storeName,
                            textAlign: TextAlign.center,
                            ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
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
                            ],
                          ),
                        ),
                      ),
                    );
                  })
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}