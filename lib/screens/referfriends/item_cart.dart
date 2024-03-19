// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 100,
            child: Container(
              // padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: const BoxDecoration(
                  // color: Colors.red,
                  // color: ColorsClass.themeColor.withOpacity(0.5),
                  // borderRadius: BorderRadius.circular(16),
                  ),
              child: Center(
                child: Image.network(
                  product['image'],
                  // width: 100,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: Text(
              
              product['title'],
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: ColorsClass.themeColor.withOpacity(0.5),
              ),
            ),
          ),
          Text(
            "${product['price'].toInt() * 50} Points",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: ColorsClass.themeColor),
          )
        ],
      ),
    );
  }
}
