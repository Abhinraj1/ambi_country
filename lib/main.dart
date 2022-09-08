import 'package:ambi_country/Screens/Home%20Screen/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:money_converter/Currency.dart';

import 'Screens/DetailsPage/DetailsScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AmbiBUZZ Country',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomeScreen(),
    );
  }
}
