import 'dart:math';

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

  Container _build_background() {
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

  var button = RaisedButton(
      onPressed: () {
        print("teste");
      },
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Color(0xffe040fb), Color(0xff7c4dff)])),
        padding: const EdgeInsets.fromLTRB(50, 20, 50, 20),
        child: const Text("Leitura"),
      ));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        this._build_background(),
        Positioned(
          bottom: 0,
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 200,
            child: Center(
              child: button,
            ),
          ),
        ),
        Positioned(
          bottom: 150,
          left: (MediaQuery.of(context).size.width / 2) -
              (MediaQuery.of(context).size.width - 45) / 2,
          width: MediaQuery.of(context).size.width - 45,
          height: 175,
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Transform.rotate(
                angle: pi / 25,
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xff8e24aa), Color(0xffff5252)]
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 1.0,
                            spreadRadius: -1.0,
                            color: Colors.grey),
                        BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 1.0,
                            spreadRadius: 0.0,
                            color: Colors.grey),
                        BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 1.0,
                            spreadRadius: 0.0,
                            color: Colors.grey),
                      ]),
                ),
              )),
        ),
        Positioned(
          bottom: 150,
          left: (MediaQuery.of(context).size.width / 2) -
              (MediaQuery.of(context).size.width - 45) / 2,
          width: MediaQuery.of(context).size.width - 45,
          height: 175,
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: Transform.rotate(
                angle: -pi / 50,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey, width: 0.5),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 1.0,
                            spreadRadius: -1.0,
                            color: Colors.grey),
                        BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 1.0,
                            spreadRadius: 0.0,
                            color: Colors.grey),
                        BoxShadow(
                            offset: Offset(0.0, 1.0),
                            blurRadius: 1.0,
                            spreadRadius: 0.0,
                            color: Colors.grey),
                      ]),
                ),
              )),
        )
      ],
    );
  }
}
