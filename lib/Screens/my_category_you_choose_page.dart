import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:my_store_app/Cubits/My_Get_Category_Cubit/my_get_category_cubit.dart';
import 'package:my_store_app/Methods/my_show_snack_bar_method.dart';
import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Widgets/my_custom_appbar.dart';
import 'package:my_store_app/Widgets/my_product_card.dart';

class MyCategoryYouChoosePage extends StatelessWidget {
  const MyCategoryYouChoosePage({super.key});
  static String id = "MyCategoryYouChoosePage";

  @override
  Widget build(BuildContext context) {
    List<MyProductModeL> myProductsList =
        ModalRoute.of(context)!.settings.arguments as List<MyProductModeL>;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            MdiIcons.arrowLeft,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const MyCustomAppbar(
          appBarTitLe: "The Category You Choose",
        ),
      ),
      body: BlocBuilder<MyGetCategoryCubit, MyGetCategoryStates>(
        builder: (context, state) {
          if (state is MyGetCategorySuccessState) {
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
          } else if (state is MyGetCategoryFaiLureState) {
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
      ),
    );
  }
}
