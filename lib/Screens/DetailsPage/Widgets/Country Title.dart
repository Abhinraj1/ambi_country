import 'package:flutter/material.dart';

class CountryTitle extends StatelessWidget {
  String CountrySelected;
   CountryTitle({Key? key,
  required this.CountrySelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.circular(5)
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(CountrySelected,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 1.5
              ),),
          ),
        ),
      ),
    );
  }
}
