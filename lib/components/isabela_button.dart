import 'package:flutter/material.dart';

class IsabelaButton extends StatelessWidget {
  final Function()? onPressed;

  IsabelaButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.purple,
      child: const Icon(Icons.navigation),
    );
  }
}
