import 'package:flutter/material.dart';

class Scanner extends StatelessWidget {
  static const pink = Color(0xffff4081);
  static const orange = Color(0xffffab40);

  Positioned _build_circle(Color first, Color second,
      {double top,
      double left,
      double bottom,
      double right,
      double width,
      double height,
      Alignment begin,
      Alignment end,
      List<double> stops}) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
                begin: begin, end: end, stops: stops, colors: [first, second])),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xffff80ab), Color(0xffffab40)])),
      child: Stack(
        children: <Widget>[
          _build_circle(Color(0xffffab40), Color(0xffe91e63),
              top: 300.0,
              left: -100,
              width: 300,
              height: 300,
              begin: Alignment.topRight,
              end: Alignment.bottomLeft),
          _build_circle(orange, pink,
              top: 50.0,
              left: 50,
              width: 50,
              height: 50,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [.0, .8]),
          _build_circle(pink, orange,
              bottom: 200,
              left: 75,
              width: 35,
              height: 35,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
          _build_circle(pink, orange,
              bottom: 45,
              right: 75,
              width: 75,
              height: 75,
              begin: Alignment.bottomLeft,
              end: Alignment.topRight),
          _build_circle(pink, orange,
              top: 250,
              right: -50,
              width: 100,
              height: 100,
              stops: [0, 1],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft),
          _build_circle(pink, orange,
              top: -50,
              right: 50,
              width: 150,
              height: 150,
              stops: [0, 1],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ],
      ),
    );
  }
}
