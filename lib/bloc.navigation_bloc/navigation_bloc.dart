import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaper/pages/about.dart';
import 'package:wallpaper/pages/homepage.dart';
import 'package:wallpaper/pages/setting.dart';
import 'package:wallpaper/pages/videosPage.dart';

enum NavigationEvents {
  HomePageClickedEvent,
  VideosPageClickedEvent,
  AboutClickedEvent,
  SettingClickedEvent
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvents.VideosPageClickedEvent:
        yield VideosPage();
        break;
      case NavigationEvents.AboutClickedEvent:
        yield About();
        break;
      case NavigationEvents.SettingClickedEvent:
        yield Setting();
        break;
    }
  }
}
