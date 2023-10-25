import 'package:flutter/widgets.dart';

class SizeConfig {
  static double height(context,double heightRatio){
    double height = MediaQuery.of(context).size.height * heightRatio ;
    return height;
  }
  static double width(context,double widthRatio){
    double width = MediaQuery.of(context).size.width  * widthRatio ;
    return width;
  }
}