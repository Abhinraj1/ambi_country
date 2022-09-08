import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/CountryModel.dart';



CountryModel countryModel = CountryModel();

class Fetch {
  Future<CountryModel?> GetData( String Country) async {

    var url = Uri.parse("https://restcountries.com/v3.1/name/$Country");
    var response = await http.get(url);
    List data = jsonDecode(response.body.toString());
    // countryModel.add(data);

    if (response.statusCode == 200) {
      for (Map i in data) {


        countryModel = CountryModel(
            Capital: i["capital"].toString(),
            OfficialName: i["name"]["official"].toString(),
            Currency: i["currencies"].toString().substring(0,5),
            Region: i["region"].toString(),
            Flag: i["flags"]["png"].toString()


        );

        return countryModel;
      }
      //return countryModel;
    }
    else {
      return countryModel;
    }
  }
}

