import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaper/Models/photos.dart';
import 'package:wallpaper/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:wallpaper/global.dart';

class HomePage extends StatefulWidget with NavigationStates {
  // final ThemeData themeData;
  // HomePage({@required this.themeData});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    getWallpapers() async {
    await http.get('API_URL',
        headers: {
          'Authorization':
              'AUTHORIZATION_KEY'
        }).then((res) {
      // print(res.body);
      var parsejson = jsonDecode(res.body);
      Global.photos = (parsejson['photos'] as List)
          .map((data) => Photos.fromJson(data))
          .toList();
    });

    setState(() {});
  }
    @override
  void initState() {
    super.initState();
    getWallpapers();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
            itemCount: Global.photos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 0.5),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                    Global.index = index;
                    Navigator.of(context).pushNamed('FullImages');
                  },
                  child: FadeInImage(
                    image: NetworkImage(Global.photos[index].src.medium),
                    fit: BoxFit.cover,
                    placeholder: NetworkImage(Global.photos[index].src.medium),
                  ));
            })
			);
  }
}