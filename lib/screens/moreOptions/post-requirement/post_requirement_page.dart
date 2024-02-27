// ignore_for_file: use_build_context_synchronously


import 'package:tribb/screens/constant/API/call_api.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/checkbox/gf_checkbox.dart';
import 'package:getwidget/components/text_field/gf_text_field.dart';
import 'package:tribb/screens/constant/toast_message.dart';

class PostRequirementPage extends StatefulWidget {
  const PostRequirementPage({super.key});

  @override
  State<PostRequirementPage> createState() => _PostRequirementPageState();
}

class _PostRequirementPageState extends State<PostRequirementPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController minprice = TextEditingController();
  TextEditingController maxprice = TextEditingController();
  TextEditingController area = TextEditingController();
  TextEditingController description = TextEditingController();
  var category = 'None';
  var status = 'None';
  bool isLoadingMode = false;
  final List<String> _dropdownItems = [
    'None',
    'Apartment',
    'Floors',
    'Penthouse',
    'Garden Apartment',
    'F1 Apartment',
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
  handlePostRequirementSubmit() async {
    setState(() {
      isLoadingMode = true;
    });
    var filteredDataWithObj =
        amenities.where((i) => i['isSelected'] == true).toList();
    var filterdname = [];
    for (var element in filteredDataWithObj) {
      filterdname.add(element['name']);
    }
    var objData = {
      "P_R_Name__c": name.text,
      "P_R_Email__c": email.text,
      "P_R_Contact_No__c": contact.text,
      "P_R_Category__c": category,
      "P_R_Status__c": status,
      "P_R_Min_Price__c": minprice.text,
      "P_R_Max_Price__c": maxprice.text,
      "P_R_Expected_Area_Sq_Ft__c": area.text,
      "P_R_Description__c": description.text,
      "P_R_Amenities_and_features__c": filterdname.join(';'),
    };
    var response = await CallAPIs.createPostRequest(
        'PostRequirementAPI', {'objData': objData});
        debugPrint('Data ************************$response');
    if (response.contains('Record Save Successfully')) {
      setState(() {
        isLoadingMode = false;
      });
      ToastMessages.successMessage(context, 'Request has been submitted.');
      setNulllValues();
    } else {
      setState(() {
        isLoadingMode = false;
      });
      ToastMessages.errorMessage(
          context, 'Something went wrong. try again later');
    }
  }

  setNulllValues() {
    name.text = '';
    email.text = '';
    contact.text = '';
    minprice.text = '';
    maxprice.text = '';
    area.text = '';
    description.text = '';
    category = 'None';
    status = 'None';
    for (var element in amenities) {
      element['isSelected'] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'Post Requirement',
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
                amenitiesAndfeaturesCard(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: !isLoadingMode?Container(
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
                            handlePostRequirementSubmit();
                          }
                        },
                        child: const Text("    Post Requirement     ",
                            style: TextStyle(color: Colors.white)),
                      )
                    ):const CircularProgressIndicator(),
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
              controller: name,
              validatornew: (value) {
                if (value == null || value == '') {
                  return 'This field is required';
                }
                return null;
              },
              textAlignVertical: TextAlignVertical.bottom,
              decoration:
                  const InputDecoration(hintText: 'Name', label: Text('Name'))),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: email,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Email', label: Text('Email')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: contact,
                      validatornew: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: ' Contact No.',
                          label: Text(' Contact No.')))),
            ],
          ),
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
                    validator: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
                    // value: category,
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
                  child: DropdownButtonFormField<String>(
                    // hint:Text('Category'),

                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis, color: Colors.black),
                    alignment: AlignmentDirectional.bottomStart,
                    decoration: const InputDecoration(
                      label: Text('Status'),
                      hintText: "Status",
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(width: 0),
                      ),
                    ),
                    // value:,
                     validator: (value) {
                        if (value == null || value == '') {
                          return 'This field is required';
                        }
                        return null;
                      },
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
                      status = newValue.toString();
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
                      controller: minprice,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Min-Price', label: Text('Min-Price')))),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 2.5,
                  child: GFTextField(
                      controller: maxprice,
                      keyboardType: TextInputType.number,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: const InputDecoration(
                          hintText: 'Max-Price ', label: Text('Max-Price')))),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
              // width: MediaQuery.of(context).size.width / 2.5,
              child: GFTextField(
                  controller: area,
                  keyboardType: TextInputType.number,
                  textAlignVertical: TextAlignVertical.bottom,
                  decoration: const InputDecoration(
                      hintText: 'Expected Area(Sq Ft)',
                      label: Text('Expected Area(Sq Ft)')))),
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
                      hintText: 'Your Description',
                      label: Text('Your Description')))),
        ),
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
