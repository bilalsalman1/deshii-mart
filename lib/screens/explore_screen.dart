import 'package:deshii_mart/model/explore.dart';
import 'package:deshii_mart/styling/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: AppColors.white,
          title: Text(
            'Find Products',
            style: GoogleFonts.roboto(
              textStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
          child: Column(
            children: [
              SizedBox(
                child: SearchBar(
                  backgroundColor: const WidgetStatePropertyAll(Colors.white),
                  elevation: const WidgetStatePropertyAll(2),
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.only(left: 12, right: 12, top: 0)),
                  leading: Icon(
                    Icons.search,
                    color: AppColors.grays,
                    size: 23,
                  ),
                  hintText: 'Search Store',
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
                  hintStyle: WidgetStatePropertyAll(
                      TextStyle(color: AppColors.grays, fontSize: 18)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: const [
                    Explore(
                        borderColor: Color(0xB253B175),
                        color: Color(0xff53B1751A),
                        image: Image(
                          image: AssetImage('assets/images/6.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Fresh Fruits \n& Vegetables'),
                    Explore(
                        borderColor: Color(0xB2F8A44C),
                        color: Color(0x1AF8A44C),
                        image: Image(
                          image: AssetImage('assets/images/1.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Cooking Oil \n& Ghee'),
                    Explore(
                        borderColor: Color(0xFFF7A593),
                        color: Color(0x40F7A593),
                        image: Image(
                          image: AssetImage('assets/images/5.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Meat & Fish'),
                    Explore(
                        borderColor: Color(0xFFD3B0E0),
                        color: Color(0x40D3B0E0),
                        image: Image(
                          image: AssetImage(
                            'assets/images/7.png',
                          ),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Bakery & Snacks'),
                    Explore(
                        borderColor: Color(0xFFFDE598),
                        color: Color(0x40FDE598),
                        image: Image(
                          image: AssetImage('assets/images/4.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Dairy & Eggs'),
                    Explore(
                        borderColor: Color(0xFFB7DFF5),
                        color: Color(0x40B7DFF5),
                        image: Image(
                          image: AssetImage('assets/images/2.png'),
                          height: 74,
                          width: 111,
                        ),
                        title: 'Beverages'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
