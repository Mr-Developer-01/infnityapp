// import 'package:firebase_auth/firebase_auth.dart';
import 'package:getwidget/getwidget.dart';
import 'package:tribb/screens/constant/test.dart';
import 'package:tribb/screens/moreOptions/option_home_page.dart';
import 'package:tribb/screens/properties/property_detsails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:tribb/screens/Profile/profile_page.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/referfriends/refer_friend.dart';
// import 'package:motion_toast/motion_toast.dart';

class HomePage extends StatefulWidget {
  final VoidCallback testCallback;
  const HomePage({super.key, required this.testCallback});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
// FirebaseAuth auth = FirebaseAuth.instance;
//  User? user;
//   loginMethod() async{
//     try{
// UserCredential userCredential = await auth.signInWithEmailAndPassword(email: "deepu.singh@cloudcertitude.com", password: "Cloud@#123");
//   user = userCredential.user;
//   if(user != null){
//     print('##################################Done################################');
//   }else{
//     print('##################################Error1################################');

//   }
//     }catch(e){
//     print('##################################Error2####$e');

//     }

//   }
  @override
  void initState() {
    //  loginMethod();
    super.initState();
  }

  var projectList = [
    {
      "name": "CONSCIENT HINES",
      "rating": "4.9",
      "location": "Gurgaon",
      "sqft": "2095 – 3395 Sq. Ft.",
      "amount": "3.87 Cr",
      "image":
          "https://i.pinimg.com/564x/60/44/ed/6044edd88afec0f09dbe0c6e50df27e4.jpg",
      "isWishListed": false
    },
    {
      "name": "TRUMP TOWER",
      "rating": "4.9",
      "location": "Gurgaon",
      "sqft": "3525 – 6050 Sq. Ft.",
      "amount": "8.52 Cr",
      "image":
          "https://i.pinimg.com/564x/35/fc/08/35fc08f04ead397a85806147e2a9e4e6.jpg",
      "isWishListed": false
    },
    {
      "name": "MAHINDRA",
      "rating": "4.9",
      "location": "Gurgaon",
      "sqft": "3106 – 5187 Sq. Ft.",
      "amount": "5.20 Cr",
      "image":
          "https://i.pinimg.com/474x/1a/54/d9/1a54d98f61408e226a80506713cfea04.jpg",
      "isWishListed": false
    },
    {
      "name": "CENTRAL PARK ",
      "rating": "4.9",
      "location": "Gurgaon",
      "sqft": "1065 – 1607 Sq. Ft.",
      "amount": "1.85 Cr",
      "image":
          "https://i.pinimg.com/564x/ee/a8/89/eea889eab390905a6104690e2de31237.jpg",
      "isWishListed": false
    },
  ];
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
                    builder: (context) => const UpdateProfileScreen()),
              );
            },
            child: const GFAvatar(
              backgroundImage: AssetImage(
                "assets/images/userImage.jpg",
              ),
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
                          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  MyHomePageChart()),
                    );
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
                                        const UpdateProfileScreen()),
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
            _tabSection(context),
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
            _tabSection(context),
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
            _tabSection(context),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'DG-B-1704 & 05, 17th Floor, Emaar Digital Green, Golf course Extn. Road, Sector-61, Gurugram, Haryana 122011',
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

  Widget _tabSection(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 4,
              // minHeight: MediaQuery.of(context).size.height / 4,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SizedBox(
                // height: MediaQuery.of(context).size.height / 3.5,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: projectList.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
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
                                      builder: (context) => PropertyDetailsPage(
                                          projectList[index])),
                                );
                              },
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                    minHeight: 100,
                                    maxHeight: 100,
                                    maxWidth:
                                        MediaQuery.of(context).size.height / 4,
                                    minWidth:
                                        MediaQuery.of(context).size.height / 4),
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
                                            projectList[index]['image']
                                                .toString(),
                                            height: 100,
                                            width: double.infinity,
                                            fit: BoxFit.fill,
                                          ),
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      projectList[index][
                                                                  'isWishListed'] ==
                                                              false
                                                          ? projectList[index][
                                                                  'isWishListed'] =
                                                              true
                                                          : projectList[index][
                                                                  'isWishListed'] =
                                                              false;
                                                    });
                                                  },
                                                  icon: projectList[index][
                                                              'isWishListed'] ==
                                                          false
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
                                            projectList[index]['name']!
                                                .toString(),
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
                                              projectList[index]['rating']!
                                                  .toString(),
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: ColorsClass.themeColor,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            projectList[index]['location']!
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: ColorsClass.themeColor,
                                            ),
                                          ),
                                          const Spacer(),
                                          Text(
                                            '₹ ${projectList[index]['amount']!}',
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
                      );
                    }),
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
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          grade: 10,
          weight: 10,
          color: ColorsClass.themeColor,
        ), // Leading icon
        suffixIcon: Icon(Icons.tune_rounded,
            color: ColorsClass.themeColor), // Trailing icon
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
