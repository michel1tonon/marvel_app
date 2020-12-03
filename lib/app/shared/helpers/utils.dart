import 'package:flutter/services.dart';

Future<String> loadMockFromAssets(String nameFile) async {
  return await rootBundle.loadString('assets/mocks/$nameFile.json');
}

Future<void> applyPortrait(){
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}


