// ignore_for_file: prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_null_comparison

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/properties/property_details.dart';

class Myproperty extends StatefulWidget {
  const Myproperty({super.key});

  @override
  State<Myproperty> createState() => _MypropertyState();
}

class _MypropertyState extends State<Myproperty> {
  var propertydata = [];
  bool isLoadingMode = false;

  getRentedPropertyRecords() async {
    var rentedPropertyIds = [];
    final usersRef = FirebaseFirestore.instance.collection('allproperties');
    final userDoc = await usersRef.doc('propertyTypes').get();
    final forRentData = userDoc.reference
        .collection('for_rent')
        .where("user-Id", isEqualTo: FirebaseAuth.instance.currentUser!.uid);
    var forRentList = await forRentData.get();
    for (var element in forRentList.docs) {
      rentedPropertyIds.add(element.data()['property-Id']);
    }
    getPropertyData(rentedPropertyIds);
  }

  getPropertyData(var ids) async {
    setState(() {
      isLoadingMode = true;
      propertydata = [];
    });
    var tempDataList = [];
    try {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('properties');
      reference.snapshots().listen((querySnapshot) {
        final allData = querySnapshot.docs.map((doc) {
          var data = {};
          data = doc.data() as Map<dynamic, dynamic>;
          data['id'] = doc.id;
          return data;
        }).toList();
        setState(() {
          tempDataList = allData;
        });
        for (var element in tempDataList) {
          if (element['user-id'].toString() ==
              (FirebaseAuth.instance.currentUser!.uid).toString()) {
            element['Rented'] = false;
            if (ids.contains(element['id'].toString())) {
              element['Rented'] = true;
            }
            propertydata.add(element);
          }
        }
        setState(() {
          isLoadingMode = false;
        });
      });
    } catch (e) {
      debugPrint('Error ::::::::::::::::: $e');
      setState(() {
        isLoadingMode = false;
      });
    }
  }

  @override
  void initState() {
    getRentedPropertyRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: ColorsClass.themeColor, //change your color here
          ),
          title: Text('My Properties',
              style: TextStyle(
                  color: ColorsClass.themeColor, fontWeight: FontWeight.bold)),
          centerTitle: true,
          actions: const [
            // IconButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => const AddNewProperty()),
            //       );
            //     },
            //     icon: const Icon(
            //       Icons.add,
            //     ))
          ],
        ),
        body: !isLoadingMode
            ? propertydata.isEmpty
                ? const Center(
                    child: Text('No records to display.'),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: SizedBox(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: propertydata.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PropertyDetailsPage({
                                              "title": propertydata[index]
                                                  ['title'],
                                              "image": propertydata[index]
                                                  ['image'],
                                              "location": propertydata[index]
                                                  ['address'],
                                              "price": propertydata[index]
                                                  ['price'],
                                              "rating": '4.9',
                                              "page_type": 'myproperties',
                                            })),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: ConstrainedBox(
                                      constraints: const BoxConstraints(
                                        minHeight: 100,
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            child: Padding(
                                              padding: const EdgeInsets.only(),
                                              child: Image.memory(
                                                base64Decode(propertydata[index]
                                                    ['image']!),
                                                height: 165,
                                                width: double.infinity,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, right: 10, bottom: 5),
                                            child: Row(
                                              children: [
                                                Text(
                                                  propertydata[index]['title']
                                                      .toString()
                                                      .toUpperCase(),
                                                  style: TextStyle(
                                                    color:
                                                        ColorsClass.themeColor,
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const Spacer(),
                                                const Icon(
                                                  Icons.star,
                                                  color: Colors.amber,
                                                ),
                                                Align(
                                                  alignment: Alignment.topRight,
                                                  child: Text(
                                                    '4.9',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorsClass
                                                          .themeColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.location_on,
                                                        color: ColorsClass
                                                            .themeColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        // overflow: TextOverflow.ellipsis,
                                                        propertydata[index]
                                                                ['address']
                                                            .toString()
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                          color: ColorsClass
                                                              .themeColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                // Spacer(),
                                                Flexible(
                                                  child: Text(
                                                    '₹ ${propertydata[index]['price']!}',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: ColorsClass
                                                          .themeColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10,
                                                right: 10,
                                                bottom: 10),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Flexible(
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.business_sharp,
                                                        color: ColorsClass
                                                            .themeColor,
                                                      ),
                                                      const SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        propertydata[index]
                                                            ['area']!,
                                                        style: TextStyle(
                                                          color: ColorsClass
                                                              .themeColor,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                propertydata[index]['Rented']
                                                    ? Flexible(
                                                        child: Image.asset(
                                                        'assets/images/for-rent-lable.png',
                                                        height: 25,
                                                      ))
                                                    : const Center()
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            })),
                  )
            : const Center(
                child: CircularProgressIndicator(),
              ));
  }
}
