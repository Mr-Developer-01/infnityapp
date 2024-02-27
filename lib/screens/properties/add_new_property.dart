// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables

import 'dart:convert';
import 'dart:io';

import 'package:tribb/widgets/button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/images.dart';
import 'package:file_picker/file_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class AddNewProperty extends StatefulWidget {
  const AddNewProperty({super.key});

  @override
  State<AddNewProperty> createState() => _AddNewPropertyState();
}

class _AddNewPropertyState extends State<AddNewProperty> {
  final db = FirebaseFirestore.instance;
   var imageBase64;
   bool _isLoading = false;
  FilePickerResult? pickedFile;
  var name = TextEditingController();
  var location = TextEditingController();
  var rating = TextEditingController();
  var area = TextEditingController();
  var amount = TextEditingController();
  Map<String,dynamic> dataMap = {
  };

  addRecord() async {
    
    setState(() {
      _isLoading = true;
       dataMap = {
    "name": name.text,
    "reting": rating.text,
    "location": location.text,
    "area": area.text,
    "amount": amount.text,
    "image":imageBase64
  };
    });
   
    try {
      await db.collection('properties').add(dataMap);
      setState(() {
         _isLoading = false;
      });
      MotionToast(
        primaryColor: ColorsClass.themeColor,
        title: const Text('Success',style: TextStyle(
          color: Colors.green,
          fontSize: 20
        ),),
              description: const Text("New property has been added successfully !!"),
              icon: Icons.check,
              position: MotionToastPosition.top,
              animationType: AnimationType.fromBottom,
            ).show(context);

    } catch (error) {
      setState(() {
         _isLoading = false;
      });
       MotionToast(
        primaryColor: ColorsClass.themeColor,
        title: const Text('Error',style: TextStyle(
          color: Colors.red,
          fontSize: 20
        ),),
              description: const Text("Somethig went wrong !!"),
              icon: Icons.close,
              position: MotionToastPosition.top,
              animationType: AnimationType.fromBottom,
            ).show(context);
    }
  }

  void chooseImage() async {
    pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.image
    );
    if (pickedFile != null) {
      try {
        final file = pickedFile!.files.first;
        final bytes = File(file.path!).readAsBytesSync();
        String img64 = base64Encode(bytes);
        setState(() {
          imageBase64 = img64;
        });
      } catch (err) {
        debugPrint('Error {{{{{{{{{{{{{{{{}}}}}}}}}}}}}}}} $err');
      }
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Property',
          style: TextStyle(
              color: ColorsClass.themeColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                // opacity: 0.4,
                image: AssetImage(
                  Staticimages.bgImage,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Enter property details',
                        style: TextStyle(color: ColorsClass.themeColor),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: name,
                        decoration: InputDecoration(
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
                          hintText: 'Name',
                          
                          //labelText: 'Subject',
                          //isDense: true,
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 10, right: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            // subject.text = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                         controller: location,
                        decoration: InputDecoration(
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
                          hintText: 'Location',
                          
                          //labelText: 'Subject',
                          //isDense: true,
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 10, right: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            // subject.text = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                         controller: rating,
                        decoration: InputDecoration(
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
                          hintText: 'Rating',
                          
                          //labelText: 'Subject',
                          //isDense: true,
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 10, right: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            // subject.text = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                         controller: area,
                        decoration: InputDecoration(
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
                          hintText: 'Area (123-123 Sq. Ft.)',
                          
                          //labelText: 'Subject',
                          //isDense: true,
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 10, right: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            // subject.text = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                         controller: amount,
                        decoration: InputDecoration(
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
                          hintText: 'Price(1.1 Cr Or 1 L)',
                          
                          //labelText: 'Subject',
                          //isDense: true,
                          hintStyle: TextStyle(
                            color: ColorsClass.themeColor,
                            fontSize: 14,
                          ),
                          contentPadding:
                              const EdgeInsets.only(left: 10, right: 15),
                        ),
                        onChanged: (value) {
                          setState(() {
                            // subject.text = value;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      imageBase64 == null?ButtonWidget(
                        text: 'Upload File',
                        icon: Icons.cloud_upload_outlined,
                        onClicked: () {
                          chooseImage();
                        },
                      ):Column(
                        children: [
                          Image.memory(base64Decode(imageBase64),height: 200,width: double.infinity,fit: BoxFit.fill,),
                          const SizedBox(height: 10,),
                          InkWell(
                            child: Text("Change Image",
                              style: TextStyle(
                                 color: ColorsClass.themeColor,
                                        fontSize: 12,
                                        decoration: TextDecoration.underline,
                                        decorationColor: ColorsClass.themeColor,
                              ),
                            ),
                            onTap: () {
                              chooseImage();
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8)),
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(
                                    ColorsClass.themeColor),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                        side: BorderSide(
                                            color: ColorsClass.themeColor)))),
                            onPressed: () {
                              addRecord();
                            },
                            child: const Text("Add Property",
                                style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (_isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
