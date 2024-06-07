import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class BackgroundAnimation extends StatelessWidget {
  final Widget child;

  BackgroundAnimation({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blueAccent, Colors.lightBlueAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: SpinKitRipple(
            color: Colors.white.withOpacity(0.1),
            size: 300.0,
          ),
        ),
        child,
      ],
    );
  }
}
