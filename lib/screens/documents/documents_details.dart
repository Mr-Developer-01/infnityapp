
import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomeLoan extends StatefulWidget {
  var documentsList = [];
  // ignore: prefer_typing_uninitialized_variables
  var title;

  HomeLoan(this.documentsList, this.title, {super.key});

  @override
  // ignore: no_logic_in_create_state
  State<HomeLoan> createState() => _HomeLoanState(documentsList, title);
}

class _HomeLoanState extends State<HomeLoan> {
  var documentList = [];
  // ignore: prefer_typing_uninitialized_variables
  var title;
  _HomeLoanState(this.documentList, this.title);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // ignore: prefer_typing_uninitialized_variables
  var userImage;
  double livepresent = 0.0;
  var showpresent = '0%';
  bool isFinished = true;
  @override
  void initState() {
    // getData();
    super.initState();
  }

  void showDownloadProgress(received, total) async {
    if (total != -1) {
      double present = double.parse((received / total).toStringAsFixed(1));
      setState(() {
        isFinished = false;
        livepresent = present;
        showpresent = '${(received / total * 100).toStringAsFixed(0)}%';
      });
      if (showpresent == '100%') {
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            isFinished = true;
          });
        });
      }
    }
  }

  openLink(url) {
    Uri url0 = Uri.parse(url);
    launchUrl(url0, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: cards(context));
  }

  Widget cards(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // endDrawer: const NavDrawer(),
      appBar: AppBar(
         iconTheme: IconThemeData(
    color: ColorsClass.themeColor, //change your color here
  ),
        centerTitle: true,
        title:  Text('Documents Details',style: TextStyle(color: ColorsClass.themeColor,fontWeight: FontWeight.bold)),
      
        actions: const <Widget>[
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration:  const BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          // image: DecorationImage(
          //     image: AssetImage(GlobalData.bgImage),
          //     fit: BoxFit.fitWidth),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // NotificationBar(userName: ''),
            // Align(
            //   alignment: Alignment.topLeft,
            //   child: IconButton(
            //     onPressed: () {
            //       Navigator.of(context).pop();
            //     },
            //     icon: const Icon(
            //       Icons.arrow_back,
            //       color: Colors.lightBlue,
            //     ),
            //   ),
            // ),
            !isFinished
                ? Text(showpresent != '100%'
                    ? 'Downloading File...$showpresent'
                    : 'Downloaded')
                : const Text(''),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    title,
                    style:
                         TextStyle(color: ColorsClass.themeColor, fontSize: 18),
                  ),
                )),
            Expanded(
              child: ListView.builder(
                  padding: const EdgeInsets.all(10),
                  itemCount: documentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        documentList[index]['Name'] != null?SizedBox(
                          height: 70,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Container(
                                    width: double.maxFinite,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color.fromARGB(
                                              255, 226, 223, 223), //New
                                          blurRadius: 5,
                                          spreadRadius: 2,
                                        )
                                      ],
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        // Navigator.of(context)
                                        //     .push(MaterialPageRoute(
                                        //   builder: (context) =>
                                        //       PdfViewer(documentList[index]['id']),
                                        // ));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Flexible(
                                                child: Text(
                                                    '${documentList[index]['Name']} ')),
                                            Flexible(
                                              child: Text(
                                                'Date - ${documentList[index]['createdDate']}',
                                                style:
                                                    const TextStyle(fontSize: 13),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlinedButton(
                                    onPressed: () {
                                      // var url =
                                      //     "${EndPoins.fileUrl}${documentList[index]['id']}";
                                      // var filename = documentList[index]['Name'];
                                      // download(url, filename);
                                    },
                                    style: OutlinedButton.styleFrom(
                                      // minimumSize: Size.fromWidth(15),

                                      side: const BorderSide(
                                        color: Colors.green,
                                      ),

                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                    ),
                                    child: const Text(
                                      'Download',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        ):
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             Padding(
                               padding: const EdgeInsets.only(left: 12),
                               child: Text(documentList[index]['linkcontent'],
                                  style:  TextStyle(
                                      color: ColorsClass.themeColor,
                                      decorationColor: ColorsClass.themeColor)),
                             ),
                            InkWell(
                                child:  Text(' Click here',
                                    style: TextStyle(
                                        color: ColorsClass.themeColor,
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                        decorationColor: ColorsClass.themeColor)),
                                onTap: () => {
                                      openLink(
                                          documentList[index]['link'])
                                    }),
                          ],
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: const CustomBottomBar(),
    );
  }
}
