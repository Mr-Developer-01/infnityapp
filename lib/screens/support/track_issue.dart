import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tribb/screens/constant/API/call_api.dart';
import 'package:tribb/screens/constant/colors.dart';

class TrackIssuesForm extends StatefulWidget {
  const TrackIssuesForm({super.key});

  @override
  State<TrackIssuesForm> createState() => _TrackIssuesState();
}

class _TrackIssuesState extends State<TrackIssuesForm> {

  var sortByList = ['Case Number', 'Status', 'Name'];
  var caseList = [
  ];
  var showListView = true;
  // ignore: prefer_typing_uninitialized_variables
  var caseDetail;
  // ignore: prefer_typing_uninitialized_variables
  var arrow;
  // ignore: prefer_typing_uninitialized_variables
  var propertyText;
  bool isLoadingMode = false;
  getAllcase()async{
    setState(() {
      isLoadingMode = true;
    });
  final usersRef = await FirebaseFirestore.instance
        .collection('users')
        .where("uId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (usersRef.docs.isNotEmpty) {
      var response = await CallAPIs.createPostRequest('TribbAppAPI', {
        'con': {"Id": usersRef.docs[0]['SF_Id'],"FirstName":"Case Record"}
      });
      var jsonData = jsonDecode(response);
      for (var element in jsonData) {
        DateTime originalDate = DateTime.parse(element['CreatedDate']);
        String formattedDate = DateFormat('dd/MM/yyyy').format(originalDate);
        var listElement = {
        "name":element['CaseNumber'],
        "status":element['Status'],
        "date":formattedDate,
        "subject":element['Subject'],
        "description":element['Description'],
      };
      setState(() {
        isLoadingMode = false;
      });
      caseList.add(listElement);
      }
  }else{
    setState(() {
        isLoadingMode = false;
      });
  }
  }
@override
  void initState() {
    getAllcase();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height / 1.1,
      width: MediaQuery.of(context).size.width,
      child: showListView == true
          ? !isLoadingMode?caseList.isEmpty?const Center(child: Text('No Record to display'),): Padding(
              padding: const EdgeInsets.all(18.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 1.7,
      
                child: ListView.builder(
                    itemCount: caseList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17.0),
                        ),
                        shadowColor: const Color.fromARGB(255, 2, 2, 2),
                        // elevation: 8,
                        color: Colors.white,
                        child: InkWell(
                          splashColor: ColorsClass.themeColor,
                          onTap: () {
                            debugPrint('Card tapped.');
                            setState(() {
                              showListView = false;
                              caseDetail = caseList[index];
                            });
                          },
                          child: Column(
                            
                            children: [
                               Padding(
                                padding: const EdgeInsets.only(
                                    //  left: 10,
                                    top: 20,
                                    right: 0,
                                    bottom: 5),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Align(
                                        child: Text(
                                          "Case No.",
                                          style: TextStyle(fontSize: 16,color: ColorsClass.themeColor),
                                        ),
                                      ),
                                    ),
                                   const Spacer(),
                                    Flexible(
                                      child: Text("Status:",style: TextStyle(color: ColorsClass.themeColor),),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    // left: 10,
                                    top: 5,
                                    right: 0,
                                    bottom: 20),
                                child: Row(
                                  children: [
                                    Flexible(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 15),
                                          child: Text(
                                            caseList[index]['name']
                                                .toString(),
                                            style:  TextStyle(
                                              color: ColorsClass.themeColor,
                                                fontSize: 16,
                                                fontWeight:
                                                    FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  const Spacer(),
                                    Flexible(
                                      child: Text(
                                        caseList[index]['status']
                                            .toString()
                                            .toUpperCase(),
                                        style: const TextStyle(
                                            color: Colors.red,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                               Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                           left: 25, bottom: 20),
                                        child: Text(caseList[index]['subject'],style: TextStyle(color: ColorsClass.themeColor,),),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // links(
                              //   context,
                              // )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ):const Center(child: CircularProgressIndicator(),)
          : Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          showListView = true;
                        });
                      },
                      icon:  Icon(Icons.arrow_back_rounded,color: ColorsClass.themeColor,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:30,left: 30,bottom: 30),
                    child: Row(
                      children: [
                         Text("Case No. ",style: TextStyle(color: ColorsClass.themeColor,),),
                        Text(
                          caseDetail['name'],
                          style:  TextStyle(
                            color: ColorsClass.themeColor,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                         Text("Date: ",style: TextStyle(color: ColorsClass.themeColor,),),
                        Text(
                          caseDetail['date'],
                          style:  TextStyle(
                            color: ColorsClass.themeColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                    ),
                    child: Text("Subject",style: TextStyle(color: ColorsClass.themeColor,),),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(
                      left: 30, top: 10
                      ),
                    child: Text(
                      caseDetail['subject'],
                      style: TextStyle(
                        color: ColorsClass.themeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(
                      left: 30, top: 30
                    ),
                    child: Text("Description",style: TextStyle(color: ColorsClass.themeColor,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30,  right: 40
                        ),
                    child: Container(
                      constraints: const BoxConstraints(
                          minHeight: 150, minWidth: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // border: Border.all(
                        //   color: ColorsClass.themeColor,
                        // ),
                      ),
                      child:  Padding(
                          padding: const EdgeInsets.only( top: 20,right: 20),
                          child: Text(caseDetail['description'],style: TextStyle(color: ColorsClass.themeColor,),)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                //   Padding(
                //   padding: const EdgeInsets.only(
                //       top: 8.0, left: 8.0, right: 8.0, bottom: 0),
                //   child: Center(
                //     child: Container(
                //       decoration: BoxDecoration(
                //           color: ColorsClass.themeColor,
                //           borderRadius: BorderRadius.circular(8)),
                //       child: CupertinoButton(
                //         color: ColorsClass.themeColor,
                //         onPressed: () {
                //         },
                //         child: const Text('Write A Feedback'),
                //       ),
                //     ),
                //   ),
                // ),
                ],
              ),
            ),
    );
  }
}