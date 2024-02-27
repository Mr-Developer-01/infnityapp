import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/custom_bottom_bar.dart';
import 'package:share/share.dart';
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
  var errorText = '';
  // Future handleReferMethod() async {
  //   log('test');
  //   var obj = {
  //     'first': firstName.text,
  //     'last': lastName.text,
  //     'email': email.text,
  //     'mobile': mobileNumber.text
  //   };
  //   final dataResponse = await http.post(
  //       Uri.parse('${Images.baseUrl}ReferFriend'),
  //       headers: {"Content-Type": "application/json"},
  //       body: jsonEncode({'obj': obj}));
  //   log(dataResponse.body);
  //   if (dataResponse.statusCode == 200) {
  //     log('Successful');
  //     log(dataResponse.body);
  //   }
  // }

  chackValidation() {
    if (firstName.text == '') {
      setState(() {
        errorText = 'Please fill First name';
      });
    } else if (lastName.text == '') {
      setState(() {
        errorText = 'Please fill Last name';
      });
    } else if (mobileNumber.text == '') {
      setState(() {
        errorText = 'Please fill Mobile number';
      });
    } else if (mobileNumber.text.length > 10 || mobileNumber.text.length < 10) {
      setState(() {
        errorText = 'Mobile number should be 10 digits';
      });
    } else if (email.text == '') {
      setState(() {
        errorText = 'Please fill Email address';
      });
    } else if (!isEmail(email.text)) {
      setState(() {
        errorText = 'Please enter correct Email Id';
      });
    } else {
      setState(() {
        errorText = '';
      });
      //handleReferMethod();
    }
  }

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
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
                      // readOnly: true,
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
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorsClass.themeColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(8)),
                                      side: BorderSide(
                                          color: ColorsClass.themeColor)))),
                          onPressed: () {
                            // chackValidation();
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Submit",
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                     Row(children: <Widget>[
                      Expanded(child: Divider(color: ColorsClass.themeColor,)),
                      Text("OR",style: TextStyle(
                        color: ColorsClass.themeColor,
                        fontSize: 14,
                      ),),
                      Expanded(child: Divider(color: ColorsClass.themeColor,)),
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
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  ColorsClass.themeColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          const BorderRadius.all(Radius.circular(8)),
                                      side: BorderSide(
                                          color: ColorsClass.themeColor)))),
                          onPressed: () {
                            Share.share('7BHE78');
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
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
