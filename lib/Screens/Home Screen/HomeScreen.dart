import 'package:ambi_country/Constants/Countries.dart';
import 'package:ambi_country/Model/CountryModel.dart';
import 'package:ambi_country/Screens/Home%20Screen/Widgets/Main%20Text.dart';
import 'package:ambi_country/Screens/Home%20Screen/Widgets/SearchBar.dart';
import 'package:ambi_country/Services/Api%20Service.dart';
import "package:flutter/material.dart";
import 'package:easy_autocomplete/easy_autocomplete.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          MainText(),
          const SizedBox(
            height: 20,
          ),
          SearchBar(),


        ],
      ),
    );
  }
}
