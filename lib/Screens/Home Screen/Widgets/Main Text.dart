import 'package:flutter/material.dart';

class MainText extends StatelessWidget {
  const MainText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: Text(
        "Know More About The Country",
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 28,
          fontFamily: "Lora",
          color: Colors.deepOrangeAccent,
          letterSpacing: 1.5
        ),
      ),
    );
  }
}
