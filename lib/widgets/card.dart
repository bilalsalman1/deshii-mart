import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  final double price;
  final String weight;
  final int quantity;
  final String title;
  final NetworkImage image;
  const Cards(
      {super.key,
      required this.image,
      required this.price,
      required this.quantity,
      required this.title,
      required this.weight});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 248,
      width: 180,
      child: Card(
        elevation: 3,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Center(child: Image(image: AssetImage('$image'))),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 10),
              child: Text(
                title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                '$quantity$weight ,Priceg',
                style: TextStyle(
                  fontSize: 14,
                  // color: AppColors.gradientgrColor
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 13, top: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$$price',
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 43,
                    width: 43,
                    child: FloatingActionButton(
                        backgroundColor: const Color(0xff53B175),
                        onPressed: () {},
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
