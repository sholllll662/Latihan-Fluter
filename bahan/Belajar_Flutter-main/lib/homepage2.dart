import 'package:flutter/material.dart';
import 'package:flutter_application_1/responsive_hal2/mobile_body.dart';
import 'package:flutter_application_1/responsive_hal2/responsive_layout.dart';
import 'package:flutter_application_1/responsive_hal2/tab_body.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  _HomePageState2 createState() => _HomePageState2();
}

class _HomePageState2 extends State<HomePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout2(
        mobileBody: MyMobileBody2(),
        desktopBody: MyTabBody2(),
      ),
    );
  }
}
