// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/support/contact.dart';
import 'package:tribb/screens/documents/document_page.dart';
import 'package:tribb/screens/home/home_page.dart';
import 'package:tribb/screens/properties/myproperty.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
  });

  @override
  // ignore: no_logic_in_create_state
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  late int _selectedIndex = 0;
  late final List<Widget> _widgetOptions;
  DateTime currentBackPressTime = DateTime.now();
  @override
  void initState() {
    setIndex();
    _widgetOptions = [
      HomePage(testCallback: handlePropertySection),
      const Myproperty(),
      const DocumentPage(),
      const CustomerSupport(),
    ];
    super.initState();
  }

  setIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('pageIndex') != null) {
      setState(() {
        _selectedIndex = prefs.getInt('pageIndex')!;
      });
    } else {
      prefs.setInt('pageIndex', 0);
    }
  }

  void _onItemTapped(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('pageIndex', index);
    setState(() {
      _selectedIndex = index;
    });
  }

  handlePropertySection() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setInt('pageIndex', 1);
      _selectedIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_selectedIndex == 0) {
         // try {
          //   DateTime now = DateTime.now();
          //   if (currentBackPressTime != null ||
          //       now.difference(currentBackPressTime) >
          //           const Duration(seconds: 5)) {
          //     setState(() {
          //       currentBackPressTime = now;
          //     });
          //     Fluttertoast.showToast(msg: 'Press again to exit');
          //     return Future.value(false);
          //   }
          // } catch (e) {
          //   print("Errror$e");
          // }

          return Future.value(true);
        } else {
          setState(() {
            _selectedIndex = 0;
          });
          return false;
        } // Return true to allow back navigation or false to prevent it.
      },
      child: Scaffold(
        // key: _scaffoldKey,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: ColorsClass.themeColor,
              // size: 150,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.location_city),
              label: 'My Properties',
              backgroundColor: ColorsClass.themeColor,
              // size: 150,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.description),
              label: 'Documents',
              backgroundColor: ColorsClass.themeColor,
              // size: 150,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.headset_mic_rounded),
              label: 'Support',
              backgroundColor: ColorsClass.themeColor,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
