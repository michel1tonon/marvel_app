import 'dart:io';

import 'package:flutter/services.dart';

String loadMockFromAssets(String fileName) {
  try {
    // env test or dev.
    String dir = Directory.current.path;
    if (dir.endsWith('/test')) {
      dir = Directory.current.parent.path;
    }
    return File('$dir/assets/mocks/$fileName.json').readAsStringSync();
  } catch (e) {
    print('error $e');
  }
  return null;
}

Future<void> applyPortrait(){
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}


