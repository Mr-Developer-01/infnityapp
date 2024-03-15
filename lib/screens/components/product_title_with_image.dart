// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/constant.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({super.key, required this.product});

  final  product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            "",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            product['title'],
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: ColorsClass.themeColor, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                     TextSpan(text: "Price\n",style: TextStyle(color: ColorsClass.themeColor)),
                    TextSpan(
                      text: "${product['price'] * 50} Points",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                              color: ColorsClass.themeColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${product['id']}",
                  child: Image.network(
                    product['image'],
                    fit: BoxFit.fill,
                    height: 200,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
