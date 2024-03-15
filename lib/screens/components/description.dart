// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/constant.dart';


class Description extends StatelessWidget {
  const Description({super.key, required this.product});

  final  product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        // maxLines:,
        product['description'],
         maxLines: 10,
          overflow: TextOverflow.ellipsis,
        style: const TextStyle(height: 1.5),
      ),
    );
  }
}
