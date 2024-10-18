import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deshii_mart/model/tiles.dart';
import 'package:deshii_mart/styling/appcolors.dart';
import 'package:deshii_mart/widgets/button_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
        backgroundColor: AppColors.white,
        elevation: 0,
      ),
      body: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('carts').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }

                final cartItems = snapshot.data!.docs;

                if (cartItems.isEmpty) {
                  return const Center(
                    child: Text(
                      "Your cart is empty.",
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  );
                }

                return SizedBox(
                  height: 650,
                  width: double.infinity,
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8.0),
                    itemCount: cartItems.length,
                    itemBuilder: (context, index) {
                      var item = cartItems[index];
                      return CartTile(
                        image: Image.network(
                          item['imageUrl'],
                          // width: 100,
                          // height: 100,
                          fit: BoxFit.cover,
                        ),
                        title: item['title'],
                        title1:
                            '${item['quantity']} x ${item['weight']}, Price',
                        price: item['price'],
                        quantity: item['quantity'],
                        onRemove: () async {
                          await FirebaseFirestore.instance
                              .collection('carts')
                              .doc(item.id)
                              .delete();
                        },
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Button(
                      text: 'Go to Checkout',
                      onPressed: () {
                        _showBottomSheet(context);
                      },
                      backgroundColor: AppColors.greens),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (BuildContext context) {
      return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Bottom Sheet Title',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('This is a bottom sheet! You can add any widget here.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the bottom sheet
              },
              child: Text('Close Bottom Sheet'),
            ),
          ],
        ),
      );
    },
  );
}
