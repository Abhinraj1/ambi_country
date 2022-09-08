import 'package:ambi_country/Services/Image%20Search%20Api.dart';
import 'package:flutter/material.dart';
import 'package:mj_image_slider/mj_image_slider.dart';
import 'package:mj_image_slider/mj_options.dart';

class ImageSlider extends StatefulWidget {
  String weatherStatus;

   ImageSlider({Key? key,
     required this.weatherStatus

   }) : super(key: key);

  @override
  State<ImageSlider> createState() => _ImageSliderState();
}


class _ImageSliderState extends State<ImageSlider> {
 late Future<String> url;


  @override
  void initState() {
    super.initState();
    url = ImageSearch().Search(widget.weatherStatus) ;

  }


  @override
  Widget build(BuildContext context) {

    return

      FutureBuilder(
          future: url,
          builder: (context, snapshot) {
            if(snapshot.data == null ){
              return const SizedBox();
            }
            return  Container(
                margin: const EdgeInsets.only(top: 13,right: 5),
                width: 130,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                        color: Colors.deepOrangeAccent,
                        width: 1
                    )
                ),

                child: Opacity(
                  opacity: 0.6,
                  child: Image.network(snapshot.data.toString(),
                  fit: BoxFit.fill,
                  ),
                )
            );
          });




  }
}
