import 'package:deshii_mart/screens/productdetail_screen.dart';
import 'package:deshii_mart/styling/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String name;
  String description;
  String imageUrl;
  double price;
  String quantity;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory Product.fromMap(Map<String, dynamic> data, String documentId) {
    return Product(
      id: documentId,
      name: data['name'],
      description: data['description'],
      imageUrl: data['imageUrl'],
      price: (data['price'] as num).toDouble(),
      quantity: data['quantity'],
    );
  }
}

class CartItemss {
  final num price;
  final int quantity;
  final String weight;
  final String title;
  final String imageUrl;

  const CartItemss({
    required this.price,
    required this.quantity,
    required this.weight,
    required this.title,
    required this.imageUrl,
  });
}

class HomeScreen extends StatelessWidget {
  Future<void> _addToCart(BuildContext context, Product product) async {
    try {
      final cartRef = FirebaseFirestore.instance.collection('carts');

      CartItemss cartItem = CartItemss(
        price: product.price,
        quantity: 1,
        weight: product.quantity,
        title: product.name,
        imageUrl: product.imageUrl,
      );

      await cartRef.add({
        'title': cartItem.title,
        'price': cartItem.price,
        'quantity': cartItem.quantity,
        'weight': cartItem.weight,
        'imageUrl': cartItem.imageUrl,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${cartItem.title} added to cart!')),
      );
    } catch (e) {
      print('Error adding to cart: $e');
    }
  }

  Stream<List<Product>> getProductsFromFirestore() {
    return FirebaseFirestore.instance
        .collection('data')
        .snapshots()
        .map((QuerySnapshot query) {
      return query.docs.map((doc) {
        return Product.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 905,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildSearchBar(),
              _buildBanner(),
              _buildCategoryHeader(),
              Expanded(child: _buildProductGrid()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 30, left: 20),
          width: 33,
          height: 38,
          child: Image.asset("assets/images/carrot.png"),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30, left: 50),
          child: Icon(Icons.location_on, size: 24, color: AppColors.grays),
        ),
        Container(
          margin: const EdgeInsets.only(top: 30),
          child: Text(
            "Dhaka,Banassre",
            style: TextStyle(fontSize: 20, color: AppColors.grays),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SearchBar(
        backgroundColor: const WidgetStatePropertyAll(Colors.white),
        elevation: const WidgetStatePropertyAll(2),
        padding: const WidgetStatePropertyAll(
            EdgeInsets.only(left: 12, right: 12, top: 0)),
        trailing: [
          Icon(
            Icons.search,
            color: AppColors.grays,
            size: 23,
          )
        ],
        hintText: 'Search Store',
        shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
        hintStyle: WidgetStatePropertyAll(
            TextStyle(color: AppColors.grays, fontSize: 18)),
      ),
    );
  }

  Widget _buildBanner() {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: 114,
      child: Image.asset("assets/images/ban.png"),
    );
  }

  Widget _buildCategoryHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 30),
          child: const Text(
            "Exclusive Offer",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 30),
          child: const Text(
            "See All",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xff53B175),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductGrid() {
    return StreamBuilder<List<Product>>(
      stream: getProductsFromFirestore(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No products available'));
        }

        List<Product> products = snapshot.data!;

        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            return _buildProductCard(context, products[index]);
          },
        );
      },
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              price: product.price,
              quantity: int.parse(product.quantity),
              weight: 'kg',
              title: product.name,
              imageUrl: product.imageUrl,
            ),
          ),
        );
      },
      child: SizedBox(
        height: 248,
        width: 173,
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Text('Waiting');
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${product.quantity}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColors.grays),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4, right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${product.price.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            height: 45,
                            width: 45,
                            decoration: BoxDecoration(
                                color: AppColors.greens,
                                borderRadius: BorderRadius.circular(17)),
                            child: IconButton(
                                onPressed: () => _addToCart(context, product),
                                icon: const Icon(
                                  Icons.add,
                                  size: 18,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
