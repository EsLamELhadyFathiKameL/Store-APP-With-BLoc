import 'package:flutter/material.dart';
import 'package:my_store_app/Widgets/my_bottom_appbar.dart';
import 'package:my_store_app/Widgets/my_custom_appbar.dart';
import 'package:my_store_app/Widgets/my_products_view.dart';

class MyProductsPage extends StatelessWidget {
  const MyProductsPage({super.key});
  static String id = "MyProductsPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const MyCustomAppbar(
          appBarTitLe: "New Trend",
        ),
      ),
      bottomNavigationBar: const MyBottomAppbar(),
      body: const MyProductsView(),
    );
  }
}
