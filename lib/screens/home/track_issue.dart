import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';

class TrackIssuesForm extends StatefulWidget {
  const TrackIssuesForm({super.key});

  @override
  State<TrackIssuesForm> createState() => _TrackIssuesState();
}

class _TrackIssuesState extends State<TrackIssuesForm> {
  var sortByList = ['Case Number', 'Status', 'Name'];
  var caseList = [
    {'name': '12340099', 'status': 'Closed', 'date': '2/2/2023'},
    {'name': '56780088', 'status': 'Closed', 'date': '2/2/2023'},
    {'name': '90120077', 'status': 'open', 'date': '2/2/2023'},
    {'name': '90120066', 'status': 'open', 'date': '2/2/2023'},
    {'name': '90120055', 'status': 'open', 'date': '2/2/2023'}
  ];
  var showListView = true;
  // ignore: prefer_typing_uninitialized_variables
  var caseDetail;
  // ignore: prefer_typing_uninitialized_variables
  var arrow;
  // ignore: prefer_typing_uninitialized_variables
  var propertyText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: MediaQuery.of(context).size.height / 1.1,
      width: MediaQuery.of(context).size.width,
      child: showListView == true
          ? Padding(
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
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                           left: 25, bottom: 20),
                                        child: Text("This is the most important part of the case report; the part that will convince the journal that the case is publication worthy.",style: TextStyle(color: ColorsClass.themeColor,),),
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
            )
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
                    padding: const EdgeInsets.all(30),
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
                    child: Text("Concern Details",style: TextStyle(color: ColorsClass.themeColor,),),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      "BCC testing mail",
                      style: TextStyle(
                        color: ColorsClass.themeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.only(left: 30, top: 30),
                    child: Text("Description",style: TextStyle(color: ColorsClass.themeColor,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 30.0, top: 5, right: 40),
                    child: Container(
                      constraints: const BoxConstraints(
                          minHeight: 150, minWidth: 300),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: ColorsClass.themeColor,
                        ),
                      ),
                      child:  Padding(
                          padding: const EdgeInsets.only(left: 20, top: 20,right: 20),
                          child: Text("This is the most important part of the case report; the part that will convince the journal that the case is publication worthy.",style: TextStyle(color: ColorsClass.themeColor,),)),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, left: 8.0, right: 8.0, bottom: 0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                          color: ColorsClass.themeColor,
                          borderRadius: BorderRadius.circular(8)),
                      child: CupertinoButton(
                        color: ColorsClass.themeColor,
                        onPressed: () {
                        },
                        child: const Text('Write A Feedback'),
                      ),
                    ),
                  ),
                ),
                ],
              ),
            ),
    );
  }
}