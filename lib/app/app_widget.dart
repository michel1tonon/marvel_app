import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/shared/constants/colors_constant.dart';
import 'package:marvel_app/app/shared/constants/modules_constant.dart';
import 'package:marvel_app/app/shared/helpers/utils.dart';

/// First element of the widget tree.
/// All other elements will run from this point following all settings configured here.
class AppWidget extends StatelessWidget {

  AppWidget(){
    // set portrait orientation
    applyPortrait();

    // change bar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marvel APP',
      theme: ThemeData(
        fontFamily: 'Gotham',
        primarySwatch: Colors.blue,
        accentColor: ACCENT_COLOR,
        cardColor: WHITE_COLOR,
        scaffoldBackgroundColor: BACKGROUND_COLOR,
        iconTheme: IconThemeData(color: DARK_COLOR),
        bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.transparent,),
        dividerColor: Colors.transparent
      ),
      // set your initial route
      initialRoute: "/$HOME",
      // add Modular to manage the routing system
      onGenerateRoute: Modular.generateRoute,
      navigatorKey: Modular.navigatorKey,
    );
  }
}
