import 'package:flutter/material.dart';

class GBBusy extends StatelessWidget {
  bool busy = false;
  Widget child;

  GBBusy({
    @required this.busy,
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return busy
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : child;
  }
}
