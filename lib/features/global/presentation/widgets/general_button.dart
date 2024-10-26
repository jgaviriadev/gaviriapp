
import 'package:flutter/material.dart';
import 'package:jgaviriadev_app/core/utils/utils.dart';

class GeneralButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const GeneralButton({
    super.key, 
    required this.text, 
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFF0095B4)),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textStyle: WidgetStatePropertyAll(
            CustomText.textWhiteBold10
          )
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}