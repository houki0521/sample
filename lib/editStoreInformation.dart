import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/gestures.dart';
import 'navigation.dart';

class EditStoreInformation extends StatefulWidget {
  const EditStoreInformation({super.key});

  @override
  State<EditStoreInformation> createState() => _EditStoreInformationState();
}

class _EditStoreInformationState extends State<EditStoreInformation> {
  bool _isLoggedIn = false; // ログイン状態を追跡
  final SupabaseClient supabase = Supabase.instance.client;
  var _prEditingText = '';
  var _featureText = '';
  var _fastidiousnessText = '';
  final ImagePicker _picker = ImagePicker();
  List<File> _storesImages = [];
  List<List<File>> _courseImagesList = [];
  List<List<File>> _sheetImagesList = [];
  List<List<File>> _menuImagesList = [];
  List<List<File>> _drinkImagesList = [];
 final TextEditingController _storeName = TextEditingController();
 final TextEditingController _prTextController = TextEditingController();
 final TextEditingController _featureTextController = TextEditingController();
 final TextEditingController _commitmentToTheStoreController = TextEditingController();
 final List<TextEditingController> _seatControllers = [];
 final List<TextEditingController> _courseControllers = [];
 final List<TextEditingController> _cookingControllers = [];
 final List<TextEditingController> _drinkControllers = [];

@override
void initState() {
  super.initState();
  initializeBox();
  _initializeSeatControllers();
  _sheetImagesList.add([]);
  _seatControllers.add(TextEditingController());

  _courseImagesList.add([]);
  _courseControllers.add(TextEditingController());

  _menuImagesList.add([]);
  _cookingControllers.add(TextEditingController());

  _drinkImagesList.add([]);
  _drinkControllers.add(TextEditingController());
}

Future<void> initializeBox() async {

  }




void _initializeSeatControllers() {
    for (int i = 0; i < _sheetImagesList.length; i++) {
      _seatControllers.add(TextEditingController());
    }
    for (int i = 0; i < _courseImagesList.length; i++) {
      _courseControllers.add(TextEditingController());
    }
    for (int i = 0; i < _courseImagesList.length; i++) {
      _cookingControllers.add(TextEditingController());
    }
    for (int i = 0; i < _drinkImagesList.length; i++) {
      _drinkControllers.add(TextEditingController());
    }
  }

  @override
  void dispose() {
    _prTextController.dispose();
    _storeName.dispose();
    _featureTextController.dispose();
    _commitmentToTheStoreController.dispose();
    for (var controller in _seatControllers) {
        controller.dispose();
      }
    for (var controller in _courseControllers) {
        controller.dispose();
      }
    for (var controller in _cookingControllers) {
        controller.dispose();
      }
    super.dispose();
  }

  // ログイン状態を確認するメソッド
  void _checkLoginStatus() async {
    final user = supabase.auth.currentUser;
    if (user != null) {

      setState(() {
        _isLoggedIn = true;
      });
    } else {
      setState(() {
        _isLoggedIn = false;
      });
    }
  }
  
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
                'お店の写真を追加',
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              _storesImages.isNotEmpty
              ? Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  ..._storesImages.map((image) {
                    int index = _storesImages.indexOf(image); // 画像のインデックスを取得
                    return Stack(
                      children: [
                        Image.file(image, width: 100, height: 100, fit: BoxFit.cover,),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _storesImages.removeAt(index);  // 指定されたインデックスの画像を削除
                            });
                          },
                          icon: const Icon(Icons.close, color: Colors.white),
                        ),
                      ],
                    );
                  }).toList(),
                  TextButton.icon(
                    onPressed: () async {
                      try {
                        final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                        if (pickedFile != null) {
                          setState(() {
                            _storesImages.add(File(pickedFile.path)); // XFileをFileに変換して状態を更新
                            // print(_storesImages);

                          });
                        }
                      } catch (e) {
                        print("画像の選択中にエラーが発生しました: $e");
                      }
                    },
                    label: DottedBorder(
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(5),
                      child: const SizedBox(
                        width: 100,
                        height: 100,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 30,
                              color: Colors.grey,
                              ), 
                            SizedBox(height: 20,),
                            Text('写真を追加')
                          ],
                        ),
                      ),
                    ),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero, // ボタンの内側の余白を無くす
                    ),
                  ),
                ],
              )
              // 画像が選択されていない場合のメッセージ
              : TextButton.icon(
                onPressed: () async {
                  try {
                    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        _storesImages.add(File(pickedFile.path)); // XFileをFileに変換して状態を更新

                      });
                    }
                  } catch (e) {
                      print("画像の選択中にエラーが発生しました: $e");
                  }
                },
                label: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(5),
                  child: const SizedBox(
                    width: 100,
                    height: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_a_photo_outlined,
                          size: 30,
                          color: Colors.grey,
                          ),
                        SizedBox(height: 20,),
                        Text('写真を追加')
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: _screenSize.height * 0.008),
              Row(
                children: [
                  const Text(
                    '店名',
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                      ),
                    ),
                  SizedBox(
                    width: 5,
                  ),
              ],
            ),
            SizedBox(height: _screenSize.height * 0.008),
            TextFormField(
              controller: _storeName,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: '例 レストラン タベログ',
              ),
              onChanged: (value) {
                // print('店名: $value'); // 入力が変更されるたびに現在の値を出力
              },
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
                  controller: _prTextController,
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
                  controller: _featureTextController,
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
                  controller: _commitmentToTheStoreController,
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
                ),
              ),
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
                      '座席',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
                ],
              ),
              Container(
                child: ListView.builder(
                shrinkWrap: true, // 子要素に合わせてサイズを調整
                physics: NeverScrollableScrollPhysics(), // スクロールを無効化
                itemCount: _sheetImagesList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('座席', style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          ..._sheetImagesList[index].map((image) {
                            return Stack(
                              children: [
                                Image.file(image, width: 100, height: 100, fit: BoxFit.cover),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _sheetImagesList[index].remove(image);
                                      });
                                    },
                                    icon: const Icon(Icons.close, color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                          TextButton.icon(
                            onPressed: () async {
                              final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  _sheetImagesList[index].add(File(pickedFile.path));
                                });
                              }
                            },
                            label: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(5),
                              child: const SizedBox(
                                width: 100,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 30,
                                      color: Colors.grey,
                                      ),
                                    SizedBox(height: 20,),
                                    Text('写真を追加')
                                  ],
                                ),
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, // ボタンの内側の余白を無くす
                            ),
                          ),
                          SizedBox(height: _screenSize.height * 0.008),
                          Container(
                            child: TextFormField(
                              controller: _seatControllers[index],
                              // keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                              hintText: '例 カウンター',
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
                                ),
                                onChanged: (value) {
                                  // print(_seatControllers[index].text);
                                },
                              ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              ),
              Container(
                child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '+座席を追加',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _sheetImagesList.add([]); // 新しい画像リストを作成
                            _seatControllers.add(TextEditingController());
                            // print("現在の座席画像リスト: $_sheetImagesList");
                          });
                        },
                    ),
                  ],
                ),
              ),
              ),
              SizedBox(height: _screenSize.height * 0.03),
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
                      'メニュー',
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      ),
                  ),
                ],
              ),
              Container(
                child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _courseImagesList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('コース', style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          ..._courseImagesList[index].map((image) {
                            return Stack(
                              children: [
                                Image.file(image, width: 100, height: 100, fit: BoxFit.cover),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _courseImagesList[index].remove(image);
                                      });
                                    },
                                    icon: const Icon(Icons.close, color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                          TextButton.icon(
                            onPressed: () async {
                              final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  _courseImagesList[index].add(File(pickedFile.path));
                                });
                              }
                            },
                            label: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(5),
                              child: const SizedBox(
                                width: 100,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 30,
                                      color: Colors.grey,
                                      ),
                                    SizedBox(height: 20,),
                                    Text('写真を追加')
                                  ],
                                ),
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, // ボタンの内側の余白を無くす
                            ),
                          ),
                          SizedBox(height: _screenSize.height * 0.008),
                          Container(
                            child: TextFormField(
                              controller: _courseControllers[index],
                              maxLines: 3,
                              minLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                              hintText: '例 名物の自家製ピザと季節の食材を使ったパスタを両方お楽しみいただける、ボリューム満点のコースです。',
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
                                ),
                                onChanged: (value) {
                                  // print(_courseControllers[index].text);
                                },
                              ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '+コースを追加',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _courseImagesList.add([]); // 新しい画像リストを作成
                            _courseControllers.add(TextEditingController());
                            // print("現在のコース画像リスト: $_courseImagesList");
                          });
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenSize.height * 0.03),
              Container(
                child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _menuImagesList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('料理', style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          ..._menuImagesList[index].map((image) {
                            return Stack(
                              children: [
                                Image.file(image, width: 100, height: 100, fit: BoxFit.cover),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _menuImagesList[index].remove(image);
                                      });
                                    },
                                    icon: const Icon(Icons.close, color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                          TextButton.icon(
                            onPressed: () async {
                              final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  _menuImagesList[index].add(File(pickedFile.path));
                                });
                              }
                            },
                            label: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(5),
                              child: const SizedBox(
                                width: 100,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 30,
                                      color: Colors.grey,
                                      ),
                                    SizedBox(height: 20,),
                                    Text('写真を追加')
                                  ],
                                ),
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, // ボタンの内側の余白を無くす
                            ),
                          ),
                          SizedBox(height: _screenSize.height * 0.008),
                          Container(
                            child: TextFormField(
                              controller: _cookingControllers[index],
                              maxLines: 3,
                              minLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                              hintText: '例 メニュー',
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
                                ),
                                onChanged: (value) {
                                  // print(_cookingControllers[index].text);
                                },
                              ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '+料理を追加',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _menuImagesList.add([]); // 新しい画像リストを作成
                            _cookingControllers.add(TextEditingController());
                            // print("現在の料理画像リスト: $_menuImagesList");
                          });
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenSize.height * 0.03),
              Container(
                child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _drinkImagesList.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ドリンク', style: TextStyle(fontWeight: FontWeight.bold)),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          ..._drinkImagesList[index].map((image) {
                            return Stack(
                              children: [
                                Image.file(image, width: 100, height: 100, fit: BoxFit.cover),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _drinkImagesList[index].remove(image);
                                      });
                                    },
                                    icon: const Icon(Icons.close, color: Colors.white),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                          TextButton.icon(
                            onPressed: () async {
                              final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  _drinkImagesList[index].add(File(pickedFile.path));
                                });
                              }
                            },
                            label: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(5),
                              child: const SizedBox(
                                width: 100,
                                height: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_a_photo_outlined,
                                      size: 30,
                                      color: Colors.grey,
                                      ),
                                    SizedBox(height: 20,),
                                    Text('写真を追加')
                                  ],
                                ),
                              ),
                            ),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero, // ボタンの内側の余白を無くす
                            ),
                          ),
                          SizedBox(height: _screenSize.height * 0.08),
                          Container(
                            child: TextFormField(
                              controller: _drinkControllers[index],
                              maxLines: 3,
                              minLines: 3,
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                              hintText: '例 ドリンク',
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
                                ),
                                onChanged: (value) {
                                  // print(_drinkControllers[index].text);
                                },
                              ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '+ドリンクを追加',
                      style: TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          setState(() {
                            _drinkImagesList.add([]); // 新しい画像リストを作成
                            _drinkControllers.add(TextEditingController());
                          });
                        },
                    ),
                  ],
                ),
              ),
              SizedBox(height: _screenSize.height * 0.03),
              Container(
                width: _screenSize.width * 1.0,
                child: ElevatedButton(
                    onPressed: () async {
                      _saveData(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NavigationPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,  // 背景色
                      foregroundColor: Colors.white,  // 文字色
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),  // 丸みをつける
                      ),
                    ),
                    child: const Text('決定'),
                  ),
              ),
              SizedBox(height: _screenSize.height * 0.05),
            ],
          ),
        ),
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
  try {
    // 店の画像とフィールドの設定
    List<Map<String, dynamic>> storesDataList = [];
    for (int i = 0; i < _storesImages.length; i++) {
      if (_storesImages.isEmpty) {
        continue; // 空のリストはスキップする
      }
      // ファイルを指定
      final file = _storesImages[i];
      // ファイル名を指定
      final fileName = 'store_image_${DateTime.now().millisecondsSinceEpoch}_$i.jpg';
      // pathを指定
      final String path = 'private/${user?.id}/$fileName';
       // ファイルをアップロード
      final String uploadedPath = await uploadFile(file, path);
      // 公開URLを取得
      final String publicUrl = supabase
        .storage
        .from('storeData')
        .getPublicUrl(fileName);

      storesDataList.add({
        'images': [publicUrl]
      });
    }
    // 必須フィールドの確認
    String storeName = _storeName.text;
    if (storeName.isEmpty) {
      throw Exception('store_name is required.');
    }
    // シート画像とテキストをリストで構築
    List<Map<String, dynamic>> seatDataList = [];
    final flatSheetImages = _sheetImagesList.expand((images) => images).toList(); // フラット化
    for (int i = 0; i < _sheetImagesList.length; i++) {
      // ファイルを指定
      final file = flatSheetImages[i];
      // ファイル名を指定
      final fileName = 'seeat_image_${DateTime.now().microsecondsSinceEpoch}_${i}.jpg';
      // pathを指定
      final String path = 'private/${user?.id}/$fileName';
      // ファイルをアップロード
      final String uploadedPath = await uploadFile(file, path);
      // 公開URLを取得
      final String publicUrl = supabase
        .storage
        .from('storeData')
        .getPublicUrl(fileName);
      // 座席のテキストを取得
      List<String> seatText = [_seatControllers[i].text];
      seatDataList.add({
        'images': [publicUrl],
        'text': seatText,
      });
    }
    // コース画像とテキストをリストで構築
    List<Map<String, dynamic>> courseDataList = [];
    final flatcourseImages = _courseImagesList.expand((images) => images).toList(); // フラット化
    for (int i = 0; i < _courseImagesList.length; i++) {
      if (_courseImagesList[i].isEmpty) {
        continue; // 空のリストはスキップする
      }
      // ファイルを指定
      final file = flatcourseImages[i];
      // ファイル名を指定
      final fileName = 'course_image_${DateTime.now().microsecondsSinceEpoch}_$i.jpg';
      // pathを指定
      final String path = 'private/${user?.id}/$fileName';
      // ファイルをアップロード
      final String uploadedPath = await uploadFile(file, path);
      // 公開URLを取得
      final String publicUrl = supabase
        .storage
        .from('storeData')
        .getPublicUrl(fileName);
      // コースのテキストを取得
      List<String> courseText = [_courseControllers[i].text];
      // データをリストに追加
      courseDataList.add({
        'images': [publicUrl],
        'text': courseText,
      });
    }
    // メニュー画像とテキストをリストで構築
    List<Map<String, dynamic>> menuDataList = [];
    final flatmenuImages = _menuImagesList.expand((images) => images).toList(); // フラット化
    for (int i = 0; i < _menuImagesList.length; i++) {
      if (_menuImagesList[i].isEmpty) {
        continue; // 空のリストはスキップする
      }
      // ファイルを指定
      final file = flatmenuImages[i];
      // ファイル名を指定
      final fileName = 'menu_images_${DateTime.now().microsecondsSinceEpoch}_$i.jpg';
      // pathを指定
      final String path = 'private/${user?.id}/$fileName';
      // ファイルをアップロード
      final String uploadedPath = await uploadFile(file, path);
      // 公開URLを取得
      final String publicUrl = supabase
        .storage
        .from('storeData')
        .getPublicUrl(fileName);
      List<String> menuText = [_cookingControllers[i].text];
      menuDataList.add({
        'images': [publicUrl],
        'text': menuText,
      });
    }
    // ドリンク画像とテキストをリストで構築
    List<Map<String, dynamic>> drinkDataList = [];
    final flatdrinkImages = _drinkImagesList.expand((images) => images).toList(); // フラット化
    for (int i = 0; i < _drinkImagesList.length; i++) {
      if (_drinkImagesList[i].isEmpty) {
        continue; // 空のリストはスキップする
      }
      // ファイルを指定
      final file = flatdrinkImages[i];
      // ファイル名を指定
      final fileName = 'drink_images_${DateTime.now().microsecondsSinceEpoch}_$i.jpg';
      // pahtを指定
      final String path = 'private/${user?.id}/$fileName';
      // ファイルをアップロード
      final String uploadedPath = await uploadFile(file, path);
      // 公開URLを取得
      final String publicUrl = supabase
        .storage
        .from('storeData')
        .getPublicUrl(fileName);
      List<String> drinkText = [_drinkControllers[i].text];
      drinkDataList.add({
        'images': [publicUrl],
        'text': drinkText,
      });
    }
    // StoreDataモデルにデータをマッピング
    Map<String, dynamic> storeData = {
      'storeImages': storesDataList.map((store) => store['images'] as List<String>).expand((x) => x).toList(),
      'storeName': storeName,
      'prText': _prTextController.text,
      'featureText': _featureTextController.text,
      'commitment': _commitmentToTheStoreController.text,
      'seatImages': seatDataList.map((seat) => seat['images'] as List<String>).expand((x) => x).toList(),
      'seatText': seatDataList.map((seat) => seat['text'] as List<String>).expand((x) => x).toList(),
      'coursImages': courseDataList.map((course) => course['images'] as List<String>).expand((x) => x).toList(),
      'coursText': courseDataList.map((course) => course['text'] as List<String>).expand((x) => x).toList(),
      'menuImages': menuDataList.map((menu) => menu['images'] as List<String>).expand((x) => x).toList(),
      'menuText': menuDataList.map((menu) => menu['text'] as List<String>).expand((x) => x).toList(),
      'drinkImages': drinkDataList.map((drink) => drink['images'] as List<String>).expand((x) => x).toList(),
      'drinkText': drinkDataList.map((drink) => drink['text'] as List<String>).expand((x) => x).toList(),
    };
    // データ保存
    final response = await supabase
      .from('stores') // テーブル名を指定
      .insert(storeData); // データを挿入
    // 保存成功時のメッセージ
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('データが正常に保存されました。')),
    );
  } catch (e) {
    print(e);
    // エラー時の処理
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('エラーが発生しました: $e')),
    );
  }
}
}