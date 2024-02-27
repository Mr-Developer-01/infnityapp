// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables

import 'package:tribb/screens/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class NewVisitorDetails extends StatefulWidget {
  var visitorType;
  NewVisitorDetails(this.visitorType, {super.key});

  @override
  State<NewVisitorDetails> createState() => _NewVisitorDetailsState();
}

class _NewVisitorDetailsState extends State<NewVisitorDetails> {
  @override
  Widget build(BuildContext context) {
    var visitType = widget.visitorType;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          visitType,
          style: TextStyle(color: ColorsClass.themeColor),
        ),
      ),
      body: Column(
        children: [
          if (visitType.toString() == 'Add Guest') const AddGuest(),
          if (visitType.toString() == 'Add Cab') const AddCab(),
          if (visitType.toString() == 'Add Delivery') const AddDelivery(),
          if (visitType.toString() == 'Add Service') const AddService()
        ],
      ),
    );
  }
}

// --------------------------------------------------------------------------------------------------------------------------
class AddGuest extends StatefulWidget {
  const AddGuest({super.key});

  @override
  State<AddGuest> createState() => _AddGuestState();
}

class _AddGuestState extends State<AddGuest> {
  bool isSend = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.010),
            child: Column(
              children: [
                const Card(
                  shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(100))),
                  child: GFAvatar(
                    backgroundColor:Colors.white,
                    backgroundImage: AssetImage('assets/images/visitoricon.png',),
                    size: 100,
                  ),
                ),
                const Text(
                  'Allow my guest',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorsClass.fillColor,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: 'Enter guest name',
                    //labelText: 'Description',
                    hintStyle: TextStyle(
                      color: ColorsClass.themeColor,
                      fontSize: 14,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorsClass.fillColor,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: 'Enter phone number',
                    //labelText: 'Description',
                    hintStyle: TextStyle(
                      color: ColorsClass.themeColor,
                      fontSize: 14,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorsClass.fillColor,
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                    ),
                    hintText: 'Enter date',
                    //labelText: 'Description',
                    hintStyle: TextStyle(
                      color: ColorsClass.themeColor,
                      fontSize: 14,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    GFCheckbox(
                      size: GFSize.SMALL,
                      activeBgColor :ColorsClass.themeColor,
                        onChanged: (value) {
                          setState(() {
                            isSend = !isSend;
                          });
                        },
                        value: isSend),
                        Text('Send gate pass to the guest',style: TextStyle(color: ColorsClass.themeColor,fontSize: 15),)
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GFButton(
                    fullWidthButton: true,
                    color: ColorsClass.themeColor,
                    onPressed: () async {},
                    // ignore: prefer_const_constructors
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================================================================================================================
class AddCab extends StatefulWidget {
  const AddCab({super.key});

  @override
  State<AddCab> createState() => _AddCabState();
}

class _AddCabState extends State<AddCab> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
class AddDelivery extends StatefulWidget {
  const AddDelivery({super.key});

  @override
  State<AddDelivery> createState() => _AddDeliveryState();
}

class _AddDeliveryState extends State<AddDelivery> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

// ___________________________________________________________________________________________________________________________________________________
class AddService extends StatefulWidget {
  const AddService({super.key});

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
