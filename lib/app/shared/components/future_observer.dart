import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

/// Class responsible for decoupling pages from any state manager.
/// If in the future it is evaluated to use another than Mobx it is simpler
/// to change in one place.
class FutureObserver extends StatelessWidget {

  final WidgetBuilder builder;

  FutureObserver({Key key, @required this.builder})
      : assert(builder != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: builder,
    );
  }
}
