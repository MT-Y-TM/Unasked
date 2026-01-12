import 'package:flutter/material.dart';

class AppDefaultTheme {
  // 默认种子颜色
  static const Color defaultSeedColor = Color(0xFFFD90ED);

  // 统一为一个工厂方法
  static ThemeData getTheme(
    Color value,
    Brightness light, {
    Color seedColor = defaultSeedColor, 
    Brightness brightness = Brightness.light, 
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: brightness,
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(0xFFFD90ED), 
      ),
      // 可以在这里继续统一加圆角、字体等
    );
  }
}
