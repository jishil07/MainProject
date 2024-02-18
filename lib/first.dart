import 'dart:async';
import 'package:flutter/material.dart';
import 'package:homeline/second.dart';
import 'package:homeline/seventh.dart';

// ignore: must_be_immutable
class Homescreen extends StatefulWidget {
  var email;
  Homescreen({required this.email});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    widget.email == null ? Secondscreen() : Seventhscreen())));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/homeline.png"),
            SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
