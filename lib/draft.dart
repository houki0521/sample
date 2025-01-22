import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';

class DraftPage extends StatefulWidget {
  const DraftPage({super.key});

  @override
  State<DraftPage> createState() => _DraftPageState();
}

class _DraftPageState extends State<DraftPage> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    _getAllData(); // データを初期化時に取得
  }

  Future<void> _getAllData() async {
    try {
      final response = await supabase
          .from('wordOfMouthData') // テーブル名を指定
          .select('');


      if (response is List<dynamic> && response.isNotEmpty) {
        setState(() {
          data = List<Map<String, dynamic>>.from(response);
        });
        print(response.runtimeType); // レスポンスの型を確認
        print(response); // 実際のデータ内容を確認
        print('データ取得');
      } else {
        print('Error: ${response!}');
      }
    } catch (e) {
      print('Exception: $e');
    }
  }

  List<String> sortList = ['更新日', '訪問日'];
  String _selectedValue = '更新日';
  int _choiceIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton(
          items: sortList.map((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value)
            );
          }).toList(),
          value: _selectedValue,
          onChanged: (String? value) {
            setState(() {
              _selectedValue = value!;
            });
          }
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Center(
                        child: ChoiceChip(
                          label: Text(
                            '行った',
                            style: TextStyle(
                              fontFeatures: [FontFeature.tabularFigures()],
                            ),
                            ),
                          selected: _choiceIndex == 0,
                          backgroundColor: Colors.white,
                          selectedColor: Colors.grey[400],
                          showCheckmark: false,
                          onSelected: (_) {
                            setState(() {
                              _choiceIndex = 0;
                            });
                          },
                        )
                      ),
                    ),
                    IntrinsicWidth(
                      child: Center(
                        child: ChoiceChip(
                          label: Text(
                            'おすすめポイント',
                            style: TextStyle(
                              fontFeatures: [FontFeature.tabularFigures()],
                            ),
                          ),
                          selected: _choiceIndex == 1,
                          backgroundColor: Colors.white,
                          selectedColor: Colors.grey[400],
                          showCheckmark: false,
                          onSelected: (_) {
                            setState(() {
                              _choiceIndex = 1;
                            });
                          },
                        )
                      ),
                    ),
                  ],
                ),
                data.isEmpty
                  ? Text('下書きがありません')
                  : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      
                      Flexible(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true, // ListViewのサイズを子供に合わせる
                            itemCount: data?.length ?? 0,
                            itemBuilder: ((context, index) {
                              final wordOfMouthData = data[index];
                              return Card(
                                child: Center(
                                  child: ListTile(
                                    title: Text(
                                      wordOfMouthData['wordOfMouthText'],
                                      textAlign: TextAlign.center,
                                      ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      )
                    ],
                  )
              ],
            )
          ),
        ],
      ),
    );
  }
}