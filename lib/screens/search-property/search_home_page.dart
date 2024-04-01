// ignore_for_file: unnecessary_const, unnecessary_new

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/properties/property_details.dart';

class SearchProprties extends StatefulWidget {
  const SearchProprties({super.key});

  @override
  State<SearchProprties> createState() => _SearchProprtiesState();
}

class _SearchProprtiesState extends State<SearchProprties> {
  var allPropertiesData = [];
  bool _isLoading = false;
  final _searchController = TextEditingController();
  var viewDataList = [];
  double start = 10000000.0;
  double end = 50000000.0;
  bool isFirstTime = true;
  bool isPropertyTypeAppled = true;
  var propertyTypeFilterList = [
    {'name': "Ultra Luxury", "selected": false},
    {'name': "Luxury", "selected": false},
    {'name': "Premium", "selected": false}
  ];
  var priceItetsList = [
    '10L - 50L',
    '50L - 1Cr',
    '1Cr - 2Cr',
    '2Cr - 5Cr',
    '5Cr - 7Cr',
    '7Cr - 10Cr',
  ];
  Future<void> getAllProperties() async {
    setState(() {
      _isLoading = true;
      allPropertiesData = [];
    });
    var ultraTemp = [];
    var luxTemp = [];
    var priTemp = [];
    final usersRef = FirebaseFirestore.instance.collection('allproperties');
    final userDoc = await usersRef.doc('propertyTypes').get();
    final ultraLuxuryData = userDoc.reference.collection('ultra_luxury');
    final luxuryData = userDoc.reference.collection('luxury');
    final premiumData = userDoc.reference.collection('premium');
    //  final postsQuerySnapshot = await _ultraLuxury.get();
    var ultraLuxurytemp = await ultraLuxuryData.get();

    var luxurytemp = await luxuryData.get();
    var premiumtemp = await premiumData.get();

    for (var element in ultraLuxurytemp.docs) {
      if (isFirstTime ||
          (start <= parseStringToNumber(element.data()['price']) &&
              end >= parseStringToNumber(element.data()['price']))) {
        ultraTemp.add({
          "type": "Ultra Luxury",
          "id": element.id,
          "title": element.data()['title'],
          "image": element.data()['image'],
          "rating": element.data()['rating'],
          "price": element.data()['price'],
          "location": element.data()['location'],
        });
      }
    }
    for (var element in luxurytemp.docs) {
      if (isFirstTime ||
          (start <= parseStringToNumber(element.data()['price']) &&
              end >= parseStringToNumber(element.data()['price']))) {
        luxTemp.add({
          "type": "Luxury",
          "id": element.id,
          "title": element.data()['title'],
          "image": element.data()['image'],
          "rating": element.data()['rating'],
          "price": element.data()['price'],
          "location": element.data()['location'],
        });
      }
    }
    for (var element in premiumtemp.docs) {
      if (isFirstTime ||
          (start <= parseStringToNumber(element.data()['price']) &&
              end >= parseStringToNumber(element.data()['price']))) {
        priTemp.add({
          "type": "Premium",
          "id": element.id,
          "title": element.data()['title'],
          "image": element.data()['image'],
          "rating": element.data()['rating'],
          "price": element.data()['price'],
          "location": element.data()['location'],
        });
      }
    }
    if (mounted) {
      if (isFirstTime ||
          (isPropertyTypeAppled ||
              bool.parse(propertyTypeFilterList[0]['selected'].toString()))) {
        allPropertiesData.addAll(ultraTemp);
      }
      if (isFirstTime ||
          (isPropertyTypeAppled ||
              bool.parse(propertyTypeFilterList[1]['selected'].toString()))) {
        allPropertiesData.addAll(luxTemp);
      }
      if (isFirstTime ||
          (isPropertyTypeAppled ||
              bool.parse(propertyTypeFilterList[2]['selected'].toString()))) {
        allPropertiesData.addAll(priTemp);
      }

      setState(() {
        viewDataList = allPropertiesData;
        _isLoading = false;
      });
    }
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    //Simulates waiting for an API call
    await Future.delayed(const Duration(milliseconds: 1000));

    setState(() {
      viewDataList = allPropertiesData
          .where((element) =>
              element['location']
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase()) ||
              element['title']
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())||
                  element['type']
                  .toLowerCase()
                  .contains(_searchController.text.toLowerCase())
                  
                  )
          .toList();
      _isLoading = false;
    });
  }

  applySelectedFilter() {
    setState(() {
      isFirstTime = false;
    });
    for (var i = 0; i < propertyTypeFilterList.length; i++) {
      if (bool.parse(propertyTypeFilterList[i]['selected'].toString())) {
        setState(() {
          isPropertyTypeAppled = false;
        });
        break;
      } else {
        setState(() {
          isPropertyTypeAppled = true;
        });
      }
    }
    Navigator.pop(context);
    getAllProperties();
  }

  @override
  void initState() {
    getAllProperties();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,

        // ...
        title: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          // width: loginWidth,/

//            color: Colors.red,
          child: TextField(
            autofocus: true,
            controller: _searchController,
            decoration: InputDecoration(
                fillColor: ColorsClass.fillColor,
                filled: true,
                prefixIcon: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back, color: ColorsClass.themeColor),
                ),
                hintText: 'Search proprties by city and name...',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none),
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  color: ColorsClass.themeColor.withOpacity(0.5),
                ),
                suffixIcon: IconButton(
                    onPressed: () {
                      _modalBottomSheetMenu();
                    },
                    icon: Icon(
                      Icons.filter_list,
                      color: ColorsClass.themeColor,
                    ))),
            onChanged: (value) {
              _performSearch();
            },
          ),
        ),
      ),
      body: Center(
        child: !_isLoading
            ? viewDataList.isEmpty
                ? const Text('No record to display.')
                : ListView.builder(
                    itemCount: viewDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PropertyDetailsPage(viewDataList[index])),
                          );
                        },
                        child: GFCard(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 5),
                          content: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.,
                            children: [
                              Container(
                                height: 90,
                                width: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                          viewDataList[index]['image']!,
                                        ),
                                        fit: BoxFit.fill)),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${viewDataList[index]['title'].toString()}\n (${viewDataList[index]['type'].toString()})',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    viewDataList[index]['location'].toString(),
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(viewDataList[index]['price'].toString()),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    })
            : const CircularProgressIndicator(),
      ),
    );
  }

  String formatNumber(int number) {
    if (number >= 10000000) {
      double crore = number / 10000000;
      return '${crore.toStringAsFixed(2)}Cr';
    } else if (number >= 100000) {
      double lakh = number / 100000;
      return '${lakh.toStringAsFixed(2)}L';
    } else {
      return number.toString();
    }
  }

  int parseStringToNumber(String input) {
    input = input.toUpperCase();
    if (input.endsWith('L')) {
      String numberPart = input.substring(0, input.length - 1);
      double lakh = double.parse(numberPart);
      return (lakh * 100000).toInt();
    } else if (input.endsWith('CR')) {
      String numberPart = input.substring(0, input.length - 2);
      double crore = double.parse(numberPart);
      return (crore * 10000000).toInt();
    } else {
      // Handle other cases or throw an error if needed
      throw FormatException('Invalid format: $input');
    }
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (builder) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return new Container(
              // height: 350.0,
              color: Colors.transparent,
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                          topLeft: const Radius.circular(20.0),
                          topRight: const Radius.circular(20.0))),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      const Center(
                        child: Text(
                          'Filters',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            'Property Type',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (var i = 0;
                                    i < propertyTypeFilterList.length;
                                    i++)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: FilterChip(
                                      showCheckmark: false,
                                      selectedColor: ColorsClass.themeColor,
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      label: Text(
                                        propertyTypeFilterList[i]['name']
                                            .toString(),
                                        style: TextStyle(
                                            color: propertyTypeFilterList[i]
                                                        ['selected'] ==
                                                    true
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      selected: bool.parse(
                                          propertyTypeFilterList[i]['selected']
                                              .toString()),
                                      onSelected: (bool value) {
                                        setState(() {
                                          propertyTypeFilterList[i]
                                              ['selected'] = value;
                                        });
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            children: [
                              const Text(
                                'Price',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              const Spacer(),
                              Text(
                                '₹ ${formatNumber(int.parse(start.toStringAsFixed(0)))} - ₹ ${formatNumber(int.parse(end.toStringAsFixed(0)))}',
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: ColorsClass.themeColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        // width: 200,
                        // height: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RangeSlider(
                            values: RangeValues(start, end),
                            labels:
                                RangeLabels(start.toString(), end.toString()),
                            onChanged: (value) {
                              setState(() {
                                start = value.start;
                                end = value.end;
                              });
                            },
                            min: 5000000.0,
                            max: 100000000.0,
                          ),
                        ),
                      ),
                      const Spacer(),
                      GFButtonBar(
                        spacing:10,
                        children: [
                        GFButton(
                          onPressed: () {
                            setState(() {
                              start = 10000000.0;
                              end = 50000000.0;
                              isFirstTime = true;
                            });
                            for (var i = 0;
                                i < propertyTypeFilterList.length;
                                i++) {
                              setState(() {
                                propertyTypeFilterList[i]['selected'] = false;
                              });
                            }
                            Navigator.pop(context);
                            getAllProperties();
                          },
                          text: "Clear All",
                          color: Colors.red,
                          type: GFButtonType.outline2x,
                        ),
                        GFButton(
                          onPressed: () {
                            applySelectedFilter();
                          },
                          text: "Apply",
                          color: ColorsClass.themeColor,
                        ),
                      ])
                    ],
                  )),
            );
          });
        });
  }
}
