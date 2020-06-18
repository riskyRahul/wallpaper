import 'package:flutter/material.dart';

class FullONScreenVideos extends StatefulWidget {
  FullONScreenVideos({Key key}) : super(key: key);

  @override
  _FullONScreenVideosState createState() => _FullONScreenVideosState();
}

class _FullONScreenVideosState extends State<FullONScreenVideos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 30,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF262AAA),
                  ),
                  child: Icon(Icons.play_circle_filled,
                      size: 80.0, color: Colors.white),
                ),
              );
            }));
  }
}
