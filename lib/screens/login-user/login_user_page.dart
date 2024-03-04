// import 'package:apnedost/screens/home/home_screen.dart';
// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:tribb/screens/constant/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flash/flash.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isShowPasswrd = true;
  bool isLoadingMode = false;
  void handleEyeButton() {
    if(mounted){
setState(() {
      isShowPasswrd = !isShowPasswrd;
    });
    }
    
  }

  Future handleLoginUsingEmailPassword() async {
    setState(() {
      isLoadingMode = true;
    });
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim());
      user = userCredential.user;
      if (user != null) {
       if(mounted){
         setState(() {
          isLoadingMode = false;
        });
       }
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/bottombar', (Route<dynamic> route) => false);
      } else {
       if(mounted){
         setState(() {
          isLoadingMode = false;
        });
       }
        _showCustomFlash('Something went wrong, try again later');
      }
    } on FirebaseAuthException catch (e) {
      _showCustomFlash(e.message);
      if(mounted){
         setState(() {
          isLoadingMode = false;
        });
       }
    }
  }

   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: ColorsClass.themeColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 130,
              ),
              Container(
                // height: 600,
                width: 325,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/images/applogo.png',
                          height: 100,
                          width: 150,
                          color: ColorsClass.themeColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text('Please Login to Your Account',
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          autocorrect :false,
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'This field is requied';
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: const InputDecoration(
                              labelText: 'Email Address',
                              prefixIcon: Icon(FontAwesomeIcons.envelope)),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value == '') {
                              return 'This field is requied';
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: isShowPasswrd,
                          decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: const Icon(FontAwesomeIcons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    handleEyeButton();
                                  },
                                  icon: isShowPasswrd
                                      ? const Icon(FontAwesomeIcons.eyeSlash)
                                      : const Icon(FontAwesomeIcons.eye))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 5, 40, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forget Password',
                                  style:
                                      TextStyle(color: ColorsClass.themeColor),
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      isLoadingMode
                          ? const Center(
                              child: CircularProgressIndicator(
                                  semanticsLabel: "Loading..."),
                            )
                          : GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                if (_formKey.currentState!.validate()) {
                                  handleLoginUsingEmailPassword();
                                }

                                //  Navigator.push(
                                // context,
                                // MaterialPageRoute(
                                //     builder: (context) => BottomBar()));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 250,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: ColorsClass.themeColor),
                                child: const Padding(
                                  padding: EdgeInsets.all(12.0),
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account yet?'),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign Up',
                                style: TextStyle(color: ColorsClass.themeColor),
                              )),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showCustomFlash(var error) {
    showFlash(
      // barrierDismissible :true,
      context: context,
      builder: (_, controller) {
        Future.delayed(const Duration(seconds: 5), () {
          controller.dismiss();
        });
        return Flash(
          controller: controller,
          position: FlashPosition.top,
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.red),
            child: FlashBar(
              showProgressIndicator: true,
              behavior: FlashBehavior.floating,
              position: FlashPosition.top,
              controller: controller,
              title: const Text(
                'Error',
                style: TextStyle(color: Colors.red),
              ),
              content:  Text(error,
                  style: const TextStyle(color: Colors.red)),
              indicatorColor: Colors.red,
              icon: const Icon(
                Icons.info_outline_rounded,
                color: Colors.red,
              ),
              primaryAction: TextButton(
                  onPressed: () => controller.dismiss(),
                  child: const Icon(
                    Icons.close,
                    color: Colors.red,
                  )),
            ),
          ),
        );
      },
    );
  }
}
