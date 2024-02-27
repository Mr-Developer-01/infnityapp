import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/referfriends/referfriend.dart';

class ReferFriendHome extends StatefulWidget {
  const ReferFriendHome({super.key});

  @override
  State<ReferFriendHome> createState() => _ReferFriendHomeState();
}

class _ReferFriendHomeState extends State<ReferFriendHome> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Rewards'),
            bottom: const TabBar(tabs: [
              Tab(text: 'My Rewards'),
              Tab(text: 'History'),
              // Tab(text: 'Refer A Friend'),
            ]),
          ),
          body: TabBarView(children: [
            MyRewards(),
            // TrackIssuesForm(),
            // ReferAFriendPage(),
          ])));
}

// ignore: must_be_immutable
class MyRewards extends StatelessWidget {
  var userList = [
    // {
    //   "name": "Ruslan Bakhtiyar",
    //   "image": "assets/images/user-1.png",
    //   "status": "Panding"
    // },
    {
      "name": "Aysultan Nurgulh erhjree  jerh ",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Gulmira Aina",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Timur Aliya",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Aysultan Nurgul",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Gulmira Aina",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Timur Aliya",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Aysultan Nurgul",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Gulmira Aina",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Timur Aliya",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Aysultan Nurgul",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Gulmira Aina",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
    {
      "name": "Timur Aliya",
      "image": "assets/images/user-1.png",
      "status": "Panding"
    },
  ];

  MyRewards({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: SizedBox(
                width: 400,
                height: 100,
                child: Card(
                  color: Colors.green,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20),
                          child: Row(
                            children: [
                              Text(
                                'My Points',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text('1,200',
                                style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),)
                            ],
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 40),
                        //   child: Row(
                        //     children: [
                        //       Icon(Icons.radio_button_on_sharp,color: Colors.yellow[700],size: 30,),
                        //       SizedBox(width: 10,),
                        //       Text('1,200',
                        //       style: TextStyle(
                        //       color: Colors.white,
                        //       fontSize: 20,
                        //       fontWeight: FontWeight.bold),)
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: TextFormField(
              decoration: InputDecoration(
                suffixIcon: TextButton(
                    onPressed: () async {
                      await Clipboard.setData(
                          const ClipboardData(text: "ABCD7634834"));
                    },
                    child: const Text("COPY")),
                hintText: 'ABCD7634834',
                filled: true,
                fillColor: const Color(0xFFF1F3F4),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors
                          .transparent), // Optional: You can set the borderSide color to transparent if you don't want an outline when not focused.
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: const TextStyle(
                  fontSize: 14,
                ),
                contentPadding: const EdgeInsets.only(
                  left: 10,
                  right: 15,
                ),
              ),
              onChanged: (value) {
                // setState(() {});
              },
              readOnly: true,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: Container(
                width: double.infinity,
                height: 46,
                decoration: BoxDecoration(
                    // color: ColorsClass.themeColor,
                    borderRadius: BorderRadius.circular(8)),
                child: ElevatedButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        ColorsClass.themeColor),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            side: BorderSide(color: ColorsClass.themeColor))),
                  ),
              
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ReferAFriendPage()),
                    );
                  },
                  child: const Text("Refer a friend",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // _tabSection(context)
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _tabSection(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const TabBar(tabs: [
            Tab(text: "Pending"),
            Tab(text: "Completed"),
          ]),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(children: [
                SingleChildScrollView(
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                        itemCount: userList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                  child: Image.asset(
                                    userList[index]['image']!,
                                    height: 40,
                                    width: 40,
                                  )),
                              trailing: Text(
                                userList[index]['status']!,
                                style: TextStyle(
                                    color: Colors.yellow[700], fontSize: 15),
                              ),
                              title: Text(
                                userList[index]['name']!,
                                overflow: TextOverflow.ellipsis,
                              ));
                        }),
                  ),
                ),
                SingleChildScrollView(
                  child: SizedBox(
                    height: 150,
                    child: ListView.builder(
                        itemCount: userList.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                              leading: ClipRRect(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(20)),
                                  child: Image.asset(
                                    userList[index]['image']!,
                                    height: 40,
                                    width: 40,
                                  )),
                              trailing: const Text(
                                'Completed',
                                style: TextStyle(
                                    color: Colors.green, fontSize: 15),
                              ),
                              title: Text(userList[index]['name']!,
                                  overflow: TextOverflow.ellipsis));
                        }),
                  ),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
