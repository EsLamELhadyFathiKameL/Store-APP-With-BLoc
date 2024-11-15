import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:my_store_app/Cubits/My_Update_Product_Cubit/my_update_product_cubit.dart';
import 'package:my_store_app/Methods/my_show_snack_bar_method.dart';
import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Widgets/my_custom_appbar.dart';
import 'package:my_store_app/Widgets/my_custom_button.dart';
import 'package:my_store_app/Widgets/my_update_text_field.dart';

class MyUpdateProductPage extends StatefulWidget {
  const MyUpdateProductPage({super.key});
  static String id = "MyUpdateProductPage";

  @override
  State<MyUpdateProductPage> createState() => _MyUpdateProductPageState();
}

class _MyUpdateProductPageState extends State<MyUpdateProductPage> {
  String? productTitLe, productPrice, productDescription, productImage;
  @override
  Widget build(BuildContext context) {
    MyProductModeL myProduct =
        ModalRoute.of(context)!.settings.arguments as MyProductModeL;
    return BlocConsumer<MyUpdateProductCubit, MyUpdateProductStates>(
      listener: (context, state) {
        if (state is MyUpdateProductFaiLureState) {
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
          inAsyncCall: state is MyUpdateProductLoadingState,
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
                appBarTitLe: "Update Product",
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
                    MyUpdateTextFieLd(
                      hintText: myProduct.productTitLe,
                      labelText: "Update Product TitLe",
                      onChanged: (value) {
                        productTitLe = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MyUpdateTextFieLd(
                      hintText: myProduct.productPrice.toString(),
                      labelText: "Update Product Price",
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        productPrice = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MyUpdateTextFieLd(
                      hintText: myProduct.productDescription,
                      labelText: "Update Product Description",
                      onChanged: (value) {
                        productDescription = value;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MyUpdateTextFieLd(
                      hintText: myProduct.productImage,
                      labelText: "Update Product Image",
                      onChanged: (value) {
                        productImage = value;
                      },
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    MyCustomButton(
                      buttonName: "Update",
                      onTap: () async {
                        await myUpdateProductMethod(context, myProduct);
                        if (!context.mounted) return;
                        myShowSnackBarMethod(
                          context,
                          "Product ${myProduct.productID} Has Been Updated SuccessfuLLy.",
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

  Future<void> myUpdateProductMethod(
      BuildContext context, MyProductModeL myProduct) async {
    await BlocProvider.of<MyUpdateProductCubit>(context).myUpdateProductMethod(
      productID: myProduct.productID,
      newProductTitLe:
          productTitLe == null ? myProduct.productTitLe : productTitLe!,
      newProductPrice:
          productPrice == null ? myProduct.productPrice : productPrice!,
      newProductDescription: productDescription == null
          ? myProduct.productDescription
          : productDescription!,
      newProductImage:
          productImage == null ? myProduct.productImage : productImage!,
      newProductCategory: myProduct.productCategory,
    );
  }
}
