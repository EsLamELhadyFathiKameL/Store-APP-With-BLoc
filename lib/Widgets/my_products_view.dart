// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store_app/Cubits/My_Get_ALL_Products_Cubit/my_get_all_products_cubit.dart';
import 'package:my_store_app/Methods/my_show_snack_bar_method.dart';
import 'package:my_store_app/Widgets/my_product_card.dart';

class MyProductsView extends StatefulWidget {
  const MyProductsView({super.key});

  @override
  State<MyProductsView> createState() => _MyProductsViewState();
}

class _MyProductsViewState extends State<MyProductsView> {
  var myProductsList;
  @override
  void initState() {
    getProductsListMethod();
    super.initState();
  }

  void getProductsListMethod() async {
    myProductsList = await BlocProvider.of<MyGetALLProductsCubit>(context)
        .myGetALLProductsMethod();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyGetALLProductsCubit, MyGetALLProductsStates>(
      builder: (context, state) {
        if (state is MyGetALLProductsSuccessState) {
          return GridView.builder(
            padding: const EdgeInsets.only(
              left: 8,
              right: 8,
              top: 65,
            ),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 65,
              crossAxisSpacing: 5,
              childAspectRatio: 1,
            ),
            itemCount: myProductsList.length,
            itemBuilder: (context, index) {
              return MyProductCard(
                myProduct: myProductsList[index],
              );
            },
          );
        } else if (state is MyGetALLProductsFaiLureState) {
          myShowSnackBarMethod(context, state.errorMessage);
          return const Center(
            child: Text(
              "SomeThing Went Wrong",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "Pacifico",
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
