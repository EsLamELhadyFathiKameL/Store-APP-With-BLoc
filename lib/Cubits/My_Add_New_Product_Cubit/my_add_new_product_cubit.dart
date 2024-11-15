import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Services/My_Post_Request/my_add_new_product_service.dart';

part 'my_add_new_product_states.dart';

class MyAddNewProductCubit extends Cubit<MyAddNewProductStates> {
  MyAddNewProductCubit() : super(MyAddNewProductInitiaLState());
  Future<MyProductModeL> myAddNewProductMethod({
    required String newProductTitLe,
    required String newProductPrice,
    required String newProductDescription,
    required String newProductImage,
    required String newProductCategory,
  }) async {
    emit(MyAddNewProductLoadingState());
    try {
      MyProductModeL myNewProduct = await MyAddNewProductService()
          .myAddNewProductService(
              newProductTitLe: newProductTitLe,
              newProductPrice: newProductPrice,
              newProductDescription: newProductDescription,
              newProductImage: newProductImage,
              newProductCategory: newProductCategory);
      emit(MyAddNewProductSuccessState());
      return myNewProduct;
    } catch (e) {
      emit(
        MyAddNewProductFaiLureState(
          errorMessage: e.toString(),
        ),
      );
      throw Exception(
        e.toString(),
      );
    }
  }
}
