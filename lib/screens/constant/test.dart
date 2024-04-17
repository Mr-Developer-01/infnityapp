// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:tribb/screens/constant/toast_message.dart';

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
  var monthData = [];
  _saveImage(Uint8List bytes) async {
    try {
      final file = File('/storage/emulated/0/Download/signature.png');
      //  var savePath = '/storage/emulated/0/Download/$filename';/
      await file.writeAsBytes(bytes, mode: FileMode.write);
      ToastMessages.successMessage(context, 'Image Saved Successfully!');
    } catch (e) {
      ToastMessages.errorMessage(context, "Error ${e.toString()}");
    }
  }

  @override
  void initState() {
    getMonthDetails();
    super.initState();
  }

  getMonthDetails() {
   var date = '2024-04-09 17:15:02.872388';
    var trmpData = [];
    for (var i = 1; i <= daysInMonth(DateTime.parse(date)); i++) {
      var obj = {"dayNumber": i, "weekDay": DateFormat('EEEE').format(DateTime.parse('2024-04-${i <= 9?'0$i' :i} 17:15:02.872388')), "attendOrNot": i%2 ==0?"A":"P"};
      trmpData.add(obj);
    }
    if (trmpData.isNotEmpty) {
      monthData.addAll(trmpData);
    }
  }
  int daysInMonth(DateTime date) {
    var firstDayThisMonth = DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Testing'),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: monthData.isNotEmpty? GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 3),
      //     itemBuilder: (_, index) => circularViewComponent(monthData[index]),
      //     itemCount: monthData.length,
      //   ):const Center(
      //     child: CircularProgressIndicator(),
      //   ),
      // ),

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
                      } else {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {
                          _signaturePadKey.currentState!.clear();
                        },
                        child: const Text('Clear')),
                    TextButton(
                        onPressed: () async {
                          ui.Image image =
                              await _signaturePadKey.currentState!.toImage();
                          ByteData? byteData = await image.toByteData(
                              format: ui.ImageByteFormat.png);
                          Uint8List pngBytes = byteData!.buffer.asUint8List();
                          await _saveImage(pngBytes);
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



  Widget circularViewComponent(var data) {
    return GestureDetector(
      onTap: () {
      },
      child:  GFCard(
        padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
        content: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${data['dayNumber']}, ${data['weekDay'].toString().substring(0,3)}'),
            const SizedBox(
              height: 5,
            ),
            GFAvatar(
                radius: 18,
                backgroundColor: data['attendOrNot'] == "P"?Colors.lightGreen:Colors.red[300],
                size: GFSize.SMALL,
                child: Text('${data['attendOrNot']}')),
          ],
        ),
      ),
    );
  }
}
