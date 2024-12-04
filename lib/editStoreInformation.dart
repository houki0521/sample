import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart' as Path;


class EditStoreInformation extends StatefulWidget {
  const EditStoreInformation({super.key});

  @override
  State<EditStoreInformation> createState() => _EditStoreInformationState();
}

class _EditStoreInformationState extends State<EditStoreInformation> {
  var _prEditingText = '';
  var _featureText = '';
  var _fastidiousnessText = '';
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        title: const Text('店舗ページ編集'),
        ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child:  SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                children: [
                  Container(
                    width: 5,
                    height: 20,
                    color: Colors.orange,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: _screenSize.width * 0.010),
                    child: const Text(
                      '店舗ページTOP',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
                ],
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                'PR文',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 3,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  enabled: _prEditingText.length <= 200,
                  decoration: InputDecoration(
                  hintText: '例 厳選食材を生かした創作フレンチとワインが楽しめる女子会におすすめ！',
                  counterText: '${_prEditingText.length} / 200',
                  errorText: _prEditingText.length > 200 ? 'これ以上記入できません' : null,
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                        ),
                      ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // エラー時の枠線
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // フォーカス時にエラーがある場合の枠線
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _prEditingText = value;
                      });
                    },
                  ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                '特長',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              Container(
                child: TextFormField(
                  maxLines: 6,
                  minLines: 6,
                  keyboardType: TextInputType.multiline,
                  enabled: _featureText.length <= 200,
                  decoration: InputDecoration(
                  hintText: '例 厳選食材を生かした創作フレンチとワインが楽しめる女子会におすすめ！',
                  counterText: '${_featureText.length} / 200',
                  errorText: _featureText.length > 200 ? 'これ以上記入できません' : null,
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                        ),
                      ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // エラー時の枠線
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // フォーカス時にエラーがある場合の枠線
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _featureText = value;
                      });
                    },
                  ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              const Text(
                'お店のこだわり',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),

              Container(
                child: TextFormField(
                  maxLines: 3,
                  minLines: 3,
                  keyboardType: TextInputType.multiline,
                  enabled: _fastidiousnessText.length <= 200,
                  decoration: InputDecoration(
                  hintText: '例 厳選食材を生かした創作フレンチとワインが楽しめる女子会におすすめ！',
                  counterText: '${_fastidiousnessText.length} / 200',
                  errorText: _fastidiousnessText.length > 200 ? 'これ以上記入できません' : null,
                  errorStyle: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(0),
                      borderSide: const BorderSide(
                        width: 1,
                        color: Colors.black,
                        ),
                      ),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // エラー時の枠線
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                        borderSide: BorderSide(width: 1, color: Colors.red), // フォーカス時にエラーがある場合の枠線
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _fastidiousnessText = value;
                      });
                    },
                  ),
              ),
              ElevatedButton(
                onPressed: (){
                  selectImage();
                },
                child: Text('Select or Take a Photo'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> selectImage() async {
  final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);

  if (selectedImage != null) {
    // 画像が選択された場合の処理を書く
    // 例えば、選択した画像のパスを表示する
    print('Selected image path: ${selectedImage.path}');
  } else {
    // 画像が選択されなかった場合の処理を書く
    // 例えば、エラーメッセージを表示する
    print('No image selected.');
  }
}

  Future<void> uploadImage() async {
  final ImagePicker _picker = ImagePicker();

  // ユーザーに画像を選択させる
  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

  if (image == null) {
    // 画像が選択されなかった場合
    print('No image selected.');
    return;
  }

  try {
    // ファイルパスからファイル名を取得
    final fileName = Path.basename(image.path);

    // Firebase Storage にアップロード
    await FirebaseStorage.instance
        .ref('images/$fileName') // 保存先のパス
        .putFile(File(image.path)); // ファイルをアップロード

    print('Image uploaded successfully.');
  } catch (e) {
    print('Failed to upload image: $e');
  }
}
}