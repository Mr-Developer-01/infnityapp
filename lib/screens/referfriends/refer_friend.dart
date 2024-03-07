import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/custom_bottom_bar.dart';
import 'package:tribb/screens/referfriends/referfriend.dart';
import 'package:share/share.dart';
import 'package:popup_menu/popup_menu.dart';

class ReferFriendPage extends StatefulWidget {
  const ReferFriendPage({super.key});

  @override
  State<ReferFriendPage> createState() => _ReferFriendPageState();
}

class _ReferFriendPageState extends State<ReferFriendPage> {
  var referCode = '';
  void onClickMenu(MenuItemProvider item) {}

  void onDismiss() {}
getReferralCode()async{
   final usersRef = await FirebaseFirestore.instance
        .collection('users')
        .where("uId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (usersRef.docs.isNotEmpty) {
      setState(() {
        referCode = usersRef.docs[0]['referral_code'];
      });
    }
}
@override
  void initState() {
    getReferralCode();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorsClass.themeColor, //change your color here
        ),
        title: Text('Invite Friends',
            style: TextStyle(
                color: ColorsClass.themeColor, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
                child: Image.asset(
              'assets/images/friend.png',
              height: 150,
            )),
            ListTile(
              title: Text(
                'Refer & Earn',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: ColorsClass.themeColor,
                ),
              ),
              subtitle: Text(
                'Get rewarded up to 1000 points when you refer',
                style: TextStyle(
                  color: ColorsClass.themeColor,
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          referCode != ''?referCode:'Loding...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ColorsClass.themeColor,
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.copy,
                              color: ColorsClass.themeColor,
                            ))
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(left: 40, right: 10),
                      child: Container(
                        // width: double.infinity,
                        // height: 46,
                        decoration: const BoxDecoration(
                            // color: ColorsClass.themeColor,
                            ),
                        child: const Button(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            // const SizedBox(
            //   height: 5,
            // ),
            ListTile(
              title: Text(
                'Available points',
                style: TextStyle(
                  color: ColorsClass.themeColor,
                  fontSize: 20,
                ),
              ),
              subtitle: Text(
                '3000',
                style: TextStyle(
                  color: ColorsClass.themeColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: Colors.grey
                ),
              ),
              trailing: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => const TestApp()),
                  // );
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          5), // Adjust the value as needed
                    ),
                  ),
                ),
                child: Text(
                  'Redeem Points',
                  style: TextStyle(color: ColorsClass.themeColor),
                ),
              ),
            ),
            const Divider(),

            Expanded(
              flex: -2,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2.30,
                          height: 100,
                          decoration: BoxDecoration(
                            // color: Colors.green,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Text(
                                  'Earned Points',
                                  style: TextStyle(
                                    color: ColorsClass.themeColor,
                                  ),
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '7000',
                                  style: TextStyle(
                                      color: ColorsClass.themeColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // const SizedBox(width: 5,),
                      Card(
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.30,
                          decoration: BoxDecoration(
                            // color: Colors.green,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Text(
                                  'Claimed Points',
                                  style: TextStyle(
                                    color: ColorsClass.themeColor,
                                  ),
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '4000',
                                  style: TextStyle(
                                      color: ColorsClass.themeColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                flex: -1,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.30,
                          decoration: BoxDecoration(
                            // color: Colors.green,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Text(
                                  'Completed Referrals',
                                  style: TextStyle(
                                    color: ColorsClass.themeColor,
                                  ),
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '7',
                                  style: TextStyle(
                                      color: ColorsClass.themeColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 2.30,
                          decoration: BoxDecoration(
                            // color: Colors.green,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(10),
                            // border: Border.all(color: Colors.grey)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                    child: Text(
                                  'Pending Referrals',
                                  style: TextStyle(
                                    color: ColorsClass.themeColor,
                                  ),
                                )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '1',
                                  style: TextStyle(
                                      color: ColorsClass.themeColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            const Divider(
              thickness: 3,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}

class Button extends StatelessWidget {
  const Button({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: ColorsClass.themeColor,
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 5)],
        ),
        child: const Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_add_alt_1,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              'Invite',
              style: TextStyle(color: Colors.white),
            ),
          ],
        )),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ReferAFriendPage()),
        );

        // showPopover(
        //   arrowHeight: 0,
        //   // arrowDyOffset: 20,
        //   contentDxOffset: -100,
        //   context: context,
        //   bodyBuilder: (context) => const ListItems(),
        //   // ignore: avoid_print
        //   onPop: () => print('Popover was popped!'),
        //   direction: PopoverDirection.top,
        //   width: 150,
        //   height: 100,
        //   // arrowHeight: 15,
        //   // arrowWidth: 30,
        // );
      },
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8,
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              Share.share('7BHE78');
            },
            child: const SizedBox(
              height: 40,
              child: Text('Share via link', style: TextStyle(fontSize: 15)),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //   ..pop()
              //   ..push(
              //     MaterialPageRoute<SecondRoute>(
              //       builder: (context) => const ReferAFriendPage(),
              //     ),
              //   );
            },
            child: const SizedBox(
              height: 50,
              child: Text(
                'Share via details',
                style: TextStyle(fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
