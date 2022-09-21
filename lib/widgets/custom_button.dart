import 'package:flutter/material.dart';

import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.text, this.onPressedFn);

  final String text;
  final void Function()? onPressedFn;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        elevation: 0,
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: onPressedFn,
      child: CustomText(
        text: text,
        fontSize: 14,
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
