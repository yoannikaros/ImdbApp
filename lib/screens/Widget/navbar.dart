import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 21),
        width: 50,
        height: 27,
        child: Image.asset('assets/Logos.png'));
  }
}
