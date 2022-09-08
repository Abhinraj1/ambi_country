import 'package:ambi_country/Services/Api%20Service.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http/http.dart';

import '../Model/CountryModel.dart';


class User{

  Future<CountryModel?> Country() async {
    Response data = await http.get(Uri.parse('http://ip-api.com/json'));
     var body = jsonDecode(data.body);
    String country = body['country'].toString();

    var LocalCurrency = Fetch().GetData(country);

    return LocalCurrency;
  }
  Future<String> CountryName() async {
    Response data = await http.get(Uri.parse('http://ip-api.com/json'));
    var body = jsonDecode(data.body);
    String country = body['country'].toString();


    return country.toString();
  }
}