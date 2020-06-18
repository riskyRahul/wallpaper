
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/Sidebar/sidebar.dart';
import 'package:wallpaper/bloc.navigation_bloc/navigation_bloc.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, String title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
          child: Stack(
            children: <Widget>[
              BlocBuilder<NavigationBloc, NavigationStates>(
                builder: (context, navigationState) {
                  return navigationState as Widget;
                },
              ),
              SideBar(),
            ],
          ),
        ),
      ),
    );
  }

}
