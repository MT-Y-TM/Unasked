// lib/pages/main/main_page.dart
import 'package:flutter/material.dart';
import 'package:unasked/generated/l10n.dart';
import 'package:unasked/pages/clock/clock.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).title),
        centerTitle: true,
      ),
      body: ClockPage(),
      );
  }
}
