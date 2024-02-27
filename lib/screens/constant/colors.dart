import 'package:flutter/material.dart';

class ColorsClass {
  static Color themeColor = const Color(0xFFFC9F09);
  static Color fillColor = const Color(0xFFEDF5FF);
  static setColor(numb){
    if(numb == 0){
      themeColor =  const Color(0xFFFC9F09);
    }
    else if(numb == 1){
      themeColor =  const Color(0xFF081F95);
    }
    else if(numb == 2){
      themeColor =  const Color(0xFFF64004);
    }
    
  }
}
