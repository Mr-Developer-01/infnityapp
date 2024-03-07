import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getwidget/components/button/gf_button_bar.dart';
import 'package:getwidget/components/card/gf_card.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  var wishlistDataList = [];
  bool isLoadingMode = false;

  Future<List<Map<String, dynamic>>> getDataForIds(var ids) async {
    setState(() {
      wishlistDataList = [];
    });
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
      bool containsProId = ids.any((element) => element['proId'] == doc.id);
      if (containsProId) {
        var filteredList =
            ids.where((element) => element['proId'] == doc.id).toList();
        print(filteredList);
        documents.add({
          "data": doc.data(),
          "wishlistId": filteredList[0]['id'],
          "proId": filteredList[0]['proId']
        });
      }
    }
    for (var doc in luxuryDocs.docs) {
      bool containsProId = ids.any((element) => element['proId'] == doc.id);
      if (containsProId) {
        var filteredList =
            ids.where((element) => element['proId'] == doc.id).toList();
        print(filteredList);
        documents.add({
          "data": doc.data(),
          "wishlistId": filteredList[0]['id'],
          "proId": filteredList[0]['proId']
        });
      }
    }
    for (var doc in premiumDocs.docs) {
      bool containsProId = ids.any((element) => element['proId'] == doc.id);
      if (containsProId) {
        var filteredList =
            ids.where((element) => element['proId'] == doc.id).toList();
        print(filteredList);
        documents.add({
          "data": doc.data(),
          "wishlistId": filteredList[0]['id'],
          "proId": filteredList[0]['proId']
        });
      }
    }
    if (documents.isNotEmpty) {
      setState(() {
        wishlistDataList = documents;
        isLoadingMode = false;
      });
    }else{
      setState(() {
        wishlistDataList = [];
        isLoadingMode = false;
      });
    }

    print('wishlistDataList ${wishlistDataList}');
    return documents;
  }

  getWishlistData() async {
    setState(() {
      isLoadingMode = true;
    });
    var tempList = [];
    final usersRef = FirebaseFirestore.instance.collection('allproperties');
    final userDoc = await usersRef.doc('propertyTypes').get();
    final wishlisaData = await userDoc.reference
        .collection('user_wish_list')
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (wishlisaData.docs.isNotEmpty) {
      for (var element in wishlisaData.docs) {
        tempList
            .add({"id": element.id, "proId": element.data()['property_id']});
      }
    }
    print(tempList);
    if (tempList.isNotEmpty) {
      getDataForIds(tempList);
    } else {
      setState(() {
        wishlistDataList = [];
        isLoadingMode = false;
      });
    }
  }

  removeItemFromWishlist(var wishlistId) async {
    var usersRef = FirebaseFirestore.instance.collection('allproperties');
    var userDocRef = usersRef.doc('propertyTypes');
    var postsRef = userDocRef.collection('user_wish_list');
    var postDocRef = await postsRef.doc(wishlistId).get();
    try {
      await postDocRef.reference.delete();
      showToastMessage('Property removed from wish list');
      getWishlistData();
    } catch (e) {}
  }

  showToastMessage(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
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
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'Wishlist',
          style: TextStyle(color: ColorsClass.themeColor),
        ),
      ),
      body: Center(
        child: !isLoadingMode
            ? wishlistDataList.isEmpty
                ? const Text('Your wishlist is empty.')
                : ListView.builder(
                    itemCount: wishlistDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GFCard(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
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
                                        wishlistDataList[index]['data']
                                            ['image']!,
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
                                  wishlistDataList[index]['data']['title']
                                      .toString(),
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  wishlistDataList[index]['data']['location']
                                      .toString(),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(wishlistDataList[index]['data']['price']
                                    .toString()),
                              ],
                            )
                          ],
                        ),
                        buttonBar: GFButtonBar(
                            alignment: WrapAlignment.end,
                            crossAxisAlignment: WrapCrossAlignment.end,
                            runAlignment: WrapAlignment.end,
                            spacing: 0,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                    onPressed: () {
                                      PanaraConfirmDialog.show(
                                        context,
                                        title: "Are you sure?",
                                        message:
                                            "Do you realy want to remove this item.",
                                        confirmButtonText: "Confirm",
                                        cancelButtonText: "Cancel",
                                        color: ColorsClass.themeColor,
                                        onTapCancel: () {
                                          Navigator.pop(context);
                                        },
                                        onTapConfirm: () {
                                          Navigator.pop(context);
                                          removeItemFromWishlist(
                                              wishlistDataList[index]
                                                  ['wishlistId']);
                                        },
                                        panaraDialogType:
                                            PanaraDialogType.custom,
                                        barrierDismissible:
                                            false, // optional parameter (default is true)
                                      );
                                    },
                                    // icon: const Icon(Icons.delete),
                                    child: const Text('Remove')),
                              ),
                            ]),
                      );
                    })
            : const CircularProgressIndicator(),
      ),
    );
  }
}
