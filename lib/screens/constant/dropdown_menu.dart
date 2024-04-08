// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tribb/screens/constant/colors.dart';

class DropDownMenu extends StatelessWidget {
  var menulist = [];
  var labelName;
  var iconName;
  var onSelect;
  DropDownMenu(this.iconName, this.labelName, this.menulist, this.onSelect,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      // alignment :Alignment.bottomRight,
      validator: (value) {
        if (value == null || value == '-- None --') {
          return '      This field is required';
        }
        return null;
      },
      items: menulist
          .map((item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ))
          .toList(),
      onChanged: onSelect,
      decoration: InputDecoration(
        // error: Padding(
        //   padding: const EdgeInsets.only(left: 20),
        //   child: Text('Test'),
        // ),
        // errorText: '    text',
        // prefixIcon: Icon(iconName),
        // alignLabelWithHint: true,
        filled: true,
        fillColor: ColorsClass.fillColor,
        hintText: '     $labelName',
        contentPadding: const EdgeInsets.only(
          // left: 20,
          right: 15,
        ),
        hintStyle: TextStyle(
          color: ColorsClass.themeColor,
          fontSize: 14,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
      isExpanded: true,
      iconStyleData: IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: ColorsClass.themeColor,
        ),
        iconSize: 20,
      ),
      buttonStyleData: const ButtonStyleData(
        height: 45,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
