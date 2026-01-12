// lib/main.dart

// import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:unasked/assets/theme/app_defaut_theme.dart';
import 'package:unasked/controller/theme_controller.dart';
import 'package:unasked/generated/l10n.dart';
import 'package:unasked/routes/main_routes.dart';

void main()  {
  WidgetsFlutterBinding.ensureInitialized();
  // await Alarm.init();
  runApp(const UnaskedApp());
}

class UnaskedApp extends StatelessWidget {
  const UnaskedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unasked',
       // 这里配置多语言、主题等全局配置
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,//自动获取所有支持的语言内容
      // 路由配置
      initialRoute: "/",
      routes: getRoutes(),
      theme: AppDefaultTheme.getTheme(ThemeController().seedColor.value,Brightness.light),
      darkTheme: AppDefaultTheme.getTheme(ThemeController().seedColor.value,Brightness.dark),
      themeMode: ThemeMode.system,
    );
  }
}
