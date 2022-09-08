import 'package:ambi_country/Screens/DetailsPage/Widgets/Image%20Slider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';


class ImageSearch{
 String APiUrl = "https://imsea.herokuapp.com/api/1?q=clouds";

  Future<String> Search(String weatherState) async{

    Response data = await http.get(Uri.parse("https://imsea.herokuapp.com/api/1?q=$weatherState"));
    var body = jsonDecode(data.body)["results"][1];

    return body.toString();

  }
}