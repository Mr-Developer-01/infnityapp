// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/user.dart';
import 'package:tribb/widgets/colors_changer.dart';
import '../widget/button_widget.dart';
import '../widget/profile_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  var errorText = '';
  var userDetails;
  bool isEditMode = false;
  var profilePhoto;
  @override
  void initState() {
    // getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsClass.themeColor,
                  elevation: 0,
                ),
                onPressed: () async {
                  // final SharedPreferences sharedPreference =
                  //     await SharedPreferences.getInstance();
                  // sharedPreference.remove("username");
                  // sharedPreference.remove("password");
                  // // ignore: use_build_context_synchronously
                  // Navigator.pushReplacement(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const LoginPage()),
                  // );
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/app', (Route<dynamic> route) => false);
                },
                child:
                    const Text("Logout", style: TextStyle(color: Colors.white)),
              ),
              const Spacer(),
              // image == null
              ProfileWidget(
                imagePath: UserImage.uImage,
                onClicked: () async {},
                onChangePic: () async {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 100,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              // ListTile(
                              //             leading: Icon(Icons.photo_camera),
                              //             title: Text('Take Photo'),
                              //           ),
                              ListTile(
                                leading: Icon(
                                  Icons.folder_open,
                                  color: ColorsClass.themeColor,
                                ),
                                title: Text(
                                  'Select Photo',
                                  style: TextStyle(
                                    color: ColorsClass.themeColor,
                                  ),
                                ),
                                onTap: () {
                                  // getImage(ImageSource.gallery);
                                  // Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const Spacer(),
              IconButton(
                icon: Icon(
                  Icons.edit,
                  color: ColorsClass.themeColor,
                ),
                onPressed: () {
                  // setState(() {
                  //   // isEditMode = !isEditMode;
                  //   // errorText = '';
                  // });
                },
              ),
              const SizedBox(
                width: 5,
              )
            ],
          ),
          const SizedBox(height: 24),
          buildName(),
          const SizedBox(height: 10),
          //isEditMode ? buildUpgradeButton() : buildSaveButton()
        ],
      ),
    ));
  }

  Widget buildName() => Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorsClass.themeColor),
            ), //             <--- BoxDecoration here
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: ColorsClass.themeColor,
                  ),
                ),
                Text(
                  'Cloud Certitude',
                  style:
                      TextStyle(fontSize: 16.0, color: ColorsClass.themeColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorsClass.themeColor),
            ), //             <--- BoxDecoration here
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: ColorsClass.themeColor,
                  ),
                ),
                Text(
                  'Gurgaon',
                  style:
                      TextStyle(fontSize: 16.0, color: ColorsClass.themeColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorsClass.themeColor),
            ), //             <--- BoxDecoration here
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email Id",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: ColorsClass.themeColor,
                  ),
                ),
                !isEditMode
                    ? Text(
                        'user@cloudcertitude.com',
                        style: TextStyle(
                            fontSize: 16.0, color: ColorsClass.themeColor),
                      )
                    : Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: ColorsClass.themeColor,
                                  style: BorderStyle.solid)),
                          child: TextField(
                            controller: email,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                border: InputBorder.none),
                            onChanged: (value) {
                              // Do something
                            },
                          ),
                        )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            padding: const EdgeInsets.all(10.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorsClass.themeColor),
            ), //             <--- BoxDecoration here
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Contact",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: ColorsClass.themeColor,
                  ),
                ),
                !isEditMode
                    ? Text(
                        '1234567890',
                        style: TextStyle(
                            fontSize: 16.0, color: ColorsClass.themeColor),
                      )
                    : Padding(
                        //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  width: 1,
                                  color: ColorsClass.themeColor,
                                  style: BorderStyle.solid)),
                          child: TextField(
                            keyboardType: TextInputType.number,
                            controller: contact,
                            decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(15),
                                border: InputBorder.none),
                            onChanged: (value) {
                              // Do something
                            },
                          ),
                        )),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ColorChanger()),
              );
            },
            child: Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorsClass.themeColor),
              ), //             <--- BoxDecoration here
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 40,
                    child: Row(
                      children: [
                        Text(
                          'Change Theme',
                          style: TextStyle(
                              fontSize: 16.0, color: ColorsClass.themeColor),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: ColorsClass.themeColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            errorText,
            style: const TextStyle(color: Colors.red),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Reset Password',
        onClicked: () {
          // Navigator.pushReplacement(
          //   context,
          //   MaterialPageRoute(builder: (context) => const ChangePassword()),
          // );
        },
      );
  Widget buildSaveButton() => ButtonWidget(
        text: 'Save',
        onClicked: () {
          // checkValidation();
        },
      );
}
