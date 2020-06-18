import 'package:flutter/material.dart';
import 'package:wallpaper/Full_Screen_videos.dart';
import 'package:wallpaper/Sidebar/sidebar_layout.dart';
import 'package:wallpaper/full_image.dart';
import 'package:flutter_config/flutter_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData _themeData = Theme.of(context);
    int index = 0;

    return MaterialApp(
      title: 'HD Wallpaper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'HD Wallpaper'),
      routes: {
        'FullImages':(context)=> FullImage(themeData: _themeData,heroId: 'trending$index',),
        'FullVideos':(context)=> FullONScreenVideos()
      },
    );
  }
}
