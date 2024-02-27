import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/custom_bottom_bar.dart';

import 'page/profile_page.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  _UpdateProfileScreenState();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // endDrawer: const NavDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
       
        iconTheme:  IconThemeData(color: ColorsClass.themeColor,),
        centerTitle: true,
        title:  Text('Profile',style: TextStyle(color: ColorsClass.themeColor,fontWeight: FontWeight.bold),),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: const <Widget>[
          // IconButton(
          //   icon: const Icon(Icons.menu),
          //   tooltip: 'Menu',
          //   onPressed: () => _scaffoldKey.currentState!.openEndDrawer(),
          // ), //IconButton
        ],
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg-image.jpg'),
                    fit: BoxFit.fill)),
            height: 500,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              
              // width: double.infinity,
              height: 550,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                ),
              child: const ProfilePage(),
              ),
            )
        ],
      ),
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
