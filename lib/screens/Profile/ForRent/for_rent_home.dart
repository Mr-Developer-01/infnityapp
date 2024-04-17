
// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/dropdown_menu.dart';
import 'package:tribb/screens/constant/input_field.dart';
import 'package:tribb/screens/constant/property_data.dart';
import 'package:tribb/screens/constant/toast_message.dart';

class ForRentPage extends StatefulWidget {
  const ForRentPage({super.key});

  @override
  State<ForRentPage> createState() => _ForRentPageState();
}

class _ForRentPageState extends State<ForRentPage> {
  final TextEditingController rentpermonth = TextEditingController();
  var propertyList = ['-- None --'];
  var objList = [];
  var ameenitiesList = [];
  bool isLoadingMode = false;
  var selectedProperty;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
    getPropertyNameForPropertyFields(rentedPropertyIds);
  }

  getPropertyNameForPropertyFields(var ids) async {
    var propertydata = [];
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
        propertydata = allData;
      });
      for (var element in propertydata) {
        if (element['user-id'].toString() ==
                (FirebaseAuth.instance.currentUser!.uid).toString() &&
            !ids.contains(element['id'].toString())) {
          propertyList.add(element['title']);
          objList.add({
            "Id": element['id'],
            "title": element['title'],
            "image": element['photo_Url'],
            "address": element['address'],
            "price": element['price'],
            "rating": element['rating']
          });
        }
      }
      if (propertyList.isNotEmpty) {
        var tempSet = propertyList.toSet();
        var tempObjSet = objList.toSet();

        setState(() {
          propertyList = tempSet.toList();
          objList = tempObjSet.toList();
        });
      }
    });
  }

  submitData() {
    if (ameenitiesList.any((element) => element['isSelected'] == true)) {
      setState(() {
        isLoadingMode = true;
      });
      var propertyDetails = objList
          .where((element) => element['title'] == selectedProperty)
          .toList();
      var dataObj = {
        "title": propertyDetails[0]['title'],
        "image": propertyDetails[0]['image'],
        "location": propertyDetails[0]['address'],
        "price": rentpermonth.text,
        "user-Id": FirebaseAuth.instance.currentUser!.uid,
        "property-Id": propertyDetails[0]['Id'],
        "rating": propertyDetails[0]['rating']
      };
      var usersRef = FirebaseFirestore.instance.collection('allproperties');
      var userDocRef = usersRef.doc('propertyTypes');
      var postsRef = userDocRef.collection('for_rent');
      var newRentRecord = postsRef.add(dataObj);
      newRentRecord.then((value) {
        setState(() {
          isLoadingMode = false;
        });
        ToastMessages.successMessage(context, 'Request has been submitted.');
        _formKey.currentState!.reset();
        setState(() {
          rentpermonth.text = '';
          for (var i = 0; i < ameenitiesList.length; i++) {
            ameenitiesList[i]['isSelected'] = false;
          }
        });
      }).onError((error, stackTrace) {
        setState(() {
          isLoadingMode = false;
        });
        ToastMessages.errorMessage(context, 'Something went wrong.');
      });
    } else {
      ToastMessages.warnigMessage(
          context, 'Please select at least one amenity to proceed.');
    }
  }

  @override
  void initState() {
    setState(() {
      ameenitiesList = PropertyData.amenities;
    });
    getRentedPropertyRecords();
    // getPropertyNameForPropertyFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'List my home for rent',
          style: TextStyle(color: ColorsClass.themeColor),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                DropDownMenu(
                    Icons.location_city, 'Select Property', propertyList,
                    (value) {
                  setState(() {
                    selectedProperty = value.toString();
                  });
                }),
                const SizedBox(
                  height: 20,
                ),
                TextFeildWidget(rentpermonth, Icons.currency_rupee_sharp,
                    "Rent per month", false, TextInputType.number),
                const SizedBox(
                  height: 20,
                ),
                headerText('Amenities & Features'),
                amenitiesAndfeaturesCard(),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: !isLoadingMode
                        ? Container(
                            decoration: BoxDecoration(
                                color: ColorsClass.themeColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsClass.themeColor,
                                elevation: 0,
                              ),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  submitData();
                                }
                              },
                              child: const Text("    Submit     ",
                                  style: TextStyle(color: Colors.white)),
                            ))
                        : const CircularProgressIndicator(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget amenitiesAndfeaturesCard() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
              height: 350,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    for (int i = 0; i < ameenitiesList.length; i++)
                      Row(
                        children: [
                          GFCheckbox(
                            onChanged: (value) {
                              setState(() {
                                ameenitiesList[i]['isSelected'] =
                                    ameenitiesList[i]['isSelected'] == true
                                        ? false
                                        : true;
                              });
                            },
                            value: ameenitiesList[i]['isSelected'] as bool,
                            activeBgColor: ColorsClass.themeColor,
                          ),
                          Text(
                            ameenitiesList[i]['name'].toString(),
                            style: TextStyle(color: ColorsClass.themeColor),
                          )
                        ],
                      )
                  ],
                ),
              )),
        ),
      ],
    );
  }

  Widget headerText(text) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: ColorsClass.fillColor,
      height: 50,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            text,
            style: TextStyle(
                color: ColorsClass.themeColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
