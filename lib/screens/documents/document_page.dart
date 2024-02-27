import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/images.dart';
import 'package:tribb/screens/documents/documents_details.dart';

class DocumentPage extends StatefulWidget {
  const DocumentPage({super.key});

  @override
  State<DocumentPage> createState() => _DocumentPageState();
}

class _DocumentPageState extends State<DocumentPage> {
  var homeLoanDoc = [];
  var bookingDoc = [];
  var sdrDoc = [];
  var possessionDoc = [];
  @override
  void initState() {
    homeLoanDoc.add({
      "linkcontent": "For Home Loan credit score",
      "link":
          "https://www.cibil.com/?&channel=paid&cid=ppc:google:GNBDSA&gclid=EAIaIQobChMIv77shoPh9gIVxquWCh2Ngwr4EAAYASAAEgIJovD_BwE",
      "Name": null,
      "createdDate": null
    });
    homeLoanDoc.add({
      "linkcontent": "For EMI calculator",
      "link":
          "https://www.cibil.com/?&channel=paid&cid=ppc:google:GNBDSA&gclid=EAIaIQobChMIv77shoPh9gIVxquWCh2Ngwr4EAAYASAAEgIJovD_BwE",
      "Name": null,
      "createdDate": null
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents',
            style: TextStyle(
                color: ColorsClass.themeColor, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: 500,
              decoration:  BoxDecoration(
                image: DecorationImage(
                  // opacity: 0.4,
                  image: AssetImage(
                    Staticimages.bgImage,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(top: 150),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        flex: -2,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10, left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // boxShadow: [
                                      //     new BoxShadow(
                                      //       color: Colors.grey,
                                      //       blurRadius: 1.0,
                                      //     ),
        
                                      //   ],
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Card(
                                      child: Container(
                                        width: MediaQuery.of(context).size.width /
                                            2.30,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(10),
                                          // border: Border.all(color: Colors.grey)
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Flexible(
                                                  child: Image.asset(
                                                'assets/images/home-loan.png',
                                                color: ColorsClass.themeColor,
                                                height: 80,
                                              )),
                                              Text(
                                                'Home Loan',
                                                style: TextStyle(
                                                  color: ColorsClass.themeColor,
                                                  fontSize: 15,
                                                  fontFamily: "RALEWAY",
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          HomeLoan(homeLoanDoc, 'Home Loan'),
                                    ));
                                  },
                                ),
                                // const SizedBox(width: 5,),
                                GestureDetector(
                                  child: Card(
                                    child: Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width /
                                          2.30,
                                      decoration: BoxDecoration(
                                        // color: Colors.green,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        // border: Border.all(color: Colors.grey)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                                child: Image.asset(
                                              'assets/images/booking-form.png',
                                              color: ColorsClass.themeColor,
                                              height: 80,
                                            )),
                                            Text(
                                              'Booking Forms',
                                              style: TextStyle(
                                                color: ColorsClass.themeColor,
                                                fontSize: 15,
                                                fontFamily: "RALEWAY",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          HomeLoan(bookingDoc, 'Booking Forms'),
                                    ));
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: -2,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Card(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          2.30,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        // color: Colors.green,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        // border: Border.all(color: Colors.grey)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                                child: Image.asset(
                                              'assets/images/sdr-form.png',
                                              color: ColorsClass.themeColor,
                                              height: 80,
                                            )),
                                            Text(
                                              'SDR Forms',
                                              style: TextStyle(
                                                color: ColorsClass.themeColor,
                                                fontSize: 15,
                                                fontFamily: "RALEWAY",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          HomeLoan(sdrDoc, 'SDR Forms'),
                                    ));
                                  },
                                ),
                                // const SizedBox(width: 5,),
                                GestureDetector(
                                  child: Card(
                                    child: Container(
                                      height: 150,
                                      width: MediaQuery.of(context).size.width /
                                          2.30,
                                      decoration: BoxDecoration(
                                        // color: Colors.green,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.circular(10),
                                        // border: Border.all(color: Colors.grey)
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Flexible(
                                                child: Image.asset(
                                              'assets/images/possession-form.png',
                                              color: ColorsClass.themeColor,
                                              height: 80,
                                            )),
                                            Text(
                                              'Possession Forms',
                                              style: TextStyle(
                                                color: ColorsClass.themeColor,
                                                fontSize: 15,
                                                fontFamily: "RALEWAY",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => HomeLoan(
                                          possessionDoc, 'Possession Forms'),
                                    ));
                                  },
                                ),
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
          ],
        ),
      ),
    );
  }
}
