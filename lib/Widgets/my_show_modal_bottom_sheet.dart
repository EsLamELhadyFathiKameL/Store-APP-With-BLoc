import 'package:flutter/material.dart';
import 'package:my_store_app/Widgets/my_search_text_field.dart';

class MyShowModaLBottomSheet extends StatelessWidget {
  const MyShowModaLBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        bottom: 8,
      ),
      child: const Center(
        child: MySearchTextFieLd(),
      ),
    );
  }
}
