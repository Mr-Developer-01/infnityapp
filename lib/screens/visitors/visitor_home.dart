import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/visitors/visitor_add_new.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class VisitorPage extends StatefulWidget {
  const VisitorPage({super.key});

  @override
  State<VisitorPage> createState() => _VisitorPageState();
}

class _VisitorPageState extends State<VisitorPage> {
  var visitorList = [
    {
      "name": "Brooklyn Simmons(maid)",
      "image": "assets/images/visitor1.png",
      "time": "22 Aug, 03:30 PM",
      "status": "Inside"
    },
    {
      "name": "Brooklyn Simmons(maid)",
      "image": "assets/images/visitor2.png",
      "time": "22 Aug, 03:30 PM",
      "status": "Pre-approved"
    },
    {
      "name": "Cab Booking(Uber 2250)",
      "image": "assets/images/car.png",
      "time": "22 Aug, 04:30 PM",
      "status": "Pre-approved"
    },
    {
      "name": "Appliances repair",
      "image": "assets/images/visitor3.png",
      "time": "22 Aug, 03:30 PM",
      "status": "Service Booking"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'Visitors',
          style: TextStyle(color: ColorsClass.themeColor),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
            itemCount: visitorList.length,
            itemBuilder: (BuildContext context, int index) {
              return GFCard(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                              image: AssetImage(
                                visitorList[index]['image']!,
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
                          visitorList[index]['name'].toString(),
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          visitorList[index]['time'].toString(),
                          style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(visitorList[index]['status'].toString()),
                      ],
                    )
                  ],
                ),
                buttonBar: GFButtonBar(spacing: 0, children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.call),
                      label: const Text('Call')),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.delete),
                      label: const Text('Delete')),
                  TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.list_alt_outlined),
                      label: const Text('Gatepass')),
                ]),
              );
            }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 50, right: 50),
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorsClass.themeColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      side: BorderSide(color: ColorsClass.themeColor)))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNewVisitor()),
            );
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Pre approve visitors",
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }
}
