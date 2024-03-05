// ignore_for_file: prefer_interpolation_to_compose_strings, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tribb/screens/constant/toast_message.dart';
// import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';

class UploadProperty extends StatefulWidget {
  const UploadProperty({super.key});

  @override
  State<UploadProperty> createState() => _UploadPropertyState();
}

class _UploadPropertyState extends State<UploadProperty> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController builduparea = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController description = TextEditingController();
  final db = FirebaseFirestore.instance;
  bool _isLoadingMode = false;
  Map<String, dynamic> dataMap = {};
  final ImagePicker imagePicker = ImagePicker();
  var category = '';
  var status = '';
  var buildingage = '';
  var unittype = '';
  List<File> selectedImages = [];
  var imagesBase64 = [];
  final picker = ImagePicker();
  var unitStatusData = ['None', '2BR', '3BR'];
  final List<String> _dropdownItems = [
    'None',
    'Appartment',
    'Floors',
    'Penthouse',
    'Garden Appartment',
    'F1 Appartment',
    'Ultra luxury',
    'Duplex',
    'Triplex',
    'Quadplex',
  ];
  var propertyStatus = [
    "None",
    "Hold",
    "Completed",
    "Terminated",
  ];
  var buildingAge = [
    "None",
    "Brand New",
    "Less than 2 years",
    "Less than 5 years",
    "Less than 10 years",
    "Above 10 Years",
  ];
  var unitStatus = [
    "None",
    "Blocked by Management",
    "Temporarily Blocked",
    "Not Available for Sale",
    "Available",
    "Hold for Booking",
    "Sold",
    "Soft Book",
  ];
  var amenities = [
    {
      "isSelected": false,
      "name": 'Reserve Parking',
    },
    {
      "isSelected": false,
      "name": 'Visitor Parking',
    },
    {
      "isSelected": false,
      "name": '24*7 Power Back-Up',
    },
    {
      "isSelected": false,
      "name": 'Lift',
    },
    {
      "isSelected": false,
      "name": 'Jogging Track',
    },
    {
      "isSelected": false,
      "name": 'Cycling Track',
    },
    {
      "isSelected": false,
      "name": 'Intercom',
    },
    {
      "isSelected": false,
      "name": 'Park',
    },
    {
      "isSelected": false,
      "name": 'Community Center',
    },
    {
      "isSelected": false,
      "name": 'Security Personnel',
    },
    {
      "isSelected": false,
      "name": '24*7 Water',
    },
    {
      "isSelected": false,
      "name": 'Maintenance Staff',
    },
    {
      "isSelected": false,
      "name": 'Security / Fire Alarm',
    },
    {
      "isSelected": false,
      "name": 'Club-House',
    },
    {
      "isSelected": false,
      "name": 'Fire-Fighting',
    },
    {
      "isSelected": false,
      "name": 'Badminton Court',
    },
    {
      "isSelected": false,
      "name": 'Cafe Lounge',
    },
    {
      "isSelected": false,
      "name": 'Mini Theatre',
    },
    {
      "isSelected": false,
      "name": 'Squash Court',
    },
    {
      "isSelected": false,
      "name": 'Skating Rink',
    },
    {
      "isSelected": false,
      "name": 'Steam Sauna Bath',
    },
    {
      "isSelected": false,
      "name": 'Yoga & Meditation Area',
    },
    {
      "isSelected": false,
      "name": 'Cricket Practice Pitch',
    },
    {
      "isSelected": false,
      "name": 'Pet Garden',
    },
    {
      "isSelected": false,
      "name": 'Toddler Play Area',
    },
    {
      "isSelected": false,
      "name": 'CCTV',
    },
    {
      "isSelected": false,
      "name": 'GYM',
    },
    {
      "isSelected": false,
      "name": 'Walking/Jogging track',
    },
    {
      "isSelected": false,
      "name": 'Play area',
    },
    {
      "isSelected": false,
      "name": 'Club house',
    },
    {
      "isSelected": false,
      "name": 'Swimming pool',
    },
    {
      "isSelected": false,
      "name": 'Rooftop garden',
    },
    {
      "isSelected": false,
      "name": 'Open deck',
    },
    {
      "isSelected": false,
      "name": 'Sky lounge',
    },
    {
      "isSelected": false,
      "name": 'Spa and salon',
    },
    {
      "isSelected": false,
      "name": 'Concierge services',
    },
    {
      "isSelected": false,
      "name": 'Party hall',
    },
    {
      "isSelected": false,
      "name": 'Temple and religious activity place',
    },
    {
      "isSelected": false,
      "name": 'Cinema hall',
    },
    {
      "isSelected": false,
      "name": 'Wi-Fi connectivity',
    }
  ];
  Future getImages() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality:5);
    if (image != null) {
      imagesBase64 = [];
      selectedImages = [];
      selectedImages.add(File(image.path));
      final bytes = File(image.path).readAsBytesSync();
      String img64 = base64Encode(bytes);
      imagesBase64.add(img64);
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    }
    // final pickedFile = await picker.pickMultiImage(
    //     imageQuality: 100, // To set quality of images
    //     maxHeight: 1000, // To set maxheight of images that you want in your app
    //     maxWidth: 1000); // To set maxheight of images that you want in your app
    // List<XFile> xfilePick = pickedFile;
    // if (xfilePick.isNotEmpty) {
    //   selectedImages = [];
    //   imagesBase64 = [];
    //   for (var i = 0; i < xfilePick.length; i++) {
    //     selectedImages.add(File(xfilePick[i].path));
    //     final bytes = File(xfilePick[i].path).readAsBytesSync();
    //     String img64 = base64Encode(bytes);
    //     imagesBase64.add(img64);
    //   }
    //   setState(() {});
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    // }ccccccc
  }

  addNewProperty() async {
    if (imagesBase64.isNotEmpty && mounted) {
      setState(() {
        _isLoadingMode = true;
        dataMap = {
          "title": title.text,
          "category": category,
          "price": price.text,
          "area": area.text,
          "status": status,
          "build-up-area": builduparea.text,
          "buildingage": buildingage,
          "address": address.text,
          "unit-type": unittype,
          "description": description.text,
          "image": imagesBase64[0],
          "images": imagesBase64,
          "amenities": amenities,
          "user-id": FirebaseAuth.instance.currentUser!.uid
        };
      });
      try {
        await db.collection('properties').add(dataMap);
        if (mounted) {
          setState(() {
            _isLoadingMode = false;
          });
        }
        ToastMessages.successMessage(context, 'Property successfully added');
        setNullData();
      } catch (e) {
        if (mounted) {
          setState(() {
            _isLoadingMode = false;
          });
        }
        ToastMessages.errorMessage(context, '$e');
      }
    } else {
      ToastMessages.warnigMessage(
          context, 'Please select at least one image to proceed.');
    }
  }

  setNullData() {
    setState(() {
      title.text = '';
      category = '';
      price.text = '';
      area.text = '';
      status = '';
      builduparea.text = '';
      buildingage = '';
      address.text = '';
      unittype = '';
      description.text = '';
      imagesBase64 = [];
      selectedImages = [];
      for (int i = 0; i < amenities.length; i++) {
        amenities[i]['isSelected'] = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'Upload Property',
          style: TextStyle(color: ColorsClass.themeColor),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                basicDetails(),
                documentDragAndDropCard(),
                amenitiesAndfeaturesCard(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: _isLoadingMode
                        ? const CircularProgressIndicator()
                        : Container(
                            decoration: BoxDecoration(
                                color: ColorsClass.themeColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsClass.themeColor,
                                elevation: 0,
                              ),
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  addNewProperty();
                                }
                              },
                              child: const Text("    Add Property     ",
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget basicDetails() {
    return Column(
      children: [
        headerText('Basic Information'),
        Padding(
          padding: const EdgeInsets.all(20),
          child: GFTextField(
              controller: title,
              validatornew: (value) {
                if (value == null || value == '') {
                  return 'This field is requied';
                }
                return null;
              },
              textAlignVertical: TextAlignVertical.bottom,
              decoration: const InputDecoration(
                  hintText: 'Property Title', label: Text('Property Title'))),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width /
                      2.4, //MediaQuery.of(context).size.width /2.5,
                  child: DropdownButtonFormField<String>(
                    // hint:Text('Category'),
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis, color: Colors.black),
                    alignment: AlignmentDirectional.bottomStart,
                    decoration: const InputDecoration(
                      label: Text('Category'),
                      hintText: "Category",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0),
                      ),
                    ),
                    // value: _selectedValue,
                    items: _dropdownItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        category = newValue.toString();
                      });
                    },
                  )),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: price,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Price', label: Text('Price')))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: area,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Area(Sq Ft.)',
                          label: Text('Area(Sq Ft.)')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: DropdownButtonFormField<String>(
                    // hint:Text('Category'),
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis, color: Colors.black),
                    alignment: AlignmentDirectional.bottomStart,
                    decoration: const InputDecoration(
                      label: Text('Property Status'),
                      hintText: "Property Status",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0),
                      ),
                    ),
                    // value: _selectedValue,
                    items: propertyStatus.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        status = newValue.toString();
                      });
                    },
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: builduparea,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Build-up Area ',
                          label: Text('Build-up Area')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: DropdownButtonFormField<String>(
                    // hint:Text('Category'),
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis, color: Colors.black),
                    alignment: AlignmentDirectional.bottomStart,
                    decoration: const InputDecoration(
                      label: Text('Building Age'),
                      hintText: "Building Age",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0),
                      ),
                    ),
                    // value: _selectedValue,
                    items: buildingAge.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      buildingage = newValue.toString();
                    },
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: address,
                      keyboardType: TextInputType.multiline,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Address ', label: Text('Address')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: DropdownButtonFormField<String>(
                    // hint:Text('Category'),
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis, color: Colors.black),
                    alignment: AlignmentDirectional.bottomStart,
                    decoration: const InputDecoration(
                      label: Text('Unit Type'),
                      hintText: "Unit Type",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0),
                      ),
                    ),
                    // value: _selectedValue,
                    items: unitStatusData.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        unittype = newValue.toString();
                      });
                    },
                  )),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
              // width: MediaQuery.of(context).size.width / 2.5,
              child: GFTextField(
                  controller: description,
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: const InputDecoration(
                      hintText: 'Description ', label: Text('Description')))),
        ),
      ],
    );
  }

  Widget documentDragAndDropCard() {
    return Column(
      children: [
        headerText('Upload Image'),
        GestureDetector(
          onTap: () {
            getImages();
          },
          child: Container(
              padding: const EdgeInsets.all(20), //padding of outer Container
              child: DottedBorder(
                color: Colors.grey, //color of dotted/dash line
                strokeWidth: 3, //thickness of dash/dots
                dashPattern: const [10, 6],
                //dash patterns, 10 is dash width, 6 is space width
                child: Container(
                  //inner container
                  height: 180, //height of inner container
                  width: double
                      .infinity, //width to 100% match to parent container.
                  color: Colors.grey[300],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/upload-images.png',
                        height: 100,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Upload Image',
                        style: TextStyle(color: Colors.grey[600], fontSize: 20),
                      )
                    ],
                  ), //background color of inner container
                ),
              )),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              color: Colors.grey[300],
              child: Row(
                children: [
                  for (int i = 0; i < selectedImages.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(
                        selectedImages[i],
                        height: 50,
                      ),
                    ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget amenitiesAndfeaturesCard() {
    return Column(
      children: [
        headerText('Amenities & Features'),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
              height: 300,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    for (int i = 0; i < amenities.length; i++)
                      Row(
                        children: [
                          GFCheckbox(
                            onChanged: (value) {
                              setState(() {
                                amenities[i]['isSelected'] =
                                    amenities[i]['isSelected'] == true
                                        ? false
                                        : true;
                              });
                            },
                            value: amenities[i]['isSelected'] as bool,
                            activeBgColor: ColorsClass.themeColor,
                          ),
                          Text(amenities[i]['name'].toString())
                        ],
                      )
                  ],
                ),
              )),
        ),
      ],
    );
  }

  Widget headerText(text) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Container(
        width: double.infinity,
        color: ColorsClass.themeColor,
        height: 30,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
