import 'package:deshii_mart/styling/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeTile extends StatelessWidget {
  const WelcomeTile({super.key, required this.title, required this.image});
  final String title;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: image,
      title: Padding(
        padding: const EdgeInsets.only(left: 25),
        child: Text(
          title,
          style: TextStyle(
              fontSize: 16,
              color: AppColors.grays,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

class FilterTile extends StatefulWidget {
  const FilterTile({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<FilterTile> createState() => _FilterTileState();
}

class _FilterTileState extends State<FilterTile> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
          activeColor: AppColors.greens,
          checkColor: AppColors.white,
          value: isChecked,
          onChanged: (bool? value) {
            setState(() {
              isChecked = value ?? false;
            });
          }),
      onTap: () {
        setState(() {
          isChecked = !isChecked;
        });
      },
      title: Text(
        widget.title,
        style: GoogleFonts.roboto(
          textStyle: TextStyle(fontSize: 16, color: AppColors.grays),
        ),
      ),
    );
  }
}

class CartTile extends StatefulWidget {
  final Image image;
  final String title;
  final String title1;
  final num price;
  final int quantity;
  final VoidCallback onRemove;

  const CartTile({
    super.key,
    required this.image,
    required this.title,
    required this.title1,
    required this.price,
    required this.quantity,
    required this.onRemove,
  });

  @override
  State<CartTile> createState() => _CartTileState();
}

class _CartTileState extends State<CartTile> {
  int quantity = 1;

  @override
  void initState() {
    super.initState();
    quantity = widget.quantity;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: widget.image,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: widget.onRemove,
              ),
            ],
          ),
          Text(
            widget.title1,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff7C7C7C),
            ),
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  if (quantity > 1) {
                    setState(() {
                      quantity--;
                    });
                    // Update quantity in Firebase (if needed)
                  }
                },
                icon: const Icon(Icons.remove, color: Color(0xff7c7c7c)),
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: Card(
                  color: Colors.white,
                  elevation: 2,
                  child: Center(
                    child: Text(
                      "$quantity",
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    quantity++;
                  });
                  // Update quantity in Firebase (if needed)
                },
                icon: const Icon(Icons.add, color: Color(0xff53B175)),
              ),
            ],
          ),
          Text(
            '\$${(widget.price * quantity).toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 20,
              color: Color(0xff181725),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutTile extends StatelessWidget {
  final String text;
  final String title;
  final IconData Icons;
  const CheckoutTile({
    super.key,
    required this.Icons,
    required this.text,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text),
        Text(title),
        IconButton(onPressed: () {}, icon: Icon(Icons))
      ],
    );
  }
}
