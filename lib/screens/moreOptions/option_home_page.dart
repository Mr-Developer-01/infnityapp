import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/moreOptions/post-requirement/post_requirement_page.dart';
import 'package:tribb/screens/moreOptions/property-calculator/property_calculator.dart';
import 'package:tribb/screens/moreOptions/rent%20aggrement/rent_page.dart';
import 'package:tribb/screens/moreOptions/upload-property/upload_property_page.dart';
import 'package:flutter/material.dart';

class OptionHomePage extends StatefulWidget {
  const OptionHomePage({super.key});

  @override
  State<OptionHomePage> createState() => _OptionHomePageState();
}

class _OptionHomePageState extends State<OptionHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ColorsClass.themeColor
        ),
        title:  Text('More Options',style: TextStyle(color: ColorsClass.themeColor)),
      ),
      body: Column(
        children: [
           makeDashboardItem("Rent Agreement", 'assets/images/rent.png',
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RentPage()),
                  );
                }),
           makeDashboardItem("Upload Property", 'assets/images/upload-property.png',
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UploadProperty()),
                  );
                }),
           makeDashboardItem("Post Requirement", 'assets/images/post.png',
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PostRequirementPage()),
                  );
                }),
           makeDashboardItem("Property Cost Calculator", 'assets/images/calculator.png',
                    onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PropertyCalculator()),
                  );
                }),
        ],
      ),
    );
  }

  GestureDetector makeDashboardItem(String title, String icon,
      {required Null Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 8,
        margin: const EdgeInsets.all(10),
        child: Container(
          height: 100,
          color: Colors.white,
          child: Row(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Image.asset(
                    icon,
                    color: ColorsClass.themeColor,
                    height: 50,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: ListTile(
                          // title: Text("Shape Of You"),
                          subtitle: Text(title, style:  TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: ColorsClass.themeColor)),
                        ),
                      ),
                    ],
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
