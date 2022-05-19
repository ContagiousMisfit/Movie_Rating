import 'package:flutter/material.dart';
import 'package:isabela_3sit/pages/list_page.dart';
import 'package:isabela_3sit/provider/theme_provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyThemes.darkTheme,
      home: ListPage(),
    );
  }
}
