//import 'dart:convert';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/home/track_issue.dart';
//import 'package:intl/intl.dart';
//import 'package:http/http.dart' as http;
//=============================================================================

class CustomerSupport extends StatelessWidget {
  const CustomerSupport({super.key});

  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title:  Text('Support',style: TextStyle(color: ColorsClass.themeColor,fontWeight: FontWeight.bold)),
            centerTitle: true,
            bottom: const TabBar(tabs: [
              Tab(text: 'New Request'),
              Tab(text: 'Track Issue'),
              // Tab(text: 'Refer A Friend'),
            ]),
          ),
          body: const TabBarView(children: [
            SupportForm(),
            TrackIssuesForm(),
            // ReferAFriendPage(),
          ])));
}
//=============================================================================

class SupportForm extends StatefulWidget {
  const SupportForm({super.key});

  @override
  SupportFormState createState() => SupportFormState();
}

class SupportFormState extends State<SupportForm> {
  TextEditingController subject = TextEditingController();
  TextEditingController remarksValue = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var subCat = '';
  var category = '';
  var property = '';
  var propertyList = ['Test 2', '01-Test', 'Test 3'];
  var categoryList = ['CRM', 'Customer Care', 'Home Loan'];
  var subCategory = [
    'Allotment letter-CBR',
    'BBA Schedule/Status',
    'BBA Receipt-CBR'
  ];

  String selectedPropertyValue = '-- None --';
  var propertyValue = ['-- None --', 'Prop1', 'Prop2', 'Prop3', 'Prop4'];
  String selectedCategory = '-- None --';
  var categoryValue = ['-- None --', 'CRM', 'Customer Care', 'Home Loan'];
  String selectedSubCategory = '-- None --';
  var subCategoryValue = [
    '-- None --',
    'Allotment Letter-CBR',
    'BBA Schedule/Status',
    'BBA Receipt-CBR'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 0, left: 5.0, right: 5.0, bottom: 0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(
                top: 0, left: 8.0, right: 8.0, bottom: 0),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration:  InputDecoration(
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
                      hintText: 'Subject',
                     
                      //labelText: 'Subject',
                      //isDense: true,
                      hintStyle: TextStyle(
                        color: ColorsClass.themeColor,
                        fontSize: 14,
                      ),
                      contentPadding: const EdgeInsets.only(left: 10, right: 15),
                    ),
                    onChanged: (value) {
                      setState(() {
                        subject.text = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField2(
                    items:
                        (propertyList.isNotEmpty ? propertyList : propertyList)
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        category = value.toString();
                      });
                    },
                    decoration:  InputDecoration(
                      filled: true,
                      fillColor: ColorsClass.fillColor,
                      hintText: 'Select Property',
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 15,
                      ),
                      hintStyle: TextStyle(
                        color: ColorsClass.themeColor,
                        fontSize: 14,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    isExpanded: true,
                    iconStyleData:  IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: ColorsClass.themeColor,
                      ),
                      iconSize: 20,
                    ),
                    buttonStyleData: const ButtonStyleData(
                      height: 45,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField2(
                    items:
                        (categoryList.isNotEmpty ? categoryList : categoryList)
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        category = value.toString();
                      });
                    },
                    decoration:  InputDecoration(
                      filled: true,
                      fillColor: ColorsClass.fillColor,
                      hintText: 'Select Category',
                      //labelText: 'Select Category',
                      //isDense: true,
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 15,
                      ),
                      hintStyle: TextStyle(
                        color: ColorsClass.themeColor,
                        fontSize: 14,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    isExpanded: true,
                    //isDense: true,
                    iconStyleData:  IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                       color: ColorsClass.themeColor,
                      ),
                      iconSize: 20,
                    ),
                    buttonStyleData: const ButtonStyleData(
                      height: 45,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField2(
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          value == '-- None --') {
                        return 'Please select a Sub-Category';
                      }
                      return null;
                    },
                    items: (subCategory.isNotEmpty ? subCategory : subCategory)
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        category = value.toString();
                      });
                    },
                    decoration:  InputDecoration(
                      filled: true,
                      fillColor: ColorsClass.fillColor,
                      hintText: 'Select Sub-Category',
                      //labelText: 'Select Sub-Category',
                      //isDense: true,
                      contentPadding: const EdgeInsets.only(
                        left: 10,
                        right: 15,
                      ),
                      hintStyle: TextStyle(
                        color: ColorsClass.themeColor,
                        fontSize: 14,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                    isExpanded: true,
                    iconStyleData:  IconStyleData(
                      icon: Icon(
                        Icons.arrow_drop_down,
                        color: ColorsClass.themeColor,
                      ),
                      iconSize: 20,
                    ),
                    buttonStyleData: const ButtonStyleData(
                      height: 45,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  
                  TextFormField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration:  InputDecoration(
                      alignLabelWithHint: true,
                      filled: true,
                      fillColor: ColorsClass.fillColor,
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      hintText: 'Description',
                      //labelText: 'Description',
                      hintStyle: TextStyle(
                        color: ColorsClass.themeColor,
                        fontSize: 14,
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        remarksValue.text = value;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                 
                  Center(
                      child: Container(
                        decoration: BoxDecoration(
                            color: ColorsClass.themeColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsClass.themeColor,
                            elevation: 0,
                          ),
                          onPressed: () {
                          },
                          child: const Text("    Submit     ",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}