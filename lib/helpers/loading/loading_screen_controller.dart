import 'package:flutter/foundation.dart';

typedef CloseLoadingScreen = void Function();
typedef UpdateLoadingScreen = void Function(String text);

@immutable
class LoadingScreenController {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScreenController({
    required this.close,
    required this.update,
  });
}
