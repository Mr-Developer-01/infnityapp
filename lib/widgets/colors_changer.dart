// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:getwidget/getwidget.dart';

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  int groupValue = 0;

  setIndex() async {
    SharedPreferences setIdx = await SharedPreferences.getInstance();
    setState(() {
      groupValue = setIdx.getInt('groupValue')!;
    });
  }

  @override
  void initState() {
    setIndex();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Theme",
          style: TextStyle(
            color: ColorsClass.themeColor,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/applogo.png',
                  height: 50,
                  width: 100,
                  color: const Color(0xFFFC9F09),
                ),
                const Spacer(),
                GFRadio(
                  type: GFRadioType.custom,
                  activeIcon: const Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                  radioColor: Colors.red,
                  size: GFSize.LARGE,
                  activeBgColor: const Color(0xFFFC9F09),
                  inactiveBorderColor: GFColors.DARK,
                  activeBorderColor: const Color(0xFFFC9F09),
                  value: 0,
                  groupValue: groupValue,
                  onChanged: (value) async {
                    setState(() {
                      groupValue = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/applogo.png',
                  height: 50,
                  width: 100,
                  color: const Color(0xFF081F95),
                ),
                const Spacer(),
                GFRadio(
                  type: GFRadioType.custom,
                  activeIcon: const Icon(Icons.check, color: Colors.white),
                  radioColor: Colors.red,
                  size: GFSize.LARGE,
                  activeBgColor: const Color(0xFF081F95),
                  inactiveBorderColor: GFColors.DARK,
                  activeBorderColor: const Color(0xFF081F95),
                  value: 1,
                  groupValue: groupValue,
                  onChanged: (value) async {
                    setState(() {
                      groupValue = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(
                  'assets/images/applogo.png',
                  height: 50,
                  width: 100,
                  color: const Color(0xFFF64004),
                ),
                const Spacer(),
                GFRadio(
                  type: GFRadioType.custom,
                  activeIcon: const Icon(Icons.check, color: Colors.white),
                  radioColor: Colors.red,
                  size: GFSize.LARGE,
                  activeBgColor: const Color(0xFFF64004),
                  inactiveBorderColor: GFColors.DARK,
                  activeBorderColor: const Color(0xFFF64004),
                  value: 2,
                  groupValue: groupValue,
                  onChanged: (value) async {
                    setState(() {
                      groupValue = value;
                    });
                  },
                ),
              ],
            ),
            const Spacer(),
            GFButton(
                fullWidthButton: true,
                color: ColorsClass.themeColor,
                onPressed: () async {
                  ColorsClass.setColor(groupValue);
                  SharedPreferences setIdx =
                      await SharedPreferences.getInstance();
                  setIdx.setInt('groupValue', groupValue);
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/app', (Route<dynamic> route) => false);
                },
                child: const Text('Apply Theme'))
          ],
        ),
      ),
    );
  }
}
