import 'package:flutter/material.dart';
import 'navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:hive_flutter/hive_flutter.dart';


// late Box box;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Supabase初期化
  await Supabase.initialize(
    url: 'https://xzqcljxnjhpfuwbfdrwz.supabase.co', // 正しいURL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh6cWNsanhuamhwZnV3YmZkcnd6Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM0NTk2OTgsImV4cCI6MjA0OTAzNTY5OH0.Z-6ASa-kSo2dN_2jGmQ31ja3J9RAMuoAGnTSybbvwyU', // 正しいanonKey
  );
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
      home: NavigationPage(),
    );
  }
}

