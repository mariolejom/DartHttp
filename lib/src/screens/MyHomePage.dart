import 'dart:ffi';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: CustomGradientButton(
          text: Text("Ecuador"),
          width: 150,
          height: 40,
          gradientColors: [Colors.yellow, Colors.blue, Colors.red],
          initialPosition: Alignment.centerLeft,
          finalPosition: Alignment.centerRight,
          funcion: () => print("Hola desde Ambato."),
          leadingIcon: Icon(Icons.person),
          finalIcon: Icon(Icons.chat),
        ),
      ),
    );
  }
}

class CustomGradientButton extends StatelessWidget {
  final Text text;
  final double width;
  final double height;
  final List<Color> gradientColors;
  final Alignment initialPosition;
  final Alignment finalPosition;
  final Function funcion;
  final Icon leadingIcon;
  final Icon finalIcon;

  const CustomGradientButton(
      {Key key,
      @required this.text,
      @required this.width,
      @required this.height,
      @required this.gradientColors,
      @required this.initialPosition,
      @required this.finalPosition,
      @required this.funcion,
      this.leadingIcon,
      this.finalIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: funcion,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(height/2)),
            gradient: LinearGradient(
                colors: gradientColors,
                begin: initialPosition,
                end: finalPosition),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(-2, 2),
                blurRadius: height * .1,
                spreadRadius: 1,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            leadingIcon ?? Container(),
            text,
            finalIcon ?? Offstage(),
          ],
        ),
      ),
    );
  }
}
