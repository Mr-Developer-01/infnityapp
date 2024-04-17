// ignore_for_file: prefer_typing_uninitialized_variables, empty_catches, non_constant_identifier_names

import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tribb/screens/Profile/profile_home_page.dart';
import 'package:tribb/screens/moreOptions/option_home_page.dart';
import 'package:tribb/screens/properties/property_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/referfriends/refer_friend.dart';
import 'package:tribb/screens/search-property/search_home_page.dart';
// import 'package:motion_toast/motion_toast.dart';

class HomePage extends StatefulWidget {
  final VoidCallback testCallback;
  const HomePage({super.key, required this.testCallback});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var ultraLuxury;
  var luxury;
  var premium;
  var forRent;
  var base64Image;
  var profile_pic =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfBUN-KgxbARoHkAW0nmjoKhGuRSy3flEQMeulh4TRCGNuFv5LJh7MTmA3sV1MkIr9uGk&usqp=CAU';
  Future<void> getAllProperties() async {
    var ultraTemp = [];
    var luxTemp = [];
    var priTemp = [];
    var forRTemp = [];
    setState(() {
      ultraLuxury = null;
      luxury = null;
      premium = null;
      forRent = null;
    });
    final usersRef = FirebaseFirestore.instance.collection('allproperties');
    final userDoc = await usersRef.doc('propertyTypes').get();
    final ultraLuxuryData = userDoc.reference.collection('ultra_luxury');
    final luxuryData = userDoc.reference.collection('luxury');
    final premiumData = userDoc.reference.collection('premium');
    final forRentList = userDoc.reference.collection('for_rent');
    //  final postsQuerySnapshot = await _ultraLuxury.get();
    var ultraLuxurytemp = await ultraLuxuryData.get();
    var luxurytemp = await luxuryData.get();
    var premiumtemp = await premiumData.get();
    var forRentTemp = await forRentList.get();

    for (var element in ultraLuxurytemp.docs) {
      var objData = await getWishLitedProperties(element.id);
      var jsoData = jsonDecode(jsonEncode(objData));
      ultraTemp.add({
        "id": element.id,
        "title": element.data()['title'],
        "image": element.data()['image'],
        "rating": element.data()['rating'],
        "price": element.data()['price'],
        "location": element.data()['location'],
        "isWishListed": jsoData['isWishListed'],
        "WishListedid": jsoData['id'],
      });
    }
    for (var element in luxurytemp.docs) {
      var objData = await getWishLitedProperties(element.id);
      var jsoData = jsonDecode(jsonEncode(objData));
      luxTemp.add({
        "id": element.id,
        "title": element.data()['title'],
        "image": element.data()['image'],
        "rating": element.data()['rating'],
        "price": element.data()['price'],
        "location": element.data()['location'],
        "isWishListed": jsoData['isWishListed'],
        "WishListedid": jsoData['id'],
      });
    }
    for (var element in premiumtemp.docs) {
      var objData = await getWishLitedProperties(element.id);
      var jsoData = jsonDecode(jsonEncode(objData));
      priTemp.add({
        "id": element.id,
        "title": element.data()['title'],
        "image": element.data()['image'],
        "rating": element.data()['rating'],
        "price": element.data()['price'],
        "location": element.data()['location'],
        "isWishListed": jsoData['isWishListed'],
        "WishListedid": jsoData['id'],
      });
    }
    for (var element in forRentTemp.docs) {
      var objData = await getWishLitedProperties(element.id);
      var jsoData = jsonDecode(jsonEncode(objData));
      forRTemp.add({
        "id": element.id,
        "title": element.data()['title'] ?? '',
        "image": element.data()['image'] ?? '',
        "rating": element.data()['rating'] ?? '',
        "price": element.data()['price'] ?? '',
        "location": element.data()['location'] ?? '',
        "isWishListed": jsoData['isWishListed'] ?? '',
        "WishListedid": jsoData['id'] ?? '',
      });
    }
    if (mounted) {
      setState(() {
        ultraLuxury = ultraTemp;
        luxury = luxTemp;
        premium = priTemp;
        forRent = forRTemp;
      });
    }
  }

  Future<Object> getWishLitedProperties(var propid) async {
    final usersRef = FirebaseFirestore.instance.collection('allproperties');
    final userDoc = await usersRef.doc('propertyTypes').get();
    final ultraLuxuryData = await userDoc.reference
        .collection('user_wish_list')
        .where('property_id', isEqualTo: propid)
        .where('user_id', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (ultraLuxuryData.docs.isNotEmpty) {
      return {
        "isWishListed": ultraLuxuryData.docs[0]['isWishListed'],
        "id": ultraLuxuryData.docs[0].id
      };
    }
    return {"isWishListed": false, "id": ""};
  }

  showToastMessage(message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  getUserDetails() async {
    final usersRef = await FirebaseFirestore.instance
        .collection('users')
        .where("uId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (usersRef.docs.isNotEmpty) {
      setState(() {
        base64Image = usersRef.docs[0]['profile_pic'];
      });
    } else {}
  }

  @override
  void initState() {
    getAllProperties();
    getUserDetails();
    super.initState();
  }

  var offersList = [
    {
      "name": "Special offer of laptops",
      "startdate": "2000-02-12",
      "enddate": "2000-02-20",
      "des":
          "From classic percent-off discounts, to teacher-only specials, to joint promotions with complementary businesses, there’s something in here for everyone.",
      "image": "assets/images/off-1.png"
    },
    {
      "name": "70 % off on Phones",
      "startdate": "2000-01-20",
      "enddate": "2000-01-30",
      "des": "Up to 70% Off Clearance sale",
      "image": "assets/images/off-2.png"
    },
    {
      "name": "Limited offer on Shoes",
      "startdate": "2000-01-30",
      "enddate": "2000-01-31",
      "des": "5 Days Only: ",
      "image": "assets/images/off-3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/applogo.png',
          height: 100,
          width: 115,
          color: ColorsClass.themeColor,
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ProfileHomePage()),
              ).then((val) {
                getUserDetails();
                getAllProperties();
              });
            },
            child: base64Image == null
                ? CircleAvatar(
                    backgroundImage: NetworkImage(profile_pic),
                  )
                : CircleAvatar(
                    backgroundImage:
                        MemoryImage(const Base64Decoder().convert(base64Image)),
                  ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Stack(
              children: [
                IconButton.outlined(
                  style: ButtonStyle(
                    side: MaterialStatePropertyAll(
                      BorderSide(color: ColorsClass.themeColor),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //       builder: (context) => MyHomePageChart()),
                    // );
                  },
                  icon: Icon(
                    Icons.notifications_none_sharp,
                    color: ColorsClass.themeColor,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: ColorsClass.themeColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Text(
                      '', // You can dynamically set the count here
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0, top: 10, right: 20),
              child: Align(
                alignment: Alignment.center,
                child: SearchBox(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Offers',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsClass.themeColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 14),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 6,
                    child: ExpandableCarousel(
                      options: CarouselOptions(
                        autoPlay: true,
                        // enableInfiniteScroll: true,

                        autoPlayInterval: const Duration(seconds: 2),
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(child: buildcard());
                          },
                        );
                      }).toList(),
                    ))),
            Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                      // minHeight: 100,
                      minWidth: 100),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleButton(
                            onPressed: () {
                              widget.testCallback();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const Myproperty()),
                              // );
                            },
                            icon: Icons.location_city,
                            label: 'My Properties',
                          ),
                          CircleButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ProfileHomePage()),
                              );
                            },
                            icon: Icons.person,
                            label: 'Profile',
                          ),
                          // SizedBox(width: 20,),
                          CircleButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ReferFriendPage()),
                              );
                            },
                            icon: Icons.group_add,
                            label: 'Invite Friends',
                          ),
                          //  SizedBox(width: 10,),

                          // SizedBox(width: 10,),
                          CircleButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const OptionHomePage()),
                              );
                            },
                            icon: Icons.apps,
                            label: 'More',
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Ultra Luxury',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsClass.themeColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              width: 500,
              child: ultraLuxury != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: ultraLuxury.length,
                      itemBuilder: (context, index) {
                        return _tabSection(context, {
                          "id": ultraLuxury[index]['id'],
                          "title": ultraLuxury[index]['title'],
                          "image": ultraLuxury[index]['image'],
                          "rating": ultraLuxury[index]['rating'],
                          "price": ultraLuxury[index]['price'],
                          "location": ultraLuxury[index]['location'],
                          "isWishListed": ultraLuxury[index]['isWishListed'],
                          "WishListedid": ultraLuxury[index]['WishListedid'],
                          "index": index,
                          "type": "Ultra Luxury"
                        });
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Luxury',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsClass.themeColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              width: 500,
              child: luxury != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: luxury.length,
                      itemBuilder: (context, index) {
                        return _tabSection(context, {
                          "id": luxury[index]['id'],
                          "title": luxury[index]['title'],
                          "image": luxury[index]['image'],
                          "rating": luxury[index]['rating'],
                          "price": luxury[index]['price'],
                          "location": luxury[index]['location'],
                          "isWishListed": luxury[index]['isWishListed'],
                          "WishListedid": luxury[index]['WishListedid'],
                          "index": index,
                          "type": "Luxury"
                        });
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Premium',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsClass.themeColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              width: 500,
              child: premium != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: premium.length,
                      itemBuilder: (context, index) {
                        return _tabSection(context, {
                          "id": premium[index]['id'],
                          "title": premium[index]['title'],
                          "image": premium[index]['image'],
                          "rating": premium[index]['rating'],
                          "price": premium[index]['price'],
                          "location": premium[index]['location'],
                          "isWishListed": premium[index]['isWishListed'],
                          "WishListedid": premium[index]['WishListedid'],
                          "index": index,
                          "type": "Premium"
                        });
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            // const SizedBox(
            //   height: 40,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'For Rent ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsClass.themeColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 250,
              width: 500,
              child: forRent != null
                  ? ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: forRent.length,
                      itemBuilder: (context, index) {
                        return _tabSection(context, {
                          "id": forRent[index]['id'],
                          "title": forRent[index]['title'],
                          "image": forRent[index]['image'],
                          "rating": forRent[index]['rating'],
                          "price": forRent[index]['price'],
                          "location": forRent[index]['location'],
                          "isWishListed": forRent[index]['isWishListed'],
                          "WishListedid": forRent[index]['WishListedid'],
                          "index": index,
                          "type": "For Rent"
                        });
                      })
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Cloud Certitude Private Limited, 2nd-3rd Floor, B 6-7, Unique Tower,main, Pushkar Rd, near Bank of Baroda, Haribhau Upadhyay Nagar,Ajmer, Rajasthan 305001',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorsClass.themeColor,
                    fontSize: 13,
                    // fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildcard() {
    return SizedBox(
      child: Card(
        color: ColorsClass.themeColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.hardEdge,
        child: InkWell(
          child: SizedBox(
            height: 100,
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(20, 14, 20, 0),
                  child: Text(
                    'Find Your Perfect Home With Us ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Image.asset(
                      'assets/images/image.png',
                      width: 100,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tabSection(BuildContext context, var data) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 3,
              // minHeight: MediaQuery.of(context).size.height / 4,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                // height: MediaQuery.of(context).size.height / 3.5,
                child: SizedBox(
                  // width: MediaQuery.of(context).size.height / 4,
                  // height: 90,
                  child: Padding(
                    padding: const EdgeInsets.only(),
                    child: Card(
                      //  elevation: 0, // No shadow for the image card
                      clipBehavior:
                          Clip.antiAlias, // Clip the image card's content
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PropertyDetailsPage(data)),
                          );
                        },
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: 100,
                              maxHeight: 200,
                              maxWidth: MediaQuery.of(context).size.height / 4,
                              minWidth: MediaQuery.of(context).size.height / 4),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                                child: Stack(
                                  children: [
                                    Image.network(
                                      data['image'],
                                      height: 120,
                                      width: double.infinity,
                                      fit: BoxFit.fill,
                                    ),
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            onPressed: () async {
                                              var usersRef = FirebaseFirestore
                                                  .instance
                                                  .collection('allproperties');
                                              var userDocRef =
                                                  usersRef.doc('propertyTypes');
                                              var postsRef = userDocRef
                                                  .collection('user_wish_list');

                                              if (data['isWishListed'] ==
                                                  true) {
                                                var postDocRef = await postsRef
                                                    .doc(data['WishListedid'])
                                                    .get();
                                                try {
                                                  await postDocRef.reference
                                                      .delete();
                                                  showToastMessage(
                                                      'Property removed from wish list');
                                                  if (mounted) {
                                                    setState(() {
                                                      if (data['type'] ==
                                                          'Ultra Luxury') {
                                                        ultraLuxury[data[
                                                                    'index']][
                                                                'isWishListed'] =
                                                            false;
                                                      } else if (data['type'] ==
                                                          'Luxury') {
                                                        luxury[data['index']][
                                                                'isWishListed'] =
                                                            false;
                                                      } else if (data['type'] ==
                                                          'Premium') {
                                                        premium[data['index']][
                                                                'isWishListed'] =
                                                            false;
                                                      }
                                                    });
                                                  }
                                                } catch (e) {}
                                              } else {
                                                final newDocRef =
                                                    await postsRef.add({
                                                  "isWishListed": true,
                                                  'property_id': data['id'],
                                                  'user_id': FirebaseAuth
                                                      .instance
                                                      .currentUser!
                                                      .uid,
                                                });
                                                if (mounted) {
                                                  setState(() {
                                                    if (data['type'] ==
                                                        'Ultra Luxury') {
                                                      ultraLuxury[data['index']]
                                                              ['isWishListed'] =
                                                          true;
                                                      ultraLuxury[data['index']]
                                                              ['WishListedid'] =
                                                          newDocRef.id;
                                                    } else if (data['type'] ==
                                                        'Luxury') {
                                                      luxury[data['index']]
                                                              ['isWishListed'] =
                                                          true;
                                                      luxury[data['index']]
                                                              ['WishListedid'] =
                                                          newDocRef.id;
                                                    } else if (data['type'] ==
                                                        'Premium') {
                                                      premium[data['index']]
                                                              ['isWishListed'] =
                                                          true;
                                                      premium[data['index']]
                                                              ['WishListedid'] =
                                                          newDocRef.id;
                                                    }
                                                  });
                                                }
                                                showToastMessage(
                                                    'Property added to wish list');
                                                // });
                                              }
                                            },
                                            icon: data['isWishListed'] == false
                                                ? const Icon(
                                                    Icons
                                                        .favorite_border_outlined,
                                                    color: Colors.white,
                                                  )
                                                : const Icon(
                                                    Icons.favorite_sharp,
                                                    color: Colors.red,
                                                  ))),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 5),
                                child: Row(
                                  children: [
                                    Text(
                                      data['title']!.toString(),
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: ColorsClass.themeColor,
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        data['rating']!.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: ColorsClass.themeColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: ColorsClass.themeColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      data['location']!.toString(),
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorsClass.themeColor,
                                      ),
                                    ),
                                    const Spacer(),
                                    Text(
                                      '₹ ${data['price']!}',
                                      style: TextStyle(
                                        color: ColorsClass.themeColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
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
                  ),
                ),
              ),
            ),
          ))
    ]);
  }
}

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchProprties()),
        );
      },
      child: TextField(
        enabled: false,
        // readOnly: true,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            grade: 10,
            weight: 10,
            color: ColorsClass.themeColor,
          ), // Leading icon
          // suffixIcon: Icon(Icons.tune_rounded,
          //     color: ColorsClass.themeColor), // Trailing icon
          hintText: 'Search',

          hintStyle: TextStyle(
            color: ColorsClass.themeColor,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          filled: true,
          fillColor: ColorsClass.fillColor,
        ),
        onChanged: (value) {
          //print('Search text: $value');
        },
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String label;

  const CircleButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        // height: 100,
        // width: 100,
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                //set border radius more than 50% of height and width to make circle
              ),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                    minHeight: 70, minWidth: 60, maxHeight: 70, maxWidth: 70),
                child: SizedBox(
                  // width: 60,
                  // height: 70,
                  child: Container(
                    // width: 50.0,
                    // height: 50.0,
                    margin: const EdgeInsets.only(top: 15, bottom: 30),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors
                          .transparent, // You can change the color as per your requirement
                    ),
                    child: Center(
                      child: Icon(
                        icon,
                        size: 40.0,
                        color: ColorsClass.themeColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              label,
              style: TextStyle(
                  fontSize: 12,
                  color: ColorsClass.themeColor,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
