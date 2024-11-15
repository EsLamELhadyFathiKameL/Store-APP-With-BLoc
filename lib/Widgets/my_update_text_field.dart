import 'package:flutter/material.dart';

class MyUpdateTextFieLd extends StatelessWidget {
  const MyUpdateTextFieLd({
    super.key,
    required this.hintText,
    this.onChanged,
    this.labelText,
    this.keyboardType,
  });
  final String hintText;
  final void Function(String)? onChanged;
  final String? labelText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          overflow: TextOverflow.ellipsis,
          fontSize: 12,
          color: Colors.black,
        ),
        labelText: labelText,
        labelStyle: const TextStyle(
          fontSize: 15,
          color: Colors.black,
          fontFamily: "Pacifico",
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
