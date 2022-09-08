import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class currency{

  Future<String>ExchangeToUSD(String currency)async{
 String url = currency.toLowerCase();
    Response data = await http.get(
        Uri.parse(
            "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/$url.json"));
    var body = jsonDecode(data.body)[url]["usd"];
    return body.toString();
  }



  Future<String>ExchangeToLocal(String currency,local)async{

    String url = currency.toLowerCase();
  String  localurl = local.toString().toLowerCase();
    Response data = await http.get(
        Uri.parse(
            "https://cdn.jsdelivr.net/gh/fawazahmed0/currency-api@1/latest/currencies/$url.json"));
    var body = jsonDecode(data.body)[url][localurl];
    return body.toString();
  }
}