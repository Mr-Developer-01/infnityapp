// ignore_for_file: avoid_unnecessary_containers

import 'package:another_xlider/models/handler.dart';
import 'package:another_xlider/models/handler_animation.dart';
import 'package:another_xlider/models/hatch_mark.dart';
import 'package:another_xlider/models/hatch_mark_label.dart';
import 'package:another_xlider/models/slider_step.dart';
import 'package:another_xlider/models/tooltip/tooltip.dart';
import 'package:another_xlider/models/trackbar.dart';
import 'package:another_xlider/widgets/sized_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:another_xlider/another_xlider.dart';

class PropertyCalculator extends StatefulWidget {
  const PropertyCalculator({super.key});

  @override
  State<PropertyCalculator> createState() => _PropertyCalculatorState();
}

class _PropertyCalculatorState extends State<PropertyCalculator> {
  double _forAmountlv = 100000;
  double _forAmountuv = 250000;
  double _forInterestuv = 20;
  double _forInterestlv = 1;
  double _forDurationuv = 20;
  double _forDurationlv = 1;
  double totalCost = 0.0;

  @override
  void initState() {
    print(FirebaseAuth.instance.currentUser!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'Property Cost Calculator',
          style: TextStyle(color: ColorsClass.themeColor),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              amountSliderAnimation(),
              const Padding(
                padding: EdgeInsets.only(left: 20,right: 30),
                child: Row(children: [
                  Text('1L'),
                  Spacer(),
                  Text('1Cr'),
                ],),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 35,top: 20),
                  child: Container(
                    child: Text(
                      'Total Amount : ${NumberFormat.decimalPattern().format(_forAmountlv).toString()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
              intrestSliderAnimation(),
               const Padding(
                padding: EdgeInsets.only(left: 20,right: 30),
                child: Row(children: [
                  Text('1%'),
                  Spacer(),
                  Text('20%'),
                ],),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 35,top: 20),
                  child: Container(
                    child: Text(
                      'Total Interest : ${_forInterestlv.toInt().toString()} %',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
              duretionSliderAnimation(),
               const Padding(
                padding: EdgeInsets.only(left: 20,right:30),
                child: Row(children: [
                  Text('1 year'),
                  Spacer(),
                  Text('30 year'),
                ],),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 35,top: 20),
                  child: Container(
                    child: Text(
                      'Total Duration : ${_forDurationlv.toInt().toString()} year',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 35, top: 20),
                  child: Container(
                    child: Text(
                      'Total Cost : ${NumberFormat.decimalPattern().format(totalCost)}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Center(
                    child: Container(
                        decoration: BoxDecoration(
                            color: ColorsClass.themeColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsClass.themeColor,
                            elevation: 0,
                          ),
                          onPressed: () {
                            // FocusScope.of(context).unfocus();
                            setState(() {
                              totalCost = (_forAmountlv *
                                      _forInterestlv *
                                      _forDurationlv) /
                                  100;
                            });
                          },
                          child: const Text("    Calculate     ",
                              style: TextStyle(color: Colors.white)),
                        ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  amountSliderAnimation() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: ListTile(
        title: const Text('Loan Amount'),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: FlutterSlider(
              handlerHeight:10,
              handlerWidth: 10,
              key: const Key('3343'),
              values: [_forAmountlv, _forAmountuv],
              trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(color: ColorsClass.themeColor),
              ),
             
              handler: FlutterSliderHandler(
                  disabled: true,
                  child: const Icon(
                    Icons.abc,
                    size: 0,
                  )),
             
              max: 10000000,
              min: 100000,
              onDragging: (_handlerIndex, _lowerValue, _upperValue) {
                setState(() {
                  _forAmountlv = _lowerValue;
                  _forAmountuv = _upperValue;
                });
              },
            )),
          ],
        ),
      ),
    );
  }

  intrestSliderAnimation() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: ListTile(
        title: const Text('Interest'),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: FlutterSlider(
                  rtl:false,
                  handlerHeight: 10,
                  handlerWidth: 10,
              key: const Key('3343'),
              values: [_forInterestlv, _forInterestuv],
              trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(color: ColorsClass.themeColor),
              ),
              handler: FlutterSliderHandler(
                  disabled: true,
                  child: const Icon(
                    Icons.abc,
                    size: 0,
                  )),
               tooltip: FlutterSliderTooltip(
                  disabled: false,
                ),
              max: 20,
              min: 1,
              // jump: true,
              onDragging: (_handlerIndex, _lowerValue, _upperValue) {
                setState(() {
                  _forInterestlv = _lowerValue;
                  _forInterestuv = _upperValue;
                });
              },
            )),
          ],
        ),
      ),
    );
  }

  duretionSliderAnimation() {
    return Padding(
      padding: const EdgeInsets.only(),
      child: ListTile(
        title: const Text('Duration'),
        subtitle: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: FlutterSlider(
                  rtl:false,
                  handlerHeight: 10,
                  handlerWidth: 10,
              key: const Key('3343'),
              values: [_forDurationlv, _forDurationuv],
              trackBar: FlutterSliderTrackBar(
                activeTrackBar: BoxDecoration(color: ColorsClass.themeColor),
              ),
               tooltip: FlutterSliderTooltip(
                  disabled: false,
                ),
              handler: FlutterSliderHandler(
                  disabled: true,
                  child: const Icon(
                    Icons.abc,
                    size: 0,
                  )),
                
              max: 30,
              min: 1,
              onDragging: (_handlerIndex, _lowerValue, _upperValue) {
                setState(() {
                  _forDurationlv = _lowerValue;
                  _forDurationuv = _upperValue;
                });
              },
            )),
          ],
        ),
      ),
    );
  }
}
