import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Add_photImage extends StatefulWidget {
  const Add_photImage({super.key});

  @override
  State<Add_photImage> createState() => _Add_photImageState();
}

class _Add_photImageState extends State<Add_photImage> {
  final ImagePicker _picker = ImagePicker();
  final SupabaseClient supabase = Supabase.instance.client;
  List<File> officialPhotoImage = [];
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    getImageFromGarally(officialPhotoImage);    
  }
  // ギャラリーから写真を取得するメソッド
  Future getImageFromGarally(List<File> list) async {
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();
    setState(() {
      if (pickedFiles != null) {
        for (var pickedFile in pickedFiles) {
          list.add(File(pickedFile.path)); // 各 XFile の path を取得して File に変換
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('写真を追加'),),
      body: Column(
        children: [
          Expanded(
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ...officialPhotoImage.map((image) {
                  int index = officialPhotoImage.indexOf(image);
                  return Stack(
                    children: [
                      Image.file(image, width: 100, height: 100, fit: BoxFit.cover),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            officialPhotoImage.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.close, color: Colors.white)
                      )
                    ],
                  );
                }).toList(),
                TextButton.icon(
                  onPressed: () {
                    getImageFromGarally(officialPhotoImage);
                  },
                  label: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(5),
                    child: const SizedBox(
                      width: 100,
                      height: 100,
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Icon(
                            Icons.add_a_photo_outlined,
                            size: 30,
                            color: Colors.grey,
                          ), 
                          SizedBox(height: 20),
                          Text('写真を追加')
                        ],
                      ),
                    ),
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // ボタンの内側の余白を無くす
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 50),
            child: Row(
              children: [
                Checkbox(
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!; // チェックボックスに渡す値を更新する
                    });
                  }
                ),
                Text(isChecked ? '公式' : '非公式')
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            margin: EdgeInsets.only(bottom: 50),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,  // 背景色
                foregroundColor: Colors.white,  // 文字色
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),  // 丸みをつける
                ),
              ),
              child: Text('写真を追加')
            )
          )
        ],
      ),
    );
  }
  Future<String> uploadFile(File file, String path) async {
    try {
      // ファイルをアップロード
      final response = await supabase.storage.from('storeData').upload(
        path,
        file,
        fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
      );
      return response; // アップロードされたファイルのパス    
    } catch (e) {
      print('Error uploading file: $e');
      throw Exception('Failed to upload file: $e');
    }
  }
  Future<void> _saveData(BuildContext context) async {
    final session = supabase.auth.currentSession; // 現在のセッション
    final user = session?.user; // ユーザー情報
    List<Map<String, dynamic>> storesDataList = [];
    for (int i = 0; i < officialPhotoImage.length; i++) {
      if (officialPhotoImage.isEmpty) {
        continue; // 空のリストはスキップする
      }
      // ファイルを指定
      final file = officialPhotoImage[i];
      // ファイル名を指定
      final fileName = 'photo image official${DateTime.now().millisecondsSinceEpoch}_$i.jpg';
      // pathを指定
      final String path = 'private/${user?.id}/$fileName';
      // ファイルをアップロード
      await uploadFile(file, path);
      // 公開URLを取得
      final String publicUrl = await supabase
        .storage
        .from('storeData')
        .getPublicUrl(path);

      storesDataList.add({
        'images': [publicUrl]
      });
    }
    Map<String, dynamic> storeData = {
      'officialPhotoImage': officialPhotoImage
    };
    // await supabase
    //   .from('stores')
    //   .update({'officialPhotoImage': storeData })
    //   .eq('id', id);
  }
}