import 'package:ambi_country/Screens/DetailsPage/Widgets/Country%20Title.dart';
import 'package:ambi_country/Screens/DetailsPage/Widgets/Row.dart';
import 'package:ambi_country/Screens/DetailsPage/Widgets/row%20with%20Img.dart';
import 'package:ambi_country/Services/Currency%20Exchange%20API.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import "package:flutter/material.dart";
import '../../Model/CountryModel.dart';
import '../../Services/Api Service.dart';
import '../../Services/User Country Api.dart';
import '../../Services/Weather Api.dart';
import 'Widgets/Image Slider.dart';





class DetailsScreen extends StatefulWidget {
  String CountrySelected;
  DetailsScreen({Key? key,
  required this.CountrySelected}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<CountryModel?> country,LocalCurrency;

  @override
  initState() {
    super.initState();


    country = Fetch().GetData(widget.CountrySelected);
    LocalCurrency = User().Country();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ClayContainer(
          spread: 20,
          borderRadius:15,
          depth: 50,
          parentColor: Colors.grey,
          color: Colors.white,
          height: 600,
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                    future: country,
                    builder: (context, snapshot) {
                      if(snapshot.data == null ){
                        return const CircularProgressIndicator();
                      }
                      String selectedCountryCurrency = snapshot.data!.Currency.toString().substring(1,
                            snapshot.data!.Currency!.length-1);
                      print("SELECTEDCURRENCY UPDATE HERE ============= $selectedCountryCurrency");


                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                         CountryTitle(CountrySelected: widget.CountrySelected),
                          rowWidget(Title: "Capital:",
                              SubTitle: snapshot.data!.Capital.toString().substring(1,
                                  snapshot.data!.Capital!.length-1)),
                          rowWithImg(Title: "Flag:",
                              Url: snapshot.data!.Flag.toString()),
                          rowWidget(Title: "Currency:",
                              SubTitle: snapshot.data!.Currency.toString().substring(1,
                                  snapshot.data!.Currency!.length-1)),
                          rowWidget(Title: "Region:",
                              SubTitle: snapshot.data!.OfficialName.toString()),
                          FutureBuilder(
                              future: weather().Get(snapshot.data!.Capital.toString().substring(1,
                                  snapshot.data!.Capital!.length-1)),
                              builder: (context, snapshot) {
                                if(snapshot.data == null ){
                                  return const SizedBox();
                                }
                                return Stack(
                                  children: [
                                    Align(
                                        alignment:Alignment.centerRight,
                                        child: ImageSlider(
                                          weatherStatus: snapshot.data!.weatherDescription.toString(),
                                        )),
                                    SizedBox(
                                      height: 100,
                                      child: Column(
                                        children: [
                                          rowWidget(Title: "Weather:",
                                              SubTitle: snapshot.data!.weatherDescription.toString()),
                                          rowWidget(Title: "Temperature:",
                                              SubTitle: snapshot.data!.tempFeelsLike.toString()),
                                        ],
                                      ),
                                    ),

                                  ],
                                );
                              }),
                          const SizedBox(
                            height: 40,
                          ),
                          CountryTitle(CountrySelected: "Currency Exchange"),
                          const SizedBox(
                            height: 20,
                          ),
                          FutureBuilder(
                              future: currency().ExchangeToUSD(
                                  snapshot.data!.Currency.toString().substring(1,4)),
                              builder: (context, snapshot) {
                                if(snapshot.data == null ){
                                  return const SizedBox();
                                }else if(snapshot.hasError){
                                  return Text(snapshot.hasError.toString());
                                }
                                return   Column(
                                  children: [

                                    rowWidget(Title: "To USD Currency", SubTitle: snapshot.data.toString() ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                );
                              }),
                          FutureBuilder(
                              future: LocalCurrency,
                              builder: (context, snapshot) {
                                if(snapshot.data == null ){
                                  return const SizedBox();
                                }
                                return Column(
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    FutureBuilder(
                                        future: User().CountryName(),
                                        builder: (context, snapshot) {
                                          if(snapshot.data == null ){
                                            return const SizedBox();
                                          }else if(snapshot.hasError){
                                            return Text(snapshot.hasError.toString());
                                          }
                                          return   CountryTitle(CountrySelected: "You Are From ${snapshot.data.toString()}");
                                        }),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    FutureBuilder(
                                        future: currency().ExchangeToLocal(
                                            selectedCountryCurrency,
                                            snapshot.data!.Currency.toString().substring(1,4)
                                        ),
                                        builder: (context, snapshot) {
                                          if(snapshot.data == null ){
                                            return const SizedBox();
                                          }else if(snapshot.hasError){
                                            return Text(snapshot.hasError.toString());
                                          }
                                          return   rowWidget(Title: "To Local Currency", SubTitle: snapshot.data.toString() );
                                        }),
                                  ],
                                );
                              }),

                        ],
                      );
                    }),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text("NOTE:Indian Currency Returned by Api Is USD\n please Check for other country using vpn",
                    style: TextStyle(
                      color: Colors.deepOrangeAccent,
                      fontSize: 10,
                      fontWeight: FontWeight.w400
                    ),)

              ],
            ),
          ),
        ),
      ),
    );
  }









}
