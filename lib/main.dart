import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'Store_Screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ホーム画面'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Store_ScreensPage()),
                );
              },
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
            Card(
              child: ListTile(
              title: Text('タイトル'),
              subtitle: Text('サブタイトル'),
            ),
            ),
          ],
        ),
      )
    );
  }
}