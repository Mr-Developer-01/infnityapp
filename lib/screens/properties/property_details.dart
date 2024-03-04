// ignore_for_file: pre, must_be_immutable, prefer_typing_uninitialized_variables, deprecated_member_use
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/property_data.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:http/http.dart' as http;

class PropertyDetailsPage extends StatefulWidget {
  var propertyDetails;
  PropertyDetailsPage(this.propertyDetails, {super.key});

  @override
  State<PropertyDetailsPage> createState() => _PropertyDetailsPageState();
}

class _PropertyDetailsPageState extends State<PropertyDetailsPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int tabIndex = 0;
  bool isLoadingMode = true;
  @override
  void initState() {
    getUsername();
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  getUsername() async {
    for (var i = 0; i < PropertyData.userList.length; i++) {
      var name = await generateusername();
      if (mounted) {
        setState(() {
          PropertyData.userList[i] = name;
          if (i == PropertyData.userList.length - 1) {
            isLoadingMode = false;
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var data = widget.propertyDetails;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          '${data['title']}',
          style: TextStyle(fontSize: 15, color: ColorsClass.themeColor),
        ),
        actions: [
          // IconButton(
          //     onPressed: () {
          //       if (mounted) {
          //         setState(() {
          //           data['isWishListed'] = !data['isWishListed'];
          //         });
          //       }
          //     },
          //     icon: data['isWishListed'] == false
          //         ? Icon(Icons.favorite_border, color: ColorsClass.themeColor)
          //         : const Icon(Icons.favorite, color: Colors.red)),
          IconButton(
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomePage123()),
                // );
              },
              icon: Icon(Icons.share, color: ColorsClass.themeColor))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // shape: ,
                  child: Image.network(
                    data['image'],
                    fit: BoxFit.fill,
                    width: double.infinity,
                  ),
                  // elevation:0
                  // showOverlayImage :true
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TabBar(
                tabs: const [
                  Text('Basic Info'),
                  Text('Gallery'),
                  Text('Tenants'),
                  Text('Facilities'),
                  Text('Floors')
                ],
                tabAlignment: TabAlignment.center,
                controller: _tabController,
                indicatorSize: TabBarIndicatorSize.tab,
                // indicatorColor: Colors.white,
                onTap: (value) {
                  if (mounted) {
                    setState(() {
                      tabIndex = value;
                    });
                  }
                },
                isScrollable: true,
                dividerHeight: 0,
                labelColor: ColorsClass.themeColor,
                splashFactory: NoSplash.splashFactory,
              ),
            ),
            if (tabIndex == 0) buildBasicCard(data),
            if (tabIndex == 1) buildImsgeGallery(),
            if (tabIndex == 2) buildTenantCard(),
            if (tabIndex == 3) buildFacilitiesCard(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget buildBasicCard(var data) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Text(
            "In order to manually control the pageview's position, you can create your own CarouselController, and pass it to CarouselSlider. Then you can use the CarouselController instance to manipulate the position.",
            style: TextStyle(color: ColorsClass.themeColor),
          ),
        ),
        Row(
          children: [
            SizedBox(
              width: 180,
              child: GFCard(
                title: GFListTile(
                    title: Center(
                        child:
                            Icon(Icons.star, color: ColorsClass.themeColor))),
                content: Center(
                    child: Text('${data['rating']}',
                        style: TextStyle(color: ColorsClass.themeColor))),
              ),
            ),
            SizedBox(
              width: 180,
              child: GFCard(
                title: GFListTile(
                    title: Center(
                        child: Icon(Icons.currency_rupee,
                            color: ColorsClass.themeColor))),
                content: Center(
                    child: Text('${data['price']}',
                        style: TextStyle(color: ColorsClass.themeColor))),
              ),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () async {
                String url =
                    'geo:0,0?q=${data['location']}';
                Uri url0 = Uri.parse(url);
                launchUrl(url0, mode: LaunchMode.externalApplication);
              },
              child: SizedBox(
                width: 180,
                child: GFCard(
                  title: GFListTile(
                      title: Center(
                          child: Icon(Icons.location_on_outlined,
                              color: ColorsClass.themeColor))),
                  content: Center(
                      child: Text('${data['location']}',
                          style: TextStyle(color: ColorsClass.themeColor))),
                ),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () async {
                String url = 'tel:7984336587';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: SizedBox(
                width: 180,
                child: GFCard(
                  title: GFListTile(
                    title: Center(
                        child:
                            Icon(Icons.phone, color: ColorsClass.themeColor)),
                  ),
                  content: Center(
                      child: Text('7984336587',
                          style: TextStyle(color: ColorsClass.themeColor))),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildImsgeGallery() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Container(
        height: 450,
        width: 500,
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return RawMaterialButton(
              splashColor: Colors.white,
              focusColor: Colors.white,
              onPressed: () {},
              child: Hero(
                tag: 'logo$index',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(PropertyData.images[index].imagePath),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: PropertyData.images.length,
        ),
      ),
    );
  }

  Widget buildTenantCard() {
    return SizedBox(
        height: 400,
        width: 500,
        child: !isLoadingMode
            ? ListView.builder(
                itemCount: PropertyData.userList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: ListTile(
                      leading: Image.network(
                          generateAvatar(PropertyData.userList[index])),
                      trailing: Wrap(
                        spacing: 0, // space between two icons
                        children: <Widget>[
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.call,
                                color: ColorsClass.themeColor,
                              )), // icon-1
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.message,
                                color: ColorsClass.themeColor,
                              )), // icon-1
                        ],
                      ),
                      title: Text(PropertyData.userList[index]),
                      subtitle: Text('B-20$index'),
                    ),
                  );
                })
            : const Center(child: CircularProgressIndicator()));
  }

  String generateAvatar(String username) {
    return 'https://avatar.iran.liara.run/public/boy?username=$username'; // Return URL with generated hash
  }

  generateusername() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var fullname = jsonData['results'][0]['name']['first'] +
          ' ' +
          jsonData['results'][0]['name']['last'];
      return fullname;
    } else {
      return 'Test ';
    }
  }

  Widget buildFacilitiesCard() {
    return Container(
      height: 450,
      width: 500,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return RawMaterialButton(
            splashColor: Colors.white,
            focusColor: Colors.white,
            onPressed: () {},
            child: GFCard(
              title: GFListTile(
                  title: Center(
                      child: PropertyData.facilitiesList[index]['icon']
                          as Widget)),
              content: Text(
                PropertyData.facilitiesList[index]['name'].toString(),
                style: TextStyle(color: ColorsClass.themeColor),
              ),
            ),
          );
        },
        itemCount: PropertyData.facilitiesList.length,
      ),
    );
  }
}
