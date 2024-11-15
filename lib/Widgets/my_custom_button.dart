import 'package:flutter/material.dart';

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({
    super.key,
    this.onTap,
    required this.buttonName,
  });
  final void Function()? onTap;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(8),
        ),
        alignment: Alignment.center,
        child: Text(
          buttonName,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontFamily: "Pacifico",
          ),
        ),
      ),
    );
  }
}
