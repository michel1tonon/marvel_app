import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// filter null.
bool notNull(Object o) => o != null;

/// hide keyboard
void hideKeyboard(context) =>
    FocusScope.of(context).requestFocus(new FocusNode());

/// load file json.
loadJsonAsset(String fileName) async {
  try {
    return await rootBundle.loadString('assets/mocks/$fileName.json');
  } catch (e) {
    print('error $e');
  }
  return null;
}

/// Orientation Portrait
Future<void> applyPortrait(){
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

/// Orientation Landscape
Future<void> applyLandscape(){
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}

