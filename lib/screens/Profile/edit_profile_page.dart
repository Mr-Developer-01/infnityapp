// ignore_for_file: use_build_context_synchronously, prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tribb/screens/constant/colors.dart';
import 'package:tribb/screens/constant/input_field.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:tribb/screens/constant/toast_message.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController referralcode = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isEditingMode = false;
  bool isLoadingMode = false;
  var base64Image;
  var imagepath;
  var user_Id;
  var profile_pic =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRfBUN-KgxbARoHkAW0nmjoKhGuRSy3flEQMeulh4TRCGNuFv5LJh7MTmA3sV1MkIr9uGk&usqp=CAU';
  final picker = ImagePicker();
  getUserDetails() async {
    final usersRef = await FirebaseFirestore.instance
        .collection('users')
        .where("uId", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (usersRef.docs.isNotEmpty) {
      setState(() {
        user_Id = usersRef.docs[0].id;
        firstname.text = usersRef.docs[0]['first-name'];
        lastname.text = usersRef.docs[0]['last-name'];
        email.text = usersRef.docs[0]['email'];
        phone.text = usersRef.docs[0]['phone'];
        referralcode.text = usersRef.docs[0]['referral_code'];
        base64Image = usersRef.docs[0]['profile_pic'];
      });
    } else {
      setState(() {
        isLoadingMode = false;
      });
    }
  }

  Future<void> updateData() async {
    final usersRef = FirebaseFirestore.instance.collection('users');
    final userDoc = await usersRef.doc(user_Id).get();
    if (base64Image != null) {
      try {
        await userDoc.reference.update({
          'uId': FirebaseAuth.instance.currentUser!.uid,
          'first-name': firstname.text,
          'last-name': lastname.text,
          'email': email.text,
          'phone': phone.text,
          'referral_code': referralcode.text,
          'profile_pic': base64Image,
        });
        ToastMessages.successMessage(context, 'Profile successfully updated.');
        setState(() {
          isLoadingMode = false;
        });
      } catch (e) {
        ToastMessages.errorMessage(context, e.toString());
        setState(() {
          isLoadingMode = false;
        });
      }
    } else {
      ToastMessages.warnigMessage(context, 'Please select profile picture.');
      setState(() {
        isLoadingMode = false;
      });
    }
  }

  getImage(var imageSource) async {
    final XFile? image =
        await picker.pickImage(source: imageSource, imageQuality: 5,);
    if (image != null) {
        File imageFile = File(image.path);
        int fileSizeInBytes = imageFile.lengthSync();
        double fileSizeInMB = fileSizeInBytes / (1024 * 1024);
      if(fileSizeInMB < 1){
      _cropImage(image);
      }else{
        ToastMessages.errorMessage(context, "Selected image size exceeds 1 MB.");
      }
      
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    }
  }

  Future<void> _cropImage(XFile imageFile) async {
    CroppedFile? croppedFile = await ImageCropper.platform.cropImage(
        sourcePath: imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: ColorsClass.themeColor,
              toolbarWidgetColor: ColorsClass.fillColor,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          )
        ]
        // uiSettings: IOSUiSettings(
        //   title: 'Cropper',
        // )
        );
    if (croppedFile != null) {
      // imageFile = croppedFile as XFile;
        var tempPath = File(croppedFile.path);
        final bytes = File(croppedFile.path).readAsBytesSync();
        String img64 = base64Encode(bytes);

        setState(() {
          base64Image = img64;
          imagepath = tempPath;
        });
    }
  }

  @override
  void initState() {
    getUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorsClass.themeColor),
        title: Text(
          'Account',
          style: TextStyle(color: ColorsClass.themeColor),
        ),
        actions: [
          !isEditingMode
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isEditingMode = true;
                        });
                      },
                      icon: const Icon(Icons.edit_outlined)),
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isEditingMode = false;
                        });
                      },
                      icon: const Icon(Icons.close)),
                )
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  height: 125,
                  width: 125,
                  child: Stack(
                    fit: StackFit.expand,
                    clipBehavior: Clip.none,
                    children: [
                      base64Image == null
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(profile_pic),
                            )
                          : CircleAvatar(
                              backgroundImage: MemoryImage(
                                  const Base64Decoder().convert(base64Image)),
                            ),
                      isEditingMode
                          ? Positioned(
                              right: -16,
                              bottom: 0,
                              child: SizedBox(
                                height: 46,
                                width: 46,
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side:
                                          const BorderSide(color: Colors.white),
                                    ),
                                    // ignore: deprecated_member_use
                                    primary: Colors.white,
                                    backgroundColor: const Color(0xFFF5F6F9),
                                  ),
                                  onPressed: () {
                                    showModalBottomSheet(
                                        context: context,
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                            // <-- SEE HERE
                                            topLeft: Radius.circular(25.0),
                                            topRight: Radius.circular(25.0),
                                          ),
                                        ),
                                        builder: (context) {
                                          return SizedBox(
                                            height: 120,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                Wrap(children: [
                                                  ListTile(
                                                    leading: const Icon(
                                                        Icons.photo_camera),
                                                    title: const Text(
                                                        'Take Photo'),
                                                    onTap: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                      getImage(
                                                          ImageSource.camera);
                                                    },
                                                  ),
                                                  ListTile(
                                                    leading: const Icon(
                                                        Icons.folder_open),
                                                    title: const Text(
                                                        'Select Photo'),
                                                    onTap: () {
                                                      Navigator.of(context,
                                                              rootNavigator:
                                                                  true)
                                                          .pop();
                                                      getImage(
                                                          ImageSource.gallery);
                                                    },
                                                  ),
                                                ])
                                              ],
                                            ),
                                          );
                                        });
                                  },
                                  child: const Icon(Icons.camera_alt_outlined,
                                      color: Colors.black),

                                  ///child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
                                ),
                              ),
                            )
                          : const Center()
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 70,
                width: 320,
                child: TextFeildWidget(firstname, Icons.person_2_outlined,
                    "First Name", !isEditingMode,TextInputType.text),
              ),
              SizedBox(
                height: 70,
                width: 320,
                child: TextFeildWidget(lastname, Icons.person_2_outlined,
                    "Last Name", !isEditingMode,TextInputType.text),
              ),
              SizedBox(
                height: 80,
                width: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFeildWidget(email, Icons.email_outlined, "Email", true,TextInputType.emailAddress),
                    isEditingMode
                        ? const Padding(
                            padding: EdgeInsets.only(left: 2),
                            child: Text(
                              'You don\'t currently have permission to edit this field.',
                              style: TextStyle(fontSize: 10),
                            ),
                          )
                        : const Center()
                  ],
                ),
              ),
              SizedBox(
                height: 70,
                width: 320,
                child: TextFeildWidget(
                    phone, Icons.phone_outlined, "Phone", !isEditingMode,TextInputType.phone),
              ),
             
              SizedBox(
                height: 80,
                width: 320,
                child: Column(
                  children: [
                    TextFeildWidget(
                        referralcode, Icons.group, "Referral Code", true,TextInputType.text),
                    isEditingMode
                        ? const Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: EdgeInsets.only(left: 2),
                              child: Text(
                                'You don\'t currently have permission to edit this field.',
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          )
                        : const Center()
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              isEditingMode
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Center(
                        child: !isLoadingMode
                            ? Container(
                                decoration: BoxDecoration(
                                    color: ColorsClass.themeColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: ColorsClass.themeColor,
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    FocusScope.of(context).unfocus();
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isEditingMode = false;
                                        isLoadingMode = true;
                                      });
                                      updateData();
                                    }
                                  },
                                  child: const Text("Update Profile",
                                      style: TextStyle(color: Colors.white)),
                                ))
                            : const CircularProgressIndicator(),
                      ),
                    )
                  : const Center(),
              isLoadingMode ? const CircularProgressIndicator() : const Center()
            ],
          ),
        ),
      ),
    );
  }
}
