// 管理路由
// lib/routes/main_routes.dart
import 'package:flutter/material.dart';
import 'package:unasked/pages/main/main_page.dart';


// 返回App的路由配置
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    "/": (context) => MainPage(), 
    // "/login": (context) => LoginPage()
    };
}
