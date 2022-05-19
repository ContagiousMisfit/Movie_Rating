import 'package:flutter/material.dart';
import 'package:isabela_3sit/components/isabela_button.dart';
import 'package:isabela_3sit/utils/export.dart';

class IsabelaPage extends StatelessWidget {
  final Widget body;
  final String pageTile;

  IsabelaPage({required this.body, required this.pageTile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTile),
      ),
      body: Padding(
          padding: EdgeInsets.only(
            left: PaddingSizes.introPageBorder,
            right: PaddingSizes.introPageBorder,
            top: PaddingSizes.introPageTop,
          ),
          child: SingleChildScrollView(
            child: body,
          )),
    );
  }
}
