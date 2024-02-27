import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/visitors/new_visitor_details.dart';
import 'package:flutter/material.dart';

class AddNewVisitor extends StatefulWidget {
  const AddNewVisitor({super.key});

  @override
  State<AddNewVisitor> createState() => _AddNewVisitorState();
}

class _AddNewVisitorState extends State<AddNewVisitor> {
  var optionList = [
    {"label": "Add Guest", "image": "assets/images/visitoricon.png"},
    {"label": "Add Cab", "image": "assets/images/cab.png"},
    {"label": "Add Delivery", "image": "assets/images/delivery.png"},
    {"label": "Add Service", "image": "assets/images/service.png"},
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
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pre approve visitors',
                style: TextStyle(color: ColorsClass.themeColor, fontSize: 20),
              ),
              Text('Add visitor detail for quick action',
                  style: TextStyle(
                    color: ColorsClass.themeColor,
                  )),
              Padding(
                padding: const EdgeInsets.only(right: 30, top: 20),
                child: Container(
                  height: 450,
                  width: 500,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return RawMaterialButton(
                        splashColor: Colors.white,
                        focusColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewVisitorDetails(
                                    optionList[index]['label']!)),
                          );
                        },
                        child: SizedBox(
                          width: 200,
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 20),
                                child: Column(
                                  children: [
                                    Image.asset(
                                      optionList[index]['image']!,
                                      height: 50,
                                      color: ColorsClass.themeColor,
                                    ),
                                    const Spacer(),
                                    Text(
                                      optionList[index]['label']!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: optionList.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
