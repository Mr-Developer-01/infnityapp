// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';

class TextFeildWidget extends StatelessWidget {
  TextEditingController contrNAme;
  String labelName;
  IconData iconName;
  bool readOnly;
  var keyboardType;
  TextFeildWidget(this.contrNAme, this.iconName, this.labelName, this.readOnly,this.keyboardType,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
       readOnly: readOnly,
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      controller: contrNAme,
      decoration: InputDecoration(
        // prefixIcon: Icon(iconName,size: 0,),
        filled: true,
        fillColor: ColorsClass.fillColor,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors
                  .transparent), // Optional: You can set the borderSide color to transparent if you don't want an outline when not focused.
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        hintText: labelName,
        // hintTextDirection:,
        // contentPadding:EdgeInsets.only(),
        //labelText: 'Subject',
        //isDense: true,
        hintStyle: TextStyle(
          color: ColorsClass.themeColor,
          fontSize: 14,
        ),
        contentPadding: const EdgeInsets.only(left: 20, right: 15),
      ),
      // onChanged: (value) {
      //   setState(() {
      //     subject.text = value;
      //   });
      // },
    );

    // return TextFormField(
    //   readOnly: readOnly,
    //   controller: contrNAme,
    //   style: TextStyle(fontSize: 15),
    //   decoration: InputDecoration(
    //     labelText: labelName,
    //     prefixIcon: Icon(iconName),
    //     border: myinputborder(),
    //     enabledBorder: myinputborder(),
    //     focusedBorder: myfocusborder(),
    //   ),
    //   validator: (value) {
    //     if (value == null || value == '') {
    //       return 'This field is required';
    //     }
    //     return null;
    //   },
    // );
  }

  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: ColorsClass.fillColor,
          width: 3,
        ));
  }

  OutlineInputBorder myfocusborder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color: ColorsClass.themeColor,
          width: 3,
        ));
  }
}
