import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/home/contact.dart';
import 'package:tribb/screens/documents/document_page.dart';
import 'package:tribb/screens/home/home_page.dart';
import 'package:tribb/screens/properties/myproperty.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({Key? key}) : super(key: key);

  @override
// ignore: library_private_types_in_public_api
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int pageIndex = 0;

  final pages = [
    HomePage(
      testCallback: () {},
    ),
    const Myproperty(),
    const DocumentPage(),
    const CustomerSupport(),
  ];
  @override
  void initState() {
    setIndexFromGloble();
    super.initState();
  }

  setIndexFromGloble() async {
    final SharedPreferences shaPre = await SharedPreferences.getInstance();
    setState(() {
      pageIndex = shaPre.getInt('pageIndex')!;
    });
  }

  setGlobleValue(int index) async {
    final SharedPreferences shaPre = await SharedPreferences.getInstance();
    shaPre.setInt('pageIndex', index);
    // ignore: use_build_context_synchronously
    Navigator.of(context)
    .pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
    // Navigator.pushAndRemoveUntil(
    //   context,
    //   MaterialPageRoute(builder: (context) => const BottomBar())
    // );
  }

  @override
  Widget build(BuildContext context) {
    return buildMyNavBar(context);
  }

  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: ColorsClass.themeColor,
        borderRadius: const BorderRadius.only(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setGlobleValue(0);
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: Column(
                children: [
                  const Icon(
                    Icons.home,
                    color: Colors.white,
                    // size: 35,
                  ),
                  pageIndex == 0
                      ? const Text(
                          'Home',
                          style: TextStyle(color: Colors.white),
                        )
                      : const SizedBox()
                ],
              )),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setGlobleValue(1);
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: Column(
                children: [
                  const Icon(
                    Icons.location_city,
                    color: Colors.white,
                    // size: 35,
                  ),
                  pageIndex == 1
                      ? const Text(
                          'My Properties',
                          style: TextStyle(color: Colors.white),
                        )
                      : const SizedBox()
                ],
              )),
          IconButton(
              enableFeedback: false,
              onPressed: () {
                setGlobleValue(2);
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: Column(
                children: [
                  const Icon(
                    Icons.description,
                    color: Colors.white,
                    // size: 35,
                  ),
                  pageIndex == 2
                      ? const Text(
                          'Documents',
                          style: TextStyle(color: Colors.white),
                        )
                      : const SizedBox()
                ],
              )),
          IconButton(
              // enableFeedback: false,
              onPressed: () {
                setGlobleValue(3);
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: Column(
                // crossAxisAlignment: CrossAxisAlignment.basel,
                children: [
                  const Icon(
                    Icons.headset_mic_rounded,
                    color: Colors.white,
                    // size: 35,
                  ),
                  pageIndex == 3
                      ? const Text(
                          'Support',
                          style: TextStyle(color: Colors.white),
                        )
                      : const SizedBox()
                ],
              )),
        ],
      ),
    );
  }
}
