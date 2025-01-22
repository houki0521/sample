import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'registration.dart';
import 'add_photo.dart';
import 'draft.dart';

class PostingPage extends StatefulWidget {
  const PostingPage({super.key});

  @override
  State<PostingPage> createState() => _PostingPageState();
}

class _PostingPageState extends State<PostingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('投稿'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        IconButton.outlined(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AddPhoto()),
                            );
                          },
                          icon: Icon(Icons.mode_edit_outline_outlined),
                          ),
                          Text('口コミを書く'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton.outlined(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DraftPage()),
                            );
                          },
                          icon: Icon(Ionicons.create_outline)
                          ),
                          Text('下書き一覧'),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton.outlined(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegistrationPage()),
                            );
                          },
                          icon: Icon(Icons.storefront_outlined)
                        ),
                        Text('新店登録'),
                      ],
                    ),
                    
                  ],
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
              child: Column(
                children: <Widget>[
                  Text('投稿の候補')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}