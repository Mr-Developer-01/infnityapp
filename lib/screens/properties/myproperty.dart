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
  var projectList = [

    {
      "name": "CONSCIENT HINES ELEVATE",
      "rating": "4.9",
      "location": "Gurgaon",
      "area": "2095 – 3395 Sq. Ft.",
      "amount": "3.87 Cr",
      "image":
          "https://i.pinimg.com/564x/60/44/ed/6044edd88afec0f09dbe0c6e50df27e4.jpg"
    },
    {
      "name": "TRUMP TOWER",
      "rating": "4.9",
      "location": "Gurgaon",
      "area": "3525 – 6050 Sq. Ft.",
      "amount": "8.52 Cr",
      "image":
          "https://i.pinimg.com/564x/35/fc/08/35fc08f04ead397a85806147e2a9e4e6.jpg"
    },
    {
      "name": "MAHINDRA LUMINARE",
      "rating": "4.9",
      "location": "Gurgaon",
      "area": "3106 – 5187 Sq. Ft.",
      "amount": "5.20 Cr",
      "image":
          "https://i.pinimg.com/474x/1a/54/d9/1a54d98f61408e226a80506713cfea04.jpg"
    },
    {
      "name": "CENTRAL PARK BELLAVISTA",
      "rating": "4.9",
      "location": "Gurgaon",
      "area": "1065 – 1607 Sq. Ft.",
      "amount": "1.85 Cr",
      "image":
          "https://i.pinimg.com/564x/ee/a8/89/eea889eab390905a6104690e2de31237.jpg"
    },
  ];
  getPropertyData() async {
    setState(() {
      isLoadingMode = true;
      propertydata = [];
    });
    var tempDataList = [];
    try {
    CollectionReference reference =
        FirebaseFirestore.instance.collection('properties');
    reference.snapshots().listen((querySnapshot) {
        final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
        setState(() {
          tempDataList = allData;
        });
        for (var element in tempDataList) {
        if (element['user-id'].toString() ==
            (FirebaseAuth.instance.currentUser!.uid).toString()) {
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
    getPropertyData();
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
        actions:  const [
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
      body: !isLoadingMode?propertydata.isEmpty?Center(child: Text('No records to display.'),): Padding(
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
                                      "title":propertydata[index]['title'],
                                      "image":propertydata[index]['image'],
                                      "location":propertydata[index]['address'],
                                      "price":propertydata[index]['price'],
                                      "rating":'4.9',
                                      "page_type":'myproperties',

                                    })),
                          );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Card(
                        clipBehavior:
                            Clip.antiAlias, 
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
                                   base64Decode(propertydata[index]['image']!),
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
                                      propertydata[index]['title'].toString().toUpperCase(),
                                      style: TextStyle(
                                        color: ColorsClass.themeColor,
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
                                          fontWeight: FontWeight.bold,
                                          color: ColorsClass.themeColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: ColorsClass.themeColor,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            // overflow: TextOverflow.ellipsis,
                                            propertydata[index]['address'].toString().toUpperCase(),
                                            style: TextStyle(
                                              color: ColorsClass.themeColor,
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
                                          fontWeight: FontWeight.bold,
                                          color: ColorsClass.themeColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.business_sharp,
                                      color: ColorsClass.themeColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        propertydata[index]['area']!,
                                        style: TextStyle(
                                          color: ColorsClass.themeColor,
                                        ),
                                      ),
                                    ),
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
      ):const Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
