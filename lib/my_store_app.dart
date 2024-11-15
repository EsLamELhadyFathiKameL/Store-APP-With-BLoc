import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store_app/Cubits/My_Add_New_Product_Cubit/my_add_new_product_cubit.dart';
import 'package:my_store_app/Cubits/My_Get_ALL_Categories_Cubit/my_get_all_categories_cubit.dart';
import 'package:my_store_app/Cubits/My_Get_ALL_Products_Cubit/my_get_all_products_cubit.dart';
import 'package:my_store_app/Cubits/My_Get_Category_Cubit/my_get_category_cubit.dart';
import 'package:my_store_app/Cubits/My_Update_Product_Cubit/my_update_product_cubit.dart';
import 'package:my_store_app/Screens/my_add_new_product_page.dart';
import 'package:my_store_app/Screens/my_all_categories_page.dart';
import 'package:my_store_app/Screens/my_category_you_choose_page.dart';
import 'package:my_store_app/Screens/my_products_page.dart';
import 'package:my_store_app/Screens/my_update_product_page.dart';

void main() {
  runApp(const MyStoreAPP());
}

class MyStoreAPP extends StatelessWidget {
  const MyStoreAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MyGetALLProductsCubit(),
        ),
        BlocProvider(
          create: (context) => MyGetALLCategoriesCubit(),
        ),
        BlocProvider(
          create: (context) => MyGetCategoryCubit(),
        ),
        BlocProvider(
          create: (context) => MyUpdateProductCubit(),
        ),
        BlocProvider(
          create: (context) => MyAddNewProductCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          MyProductsPage.id: (context) => const MyProductsPage(),
          MyALLCategoriesPage.id: (context) => const MyALLCategoriesPage(),
          MyCategoryYouChoosePage.id: (context) =>
              const MyCategoryYouChoosePage(),
          MyUpdateProductPage.id: (context) => const MyUpdateProductPage(),
          MyAddNewProductPage.id: (context) => const MyAddNewProductPage(),
        },
        initialRoute: MyProductsPage.id,
      ),
    );
  }
}
