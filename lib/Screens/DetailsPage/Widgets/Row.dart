import 'package:flutter/material.dart';


class rowWidget extends StatelessWidget {
  String Title,SubTitle;
   rowWidget({Key? key,
  required this.Title,
  required this.SubTitle
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
            child: SizedBox(
              width: 100,
              child: Text(SubTitle,
                style: const TextStyle(
                    color: Colors.deepOrange,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,

                ),),
            ),
          ),
        ],
      ),
    );
  }
}
