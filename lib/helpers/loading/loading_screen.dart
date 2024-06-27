import 'package:my_notes/helpers/loading/loading_screen_controller.dart';

class LoadingScreen {
  // static final LoadingScreen _singleton = LoadingScreen._internal();
  // factory LoadingScreen()=> _singleton;
  // LoadingScreen._internal();
  static final LoadingScreen _shared = LoadingScreen._sharedInstance();
  LoadingScreen._sharedInstance();
  factory LoadingScreen() => _shared;

  LoadingScreenController? _controller;
}
