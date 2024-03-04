import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:tribb/screens/constant/colors.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  var wishlistDataList = [];
Future<List<Map<String, dynamic>>> getDataForIds(List<String> ids) async {
  List<Map<String, dynamic>> documents = [];

  var usersRef = FirebaseFirestore.instance.collection('allproperties');
  var userDocRef = await usersRef.doc('propertyTypes').get();
  final ultraLuxuryData = userDocRef.reference.collection('ultra_luxury');
  final luxuryData = userDocRef.reference.collection('luxury');
  final premiumData = userDocRef.reference.collection('premium');
  var ultraLuxuryDocs = await ultraLuxuryData.get();
  var luxuryDocs = await luxuryData.get();
  var premiumDocs = await premiumData.get();
  for (var doc in ultraLuxuryDocs.docs) {
    if(ids.contains(doc.id)){
documents.add(doc.data());
    }
    
  }
  for (var doc in luxuryDocs.docs) {
   if(ids.contains(doc.id)){
documents.add(doc.data());
    }
  }
  for (var doc in premiumDocs.docs) {
    if(ids.contains(doc.id)){
documents.add(doc.data());
    }
  }
  print(documents);
setState(() {
  wishlistDataList = documents;
});
  return documents;
}
getWishlistData() async{
  List<String> tempList = [];
    final usersRef = FirebaseFirestore.instance.collection('allproperties');
    final userDoc = await usersRef.doc('propertyTypes').get();
    final wishlisaData = await userDoc.reference
        .collection('user_wish_list')
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (wishlisaData.docs.isNotEmpty) {
      for (var element in wishlisaData.docs) {
      tempList.add(element.data()['property_id']);
      }
    }
    if(tempList.isNotEmpty){
      getDataForIds(tempList);
    }
}
@override
  void initState() {
    getWishlistData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorsClass.themeColor
        ),
        title: Text('Wishlist'),
      ),
      body: Center(
        child: ListView.builder(
            itemCount: wishlistDataList.length,
            itemBuilder: (BuildContext context, int index) {
              return GFCard(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                content: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: NetworkImage(
                                wishlistDataList[index]['image']!,
                              ),
                              fit: BoxFit.fill)),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          wishlistDataList[index]['title'].toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          wishlistDataList[index]['location'].toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(wishlistDataList[index]['price'].toString()),
                      ],
                    )
                  ],
                ),
                buttonBar: GFButtonBar(
                  alignment :WrapAlignment.end,
                  crossAxisAlignment: WrapCrossAlignment.end,
                  runAlignment :WrapAlignment.end,
                  spacing: 0, children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                        label: const Text('Remove')),
                  ),
                ]),
              );
            }),
      ),
    );
  }
}