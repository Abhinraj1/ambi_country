import 'package:ambi_country/Screens/DetailsPage/DetailsScreen.dart';
import 'package:easy_autocomplete/easy_autocomplete.dart';
import "package:flutter/material.dart";

import '../../../Constants/Countries.dart';
import '../../../Model/CountryModel.dart';
import '../../../Services/Api Service.dart';

class SearchBar extends StatefulWidget {
  SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = TextEditingController();



 /// Future<CountryModel?> country = Fetch().GetData();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          padding: const EdgeInsets.only(left: 10.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                )
              ]),
          child: EasyAutocomplete(
              suggestions: countryList,
              controller: controller,
              cursorColor: Colors.orange,
              decoration: InputDecoration(
                  icon: const Icon(Icons.search, color: Colors.orange),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid)),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 0, horizontal: 10),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // ignore: prefer_const_constructors
                      borderSide: BorderSide(
                          width: 2,
                          color: Colors.orange[500]!,
                          style: BorderStyle.solid))),
              suggestionBuilder: (data) {
                if (data == "" ||
                    data.length < 4 ||
                    controller.text == "" ||
                    controller.text.length < 4) {
                  return const SizedBox();
                } else {
                  return Container(
                      margin: const EdgeInsets.all(1),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.orange[400],
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(data,
                          style: const TextStyle(color: Colors.white)));
                }
              },
              onSubmitted: (value) {
                print(" value SUbmitted ========== $value");
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context)=> DetailsScreen( CountrySelected: value,)));

              },

              ///onChanged: (value) => print(" value changed ========== $value")
          ),
        ));
  }
}
