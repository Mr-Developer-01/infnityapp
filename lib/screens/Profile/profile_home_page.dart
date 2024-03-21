// ignore_for_file: use_build_context_synchronously, non_constant_identifier_names, must_be_immutable, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tribb/screens/Profile/edit_profile_page.dart';
import 'package:tribb/screens/Profile/wishlist_page.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/widgets/colors_changer.dart';

class ProfileHomePage extends StatefulWidget {
  const ProfileHomePage({super.key});

  @override
  ProfileHomePagePage createState() => ProfileHomePagePage();
}

class ProfileHomePagePage extends State<ProfileHomePage> {
  var base64Image;
  var profile_pic =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfBUN-KgxbARoHkAW0nmjoKhGuRSy3flEQMeulh4TRCGNuFv5LJh7MTmA3sV1MkIr9uGk&usqp=CAU';
  Future<void> _showMyDialog() async {
    PanaraConfirmDialog.show(
      context,
      title: "Are you sure?",
      message: "Are you sure you want to logout?",
      confirmButtonText: "Logout",
      cancelButtonText: "Cancel",
      color: ColorsClass.themeColor,
      onTapCancel: () {
        // Navigator.pop(context);
        Navigator.of(context, rootNavigator: true).pop();
      },
      onTapConfirm: () async {
        Navigator.of(context, rootNavigator: true).pop();
        await FirebaseAuth.instance.signOut();
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/app', (Route<dynamic> route) => false);
      },
      panaraDialogType: PanaraDialogType.custom,
      barrierDismissible: false, // optional parameter (default is true)
    );
  }

  getUserDetails() async {
    final usersRef = await FirebaseFirestore.instance
        .collection('users')
        .where("uId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (usersRef.docs.isNotEmpty) {
      setState(() {
        base64Image = usersRef.docs[0]['profile_pic'];
      });
    } else {}
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'Profile',
          style: TextStyle(color: ColorsClass.themeColor),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              // const SizedBox(height: 10),
              SizedBox(
                height: 125,
                width: 125,
                child: Stack(
                  fit: StackFit.expand,
                  clipBehavior: Clip.none,
                  children: [
                    base64Image == null
                        ? CircleAvatar(
                            backgroundImage: NetworkImage(profile_pic),
                          )
                        : GestureDetector(
                            child: CircleAvatar(
                              backgroundImage: MemoryImage(
                                  const Base64Decoder().convert(base64Image)),
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return RoundedPopup(base64Image);
                                },
                              );
                              // showModalBottomSheet(
                              //     isDismissible: false,
                              //     context: context,
                              //     builder: (BuildContext _) {
                              //       return Stack(
                              //         children: [
                              //          Container(

                              //           child: Image.memory(
                              //       const Base64Decoder().convert(base64Image)),
                              //          )
                              //         ],
                              //       );
                              //     });
                            },
                          ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ProfileMenu(
                text: "My Account",
                icon: "assets/icons/User Icon.svg",
                press: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EditProfilePage()),
                  )
                },
              ),

              ProfileMenu(
                text: "Settings",
                icon: "assets/icons/Settings.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Help Center",
                icon: "assets/icons/Question mark.svg",
                press: () {},
              ),
              ProfileMenu(
                text: "Wishlist",
                icon: "assets/icons/wishlist.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WishlistPage()),
                  );
                },
              ),
              ProfileMenu(
                text: "Change Theme",
                icon: "assets/icons/theme.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ColorChanger()),
                  );
                },
              ),
              LogoutButton(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () async {
                  _showMyDialog();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              // ignore: deprecated_member_use
              color: ColorsClass.themeColor,
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: TextStyle(color: ColorsClass.themeColor),
            )),
            text != 'Log Out'
                ? Icon(
                    Icons.arrow_forward_ios,
                    color: ColorsClass.themeColor,
                  )
                : const Center(),
          ],
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
    required this.text,
    required this.icon,
    this.press,
  }) : super(key: key);

  final String text, icon;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFFF5F6F9),
        ),
        onPressed: press,
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: 22,
              // ignore: deprecated_member_use
              color: ColorsClass.themeColor,
            ),
            const SizedBox(width: 20),
            Expanded(
                child: Text(
              text,
              style: TextStyle(color: ColorsClass.themeColor),
            )),
          ],
        ),
      ),
    );
  }
}

class RoundedPopup extends StatelessWidget {
  var profile_pic;
  RoundedPopup(this.profile_pic);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      elevation: 0,
      backgroundColor: const Color.fromARGB(0, 214, 2, 2),
      child: contentBox(context),
    );
  }

  Widget contentBox(BuildContext context) {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 150,
          backgroundImage:
              MemoryImage(const Base64Decoder().convert(profile_pic)),
        )
      ],
    );
  }
}
