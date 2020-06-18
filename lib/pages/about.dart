import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/bloc.navigation_bloc/navigation_bloc.dart';

class About extends StatefulWidget with NavigationStates {
  const About({Key key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
// Declare this variable
  int selectedRadioTile;

  @override
  void initState() {
    super.initState();
    // selectedRadio = 0;
    selectedRadioTile = 0;
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      child: ListView(
        children: <Widget>[
          RadioListTile(
            value: 1,
            groupValue: selectedRadioTile,
            title: Text("Radio 1"),
            subtitle: Text("Radio 1 Subtitle"),
            onChanged: (val) {
              print("Radio Tile pressed $val");
              setSelectedRadioTile(val);
            },
            activeColor: Colors.red,
          ),
          RadioListTile(
            value: 2,
            groupValue: selectedRadioTile,
            title: Text("Radio 2"),
            subtitle: Text("Radio 2 Subtitle"),
            onChanged: (val) {
              print("Radio Tile pressed $val");
              setSelectedRadioTile(val);
            },
            activeColor: Colors.red,
          ),
          RadioListTile(
            value: 3,
            groupValue: selectedRadioTile,
            title: Text("Radio 2"),
            subtitle: Text("Radio 2 Subtitle"),
            onChanged: (val) {
              print("Radio Tile pressed $val");
              setSelectedRadioTile(val);
            },
            activeColor: Colors.red,
          ),
        ],
      ),
    ));
  }
}
