import 'package:flutter/material.dart';
import 'package:wallpaper/bloc.navigation_bloc/navigation_bloc.dart';

class Setting extends StatelessWidget with NavigationStates {
  const Setting({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Setting',
        style : TextStyle(
          fontSize: 22,
          fontStyle: FontStyle.italic
        )
        ),
      )
    );
  }
}