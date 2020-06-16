import 'dart:ui';

import 'package:flutter/material.dart';

class GBButton extends StatelessWidget {
  final String text, image;
  final Function callback;
  final double width;

  GBButton(
      {@required this.text, @required this.callback, this.image, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      width: width != null ? width : 250,
      child: FlatButton(
        onPressed: callback,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            image != null
                ? Image.asset(
                    image,
                    width: 32,
                  )
                : SizedBox(),
            image != null
                ? SizedBox(
                    width: 10,
                  )
                : SizedBox(),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
