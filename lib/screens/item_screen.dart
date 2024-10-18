import 'package:flutter/material.dart';

class Itemcontainer extends StatelessWidget {
  final num price;
  final String weight;
  final int quantity;
  final String title;
  final NetworkImage image;
  const Itemcontainer(
      {super.key,
      required this.price,
      required this.quantity,
      required this.title,
      required this.image,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 173,
      height: 248,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(width: 1, color: Colors.grey.shade400)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 97,
                  height: 85,
                  decoration: BoxDecoration(
                      image:
                          DecorationImage(image: image, fit: BoxFit.contain)))),
          Container(
            margin: EdgeInsets.only(top: 20, left: 10),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "$quantity$weight,Priceg",
              style: TextStyle(fontSize: 14, color: Color(0xff7C7C7C)),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "\$ $price",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Image.asset("assets/login/Group 6813.png"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
