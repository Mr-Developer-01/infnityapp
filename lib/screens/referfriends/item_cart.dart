// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/constant.dart';


class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.product, required this.press});

  final  product;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(kDefaultPaddin),
              decoration: BoxDecoration(
                // color: ColorsClass.themeColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.network(product['image']),
             
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
            child: Text(
              // products is out demo list
              product['title'],
              style:  TextStyle(color: ColorsClass.themeColor.withOpacity(0.5),),
            ),
          ),
          Text(
            "${product['price'] * 50} Points",
            style:  TextStyle(fontWeight: FontWeight.bold,color: ColorsClass.themeColor),
          )
        ],
      ),
    );
  }
}
