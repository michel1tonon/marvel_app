import 'package:flutter/material.dart';

class Loading extends StatelessWidget {

  final bool loading;
  final Widget child;

  const Loading({Key key, this.loading, this.child}) :
        assert(loading != null),
        assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading ?
      _circularProgress(): child;
  }

  Widget _circularProgress() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
