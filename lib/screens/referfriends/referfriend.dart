// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/API/call_api.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/custom_bottom_bar.dart';
import 'package:share/share.dart';
import 'package:tribb/screens/constant/toast_message.dart';
//import 'package:http/http.dart' as http;
//import '../../Global_Data/custombottombar_page.dart';
//import '../../Global_Data/image.dart';

class ReferAFriendPage extends StatefulWidget {
  const ReferAFriendPage({super.key});

  @override
  State<ReferAFriendPage> createState() => _ReferAFriendPageState();
}

class _ReferAFriendPageState extends State<ReferAFriendPage> {
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isLoadingMode = false;
  var referCode = '';
  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }

  handleSubmitForm() async {
    setState(() {
      isLoadingMode = true;
    });
    var formData = {
      "FirstName": firstName.text,
      "LastName": lastName.text,
      "Email": email.text,
      "MobilePhone": mobileNumber.text,
      "LeadSource": "Customer Referral",
      "Referral_Id__c": referCode
    };
     var response = await CallAPIs.createPostRequest(
        'ReferFriendAPI', {'leadData': formData});
    if (response.contains('Record Save Successfully')) {
      setState(() {
        isLoadingMode = false;
      });
      ToastMessages.successMessage(context, 'Request has been submitted.');
      setNulllValues();
    } else {
      setState(() {
        isLoadingMode = false;
      });
      ToastMessages.errorMessage(context, 'Something went wrong.try again later');
    }
  }

  setNulllValues() {
    firstName.text = '';
    lastName.text = '';
    email.text = '';
    mobileNumber.text = '';
    address.text = '';
  }
getReferralCode()async{
   final usersRef = await FirebaseFirestore.instance
        .collection('users')
        .where("uId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (usersRef.docs.isNotEmpty) {
      setState(() {
        referCode = usersRef.docs[0]['referral_code'];
      });
    }
}
@override
  void initState() {
    getReferralCode();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Refer a friend",
            style: TextStyle(
                color: ColorsClass.themeColor, fontWeight: FontWeight.bold)),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
              ),
              child: Text(
                "Enter details for referral",
                style: TextStyle(
                  color: ColorsClass.themeColor,
                  fontSize: 16,
                  fontFamily: "ROBOTO",
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: firstName,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'This field is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'First Name',
                          filled: true,
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          fillColor: ColorsClass.fillColor,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .transparent), // Optional: You can set the borderSide color to transparent if you don't want an outline when not focused.
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                            right: 15,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: lastName,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'This field is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Last Name',
                          filled: true,
                          fillColor: ColorsClass.fillColor,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .transparent), // Optional: You can set the borderSide color to transparent if you don't want an outline when not focused.
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                            right: 15,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'This field is required';
                          } else if (!isEmail(value)) {
                            return 'Invalid email address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: ColorsClass.fillColor,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .transparent), // Optional: You can set the borderSide color to transparent if you don't want an outline when not focused.
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                            right: 15,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: mobileNumber,
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'This field is required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          filled: true,
                          fillColor: ColorsClass.fillColor,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .transparent), // Optional: You can set the borderSide color to transparent if you don't want an outline when not focused.
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                            right: 15,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: address,
                        keyboardType: TextInputType.multiline,
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Address',
                          // enabled: false,
                          filled: true,
                          fillColor: ColorsClass.fillColor,
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .transparent), // Optional: You can set the borderSide color to transparent if you don't want an outline when not focused.
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                            right: 15,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: !isLoadingMode
                            ? Container(
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8)),
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              ColorsClass.themeColor),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  const BorderRadius.all(
                                                      Radius.circular(8)),
                                              side: BorderSide(
                                                  color: ColorsClass
                                                      .themeColor)))),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState!.validate()) {
                                      handleSubmitForm();
                                    }
                                    
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Submit",
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ),
                              )
                            : const CircularProgressIndicator(),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                            child: Divider(
                          color: ColorsClass.themeColor,
                        )),
                        Text(
                          "OR",
                          style: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                        ),
                        Expanded(
                            child: Divider(
                          color: ColorsClass.themeColor,
                        )),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        ColorsClass.themeColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        side: BorderSide(
                                            color: ColorsClass.themeColor)))),
                            onPressed: () {
                              Share.share('https://cloudcertitudeprivatelimit8-dev-ed.develop.my.salesforce-sites.com/flutterApp/newUser?referral_code=$referCode');
                            },
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Share",
                                    style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
