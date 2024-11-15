import 'package:flutter/material.dart';
import 'package:my_store_app/Widgets/my_show_modal_bottom_sheet.dart';

void myShowModaLBottomSheetMethod(BuildContext context) {
  showModalBottomSheet(
    backgroundColor: Colors.black,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        16,
      ),
    ),
    context: context,
    builder: (context) {
      return const MyShowModaLBottomSheet();
    },
  );
}
