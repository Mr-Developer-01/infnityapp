// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/constant.dart';
import 'package:tribb/screens/constant/toast_message.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});

  final product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: ColorsClass.themeColor,
              ),
            ),
            child: IconButton(
              icon: const Icon(Icons.add_shopping_cart),
              onPressed: () {},
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () async {
                final SharedPreferences referGlobal =
                    await SharedPreferences.getInstance();
                var availablePoints = referGlobal.getInt("availablePointds");
                if (availablePoints! < (product['price'].toInt() * 50)) {
                  ToastMessages.errorMessage(context,
                      'You don\'t have enough points to purchase this product.');
                } else {
                  ToastMessages.successMessage(context, "Order Confirmed");
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                backgroundColor: ColorsClass.themeColor,
              ),
              child: Text(
                "Buy  Now".toUpperCase(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
