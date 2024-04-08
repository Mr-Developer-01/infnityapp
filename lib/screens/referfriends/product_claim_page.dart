import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/constant.dart';
import 'package:tribb/screens/referfriends/details_screen.dart';
import 'package:tribb/screens/referfriends/item_cart.dart';
import 'package:http/http.dart' as http;

class ClaimedPointsPage extends StatefulWidget {
  const ClaimedPointsPage({super.key});

  @override
  State<ClaimedPointsPage> createState() => _ClaimedPointsPageState();
}

class _ClaimedPointsPageState extends State<ClaimedPointsPage> {
  var productsList = [];
  getProductsDataForAPI() async {
    final dataResponse = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    setState(() {
      productsList = jsonDecode(dataResponse.body);
    });
    return dataResponse;
  }

  @override
  void initState() {
    getProductsDataForAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'Products',
          style: TextStyle(color: ColorsClass.themeColor),
        ),
      ),
      body: productsList.isNotEmpty?Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GridView.builder(
                itemCount: productsList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: kDefaultPaddin,
                  crossAxisSpacing: kDefaultPaddin,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) => ItemCard(
                  product: productsList[index],
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        product: productsList[index],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,)
        ],
      ):const Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
