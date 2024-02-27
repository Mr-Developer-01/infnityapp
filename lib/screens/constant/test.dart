// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';

import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class MyHomePageChart extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  MyHomePageChart({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePageChart> {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  Color penColor = Colors.black;
  double penSize = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing'),
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          // height: 500,
          // width: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                GFTextFieldRounded(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(
                        2,
                      ),
                       FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          penSize = double.parse(value);
                        });
                      }else{
                        penSize = 5;
                      }
                    },
                    maxLength: 2,
                    keyboardType: TextInputType.number,
                    editingbordercolor: Colors.black,
                    idlebordercolor: penColor,
                    borderwidth: 1,
                    cornerradius: 10,
                    hintText: "Pen Size"),
                const SizedBox(
                  height: 20,
                ),
                SfSignaturePad(
                  key: _signaturePadKey,
                  minimumStrokeWidth: 5,
                  maximumStrokeWidth: penSize,
                  strokeColor: penColor,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          _signaturePadKey.currentState!.clear();
                        },
                        child: const Text('Clear')),
                    TextButton(
                        onPressed: () async{
                          await _signaturePadKey.currentState!.toImage();
                        },
                        child: const Text('Save')),
                        
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // crossAxisAlignment: ,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.red;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.pink;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.pink,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.deepOrange;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.deepOrange,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.amber;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.amber,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.lime;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.lime,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.green;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.green,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.teal;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.teal,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.cyan;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.cyan,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.indigo;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.indigo,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.purple;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.purple,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.brown;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.brown,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.white;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.black;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.blueGrey;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.blueGrey,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.orange;
                          });
                        },
                        child: const GFAvatar(
                          backgroundColor: Colors.orange,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            penColor = Colors.pink[900]!;
                          });
                        },
                        child: GFAvatar(
                          backgroundColor: Colors.pink[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
