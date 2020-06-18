import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/bloc.navigation_bloc/navigation_bloc.dart';

class VideosPage extends StatefulWidget with NavigationStates {
  const VideosPage({Key key}) : super(key: key);

  @override
  _VideosPageState createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: GridView.builder(
            itemCount: 30,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1,
                childAspectRatio: 0.6),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('FullVideos');
                },
                child: Card(
                  color: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  borderOnForeground: true,
                  elevation: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Icon(
                      Icons.play_circle_filled,
                      size: 50.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            }));
  }
}
