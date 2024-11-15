import 'package:flutter/material.dart';

class MyCustomAppbar extends StatelessWidget {
  const MyCustomAppbar({
    super.key,
    required this.appBarTitLe,
  });
  final String appBarTitLe;

  @override
  Widget build(BuildContext context) {
    return Text(
      appBarTitLe,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
        fontFamily: "Pacifico",
      ),
    );
  }
}
