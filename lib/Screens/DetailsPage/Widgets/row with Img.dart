import 'package:flutter/material.dart';


class rowWithImg extends StatelessWidget {
  String Title,Url;
  rowWithImg({Key? key,
    required this.Title,
    required this.Url
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [

          Padding(
            padding: const EdgeInsets.only(left: 20.0,top: 15),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(Title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5
                    ),),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 5.0,top: 15),
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 0.5,
                  color: Colors.deepOrangeAccent
                )
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 5.0,),
                child: Image.network(Url,
                height: 50,
                width: 80),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
