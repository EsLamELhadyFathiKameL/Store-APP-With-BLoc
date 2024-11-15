import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_store_app/Cubits/My_Add_New_Product_Cubit/my_add_new_product_cubit.dart';
import 'package:my_store_app/Methods/my_show_snack_bar_method.dart';
import 'package:my_store_app/Widgets/my_add_text_field.dart';
import 'package:my_store_app/Widgets/my_custom_appbar.dart';
import 'package:my_store_app/Widgets/my_custom_button.dart';

class MyAddNewProductPage extends StatefulWidget {
  const MyAddNewProductPage({super.key});
  static String id = "MyAddNewProductPage";

  @override
  State<MyAddNewProductPage> createState() => _MyAddNewProductPageState();
}

class _MyAddNewProductPageState extends State<MyAddNewProductPage> {
  String? newProductTitLe,
      newProductPrice,
      newProductDescription,
      newProductImage,
      newProductCategory;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyAddNewProductCubit, MyAddNewProductStates>(
      listener: (context, state) {
        if (state is MyAddNewProductFaiLureState) {
          myShowSnackBarMethod(context, state.errorMessage);
          const Center(
            child: Text(
              "SomeThing Went Wrong",
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontFamily: "Pacifico",
              ),
            ),
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is MyAddNewProductLoadingState,
          child: Scaffold(
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
                appBarTitLe: "Add New Product",
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyAddTextFieLd(
                      hintText: "Add Your New Product TitLe",
                      labelText: "New Product TitLe",
                      onChanged: (value) {
                        newProductTitLe = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MyAddTextFieLd(
                      hintText: "Add Your New Product Price",
                      labelText: "New Product Price",
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        newProductPrice = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MyAddTextFieLd(
                      hintText: "Add Your New Product Description",
                      labelText: "New Product Description",
                      onChanged: (value) {
                        newProductDescription = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MyAddTextFieLd(
                      hintText: "Add Your New Product Image",
                      labelText: "New Product Image",
                      onChanged: (value) {
                        newProductImage = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MyAddTextFieLd(
                      hintText: "Add Your New Product Category",
                      labelText: "New Product Category",
                      onChanged: (value) {
                        newProductCategory = value;
                      },
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    MyCustomButton(
                      buttonName: "Add",
                      onTap: () async {
                        await myAddNewProductMethod(context);
                        if (!context.mounted) return;
                        myShowSnackBarMethod(
                          context,
                          "New Product Has Been Added SuccessfuLLy.",
                        );
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> myAddNewProductMethod(BuildContext context) async {
    await BlocProvider.of<MyAddNewProductCubit>(context).myAddNewProductMethod(
      newProductTitLe: newProductTitLe!,
      newProductPrice: newProductPrice!,
      newProductDescription: newProductDescription!,
      newProductImage: newProductImage!,
      newProductCategory: newProductCategory!,
    );
  }
}
