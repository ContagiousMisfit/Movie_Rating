import 'package:flutter/material.dart';

class IsabelaButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;

  IsabelaButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(buttonText),
        ),
      ),
    );
  }
}
