import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController{
  var seedColor = const Color(0xFFFD90ED).obs;

  //更新颜色
  void updateSeedColor(Color newColor){
    seedColor.value = newColor;
  }

  init() {}
}