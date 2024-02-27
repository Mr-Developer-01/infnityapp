import 'dart:async';

import 'package:tribb/screens/login-user/login_user_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/bottom_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // await ScreenUtil.ensureScreenSize();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('pageIndex');
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = true;
  @override
  void initState() {
    setIndex();
    super.initState();
  }

  setIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getInt('groupValue') != null) {
      ColorsClass.setColor(prefs.getInt('groupValue'));
    } else {
      ColorsClass.setColor(0);
    }

    Timer(
      const Duration(seconds: 5),
      () => setState(() {
        isLoading = false;
      }),
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'TriBb',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorsClass.themeColor),
          useMaterial3: true,
        ),
        // home:  const BottomBar(),
        initialRoute: '/',
        routes: {
          // '/' :(context) => HomePage(testCallback: (){},),
          '/': (context) => isLoading
              ? const Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                )
              :FirebaseAuth.instance.currentUser != null? const BottomBar():const LoginPage(),
          '/app': (context) => const MyApp(),
          '/bottombar': (context) => const BottomBar()
        });
  }
}

class SetTheme extends StatefulWidget {
  const SetTheme({super.key});

  @override
  State<SetTheme> createState() => _SetThemeState();
}

class _SetThemeState extends State<SetTheme> {
  bool isLoading = true;
  @override
  void initState() {
    setIndex();
    super.initState();
  }

  setIndex() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    ColorsClass.setColor(prefs.getInt('groupValue'));
  }

  @override
  Widget build(BuildContext context) {
    return const BottomBar();
  }
}
