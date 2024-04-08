// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:tribb/screens/components/add_to_cart.dart';
import 'package:tribb/screens/components/counter_with_fav_btn.dart';
import 'package:tribb/screens/components/description.dart';
import 'package:tribb/screens/components/product_title_with_image.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/constant.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final  product;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      // each product have a color
      backgroundColor: ColorsClass.fillColor,
      appBar: AppBar(
        backgroundColor: ColorsClass.fillColor,
        elevation: 0,
        // leading: IconButton(
        //   icon: SvgPicture.asset(
        //     'assets/icons/back.svg',
        //     colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        //   ),
        //   onPressed: () => Navigator.pop(context),
        // ),
        // actions: <Widget>[
        //   IconButton(
        //     icon: SvgPicture.asset("assets/icons/search.svg"),
        //     onPressed: () {},
        //   ),
        //   IconButton(
        //     icon: SvgPicture.asset("assets/icons/cart.svg"),
        //     onPressed: () {},
        //   ),
        //   SizedBox(width: kDefaultPaddin / 2)
        // ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: size.height,
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.3),
                    padding: EdgeInsets.only(
                      top: size.height * 0.12,
                      left: kDefaultPaddin,
                      right: kDefaultPaddin,
                    ),
                    // height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        // ColorAndSize(product: product),
                        const SizedBox(height: kDefaultPaddin / 3),
                        Description(product: product),
                        const SizedBox(height: kDefaultPaddin / 3),
                        const CounterWithFavBtn(),
                        const SizedBox(height: kDefaultPaddin / 3),
                        AddToCart(product: product)
                      ],
                    ),
                  ),
                  ProductTitleWithImage(product: product)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
