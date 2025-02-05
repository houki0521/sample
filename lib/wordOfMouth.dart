import 'package:flutter/material.dart';
import 'models/store_data.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class WordOfMouth extends StatefulWidget {
  final StoreData store;
  const WordOfMouth({super.key, required this.store});

  @override
  State<WordOfMouth> createState() => _WordOfMouthState();
}

class _WordOfMouthState extends State<WordOfMouth> {
  int _choiceIndex = 0;
  final SupabaseClient supabase = Supabase.instance.client;
  final ImagePicker _picker = ImagePicker();
  double _star = 0.0;
  List<double> numberOfStarRatings = [0.0, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5, 5.0];
  List<File> wordOfMouthImage = [];
  List<String> items = ["¥¥¥¥ ~ ¥¥¥¥", "~¥ 999", "¥1,000~¥1,999", "¥2,000~¥2,999", "¥3,000~¥3,999", "¥4,000~¥4,999", "¥5,000~"];
  int selectedIndex = 0;
  String selectedItem = "¥¥¥¥ ~ ¥¥¥¥";
  String selectedItemButtons = "";
  double selectedStarItem = 0.0;
  int selectedStarIndex = 0;
  String _selectedDate = '日付を選択'; // 初期値
  final TextEditingController _wordOfMouthStateController = TextEditingController();
   // ギャラリーから複数画像を選択
  Future<void> getImageFromGallery(List<File> list) async {
    try {
      final List<XFile>? pickedFiles = await _picker.pickMultiImage();

      if (pickedFiles != null) {
        setState(() {
          for (var pickedFile in pickedFiles) {
            list.add(File(pickedFile.path)); // 各 XFile の path を取得して File に変換
          }
        });
      }
    } catch (e) {
      print('画像選択中にエラーが発生しました: $e');
    }
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(widget.store.storeName)),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // 左寄せに配置
          children: [
            SizedBox(height: 16),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: ChoiceChip(
                        label: Column(
                          children: [
                            Icon(
                              Icons.dark_mode,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        selected: _choiceIndex == 0,
                        backgroundColor: Colors.grey[400],
                        selectedColor: const Color.fromARGB(255, 12, 52, 85),
                        showCheckmark: false,
                        onSelected: (_) {
                          setState(() {
                            _choiceIndex = 0;
                            selectedItemButtons = '夜';
                          });
                        },
                      ),
                    ),
                    Text(
                      '夜',
                      style: TextStyle(
                          fontWeight: _choiceIndex == 0
                            ? FontWeight.bold
                            : FontWeight.normal
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: ChoiceChip(
                        label: Column(
                          children: [
                            Icon(Icons.light_mode, color: Colors.white),
                          ],
                        ),
                        selected: _choiceIndex == 1,
                        backgroundColor: Colors.grey[400],
                        selectedColor: const Color.fromARGB(255, 248, 180, 80),
                        showCheckmark: false,
                        onSelected: (_) {
                          setState(() {
                            _choiceIndex = 1;
                            selectedItemButtons = '昼';
                          });
                        },
                      ),
                    ),
                    Text(
                      '昼',
                      style: TextStyle(
                        fontWeight: _choiceIndex == 1
                            ? FontWeight.bold
                            : FontWeight.normal, // 選択されている時は太字
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: ChoiceChip(
                        label: Column(
                          children: [
                            Icon(Icons.business_center, color: Colors.white),
                          ],
                        ),
                        selected: _choiceIndex == 2,
                        backgroundColor: Colors.grey[400],
                        selectedColor: const Color.fromARGB(255, 207, 201, 49),
                        showCheckmark: false,
                        onSelected: (value) {
                          setState(() {
                            _choiceIndex = 2;
                            selectedItemButtons = 'テイクアウト';
                          });
                        },
                      ),
                    ),
                    Text(
                      'テイクアウト',
                      style: TextStyle(
                        fontWeight: _choiceIndex == 2
                          ? FontWeight.bold
                          : FontWeight.normal
                      ),
                      )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: ChoiceChip(
                        label: Column(
                          children: [
                            Icon(Icons.fire_truck, color: Colors.white),
                          ],
                        ),
                        selected: _choiceIndex == 3,
                        backgroundColor: Colors.grey[400],
                        selectedColor: const Color.fromARGB(255, 184, 132, 36),
                        showCheckmark: false,
                        onSelected: (value) {
                          setState(() {
                            _choiceIndex = 3;
                            selectedItemButtons = 'デリバリー';
                          });
                        },
                      ),
                    ),
                    Text(
                      'デリバリー',
                      style: TextStyle(
                        fontWeight: _choiceIndex == 3
                          ? FontWeight.bold
                          : FontWeight.normal
                      ),
                      )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      child: ChoiceChip(
                        label: Column(
                          children: [
                            Icon(Icons.more_horiz, color: Colors.white),
                          ],
                        ),
                        selected: _choiceIndex == 4,
                        backgroundColor: Colors.grey[400],
                        selectedColor: const Color.fromARGB(255, 93, 93, 93),
                        showCheckmark: false,
                        onSelected: (value) {
                          setState(() {
                            _choiceIndex = 4;
                            selectedItemButtons = 'その他';
                          });
                        },
                      ),
                    ),
                    Text(
                      'その他',
                      style: TextStyle(
                        fontWeight: _choiceIndex == 4
                          ? FontWeight.bold
                          : FontWeight.normal
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBar.builder(
                  initialRating: _star,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.yellow
                  ),
                  onRatingUpdate: (rating) {
                    setState(() {
                      _star = rating;
                      selectedStarIndex = numberOfStarRatings.indexOf(rating);// ピッカーと同期
                    });
                  },
                  unratedColor: Colors.grey[600],
                  allowHalfRating: true,
                  itemCount: 5,
                ),
                TextButton(
                  onPressed: () {
                    _showNumberOfStarRatingsPicker();
                  },
                  child: Text(
                    _star.toString(),
                    style: TextStyle(
                      fontSize: 25
                    )
                  ),
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('使った金額（一人あたり）'),
                TextButton(
                  onPressed: () {
                    _showPicker();
                  }, child: Text(selectedItem)
                )
              ],
            ),
            SizedBox(height: 15),
            TextFormField(
              maxLines: 6,
              minLines: 6,
              keyboardType: TextInputType.multiline,
              controller: _wordOfMouthStateController,
              decoration: InputDecoration(
                hintText: '美味しかったメニューや、お店の雰囲気はいかがでしたか？',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: const BorderSide(
                    width: 1,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                ...wordOfMouthImage.map((image) {
                  int index = wordOfMouthImage.indexOf(image);
                  return Stack(
                    children: [
                      Image.file(image, width: 100, height: 100, fit: BoxFit.cover,),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            wordOfMouthImage.removeAt(index);  // 指定されたインデックスの画像を削除
                          });
                        },
                        icon: const Icon(Icons.close, color: Colors.white),
                      ),
                    ],
                  );
                }).toList(),
                TextButton.icon(
                  onPressed: () async {
                    getImageFromGallery(wordOfMouthImage);
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
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('訪問日'),
                SizedBox(width: 40),
                TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime(0, 1, 1),
                      maxTime: DateTime(10000, 12, 31),
                      onConfirm: (date) {
                        // 選択した日付を更新
                        setState(() {
                          _selectedDate = '${date.year}年${date.month}月${date.day}日'; // 日付を文字列として保存
                        });
                      },
                      currentTime: DateTime.now(),
                      locale: LocaleType.jp
                    );
                  },
                  child: Text(_selectedDate),
                ),
              ],
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _saveData(context);
                  
                },
                child: Text('投稿'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,  // 背景色
                  foregroundColor: Colors.white,  // 文字色
                  shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),  // 丸みをつける
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
void _showPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              // ヘッダー（DoneやCancelボタン）
              Container(
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), // キャンセルボタン
                      child: Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          selectedItem = items[selectedIndex];
                        });
                        Navigator.pop(context); // Doneボタン
                      },
                      child: Text('決定'),
                    ),
                  ],
                ),
              ),
              // ピッカー本体
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40.0,
                  scrollController:
                  FixedExtentScrollController(initialItem: selectedIndex),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  children: items.map((item) => 
                  Center(
                    child: Text(
                      item,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      )
                    )).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  void _showNumberOfStarRatingsPicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Column(
            children: [
              // ヘッダー
              Container(
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context), // キャンセルボタン
                      child: Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _star = numberOfStarRatings[selectedStarIndex];
                        });
                        Navigator.pop(context); // Doneボタン
                      },
                      child: Text('決定'),
                    ),
                  ],
                ),
              ),
              // ピッカー本体
              Expanded(
                child: CupertinoPicker(
                  itemExtent: 40.0,
                  scrollController:
                  FixedExtentScrollController(initialItem: selectedStarIndex),
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectedStarIndex = index;
                    });
                  },
                  children: numberOfStarRatings.map((item) {
                    return Center(
                      child: Text(item.toString()),
                    );
                  }).toList()
                ),
              ),
            ],
          ),
        );
      }
    );
  }
  Future<String> uploadFile(File file, String path) async {
    try {
      // ファイルをアップロード
      final String fullPath = await supabase.storage.from('wordOfMouthPhotData').upload(
        path,
        file,
        fileOptions: const FileOptions(cacheControl: '3600', upsert: false),
      );
      return fullPath;
    } catch (e) {
      print('Error uploading file: $e');
      throw Exception('Failed to upload file: $e');
    }
  }
  Future<void> _saveData(BuildContext context) async {
    final session = supabase.auth.currentSession; // 現在のセッション
    final user = session?.user; // ユーザー情報
    try {
      List<Map<String, dynamic>> wordOfMouthImagesURL = [];
      // 写真を取り出してアップロードする
      for (var i = 0; i < wordOfMouthImage.length; i++) {
        if (wordOfMouthImage.isEmpty) {
          continue; // 空のリストはスキップする
        }
        // ファイルを指定
        final file = wordOfMouthImage[i];
        // ファイル名を指定
        final fileName = 'word_of_mouth_image${DateTime.now().millisecondsSinceEpoch}_$i.jpg';
        // パスを指定
        String path = 'private/${user?.id}/$fileName';
        // ファイルをアップロード
        await uploadFile(file, path);
        // 公開URLを取得
        final String publicUrl = await supabase
          .storage
          .from('wordOfMouthPhotData')
          .getPublicUrl(path);
        wordOfMouthImagesURL.add({
          'images': [publicUrl]
        });
      }
      Map<String, dynamic> wordOfMouthData = {
        'store_name' : widget.store.storeName,
        'selectedItem' : selectedItemButtons,
        'number_of_ratings' : _star,
        'amount_spent' : selectedItem,
        'wordOfMouthText' : _wordOfMouthStateController.text,
        'wordOfMouthPhot' : wordOfMouthImagesURL.map((wordOfMout) => wordOfMout['images'] as List<String>).expand((x) => x,).toList(),
        'date_of_visit' : _selectedDate
      };
      await supabase
        .from('wordOfMouthData') // テーブル名を指定
        .insert(wordOfMouthData); // データを挿入
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('データが正常に保存されました。')),
      );
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      print(e);
      // エラー時の処理
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('エラーが発生しました: $e')),
      );
    }
  }
}