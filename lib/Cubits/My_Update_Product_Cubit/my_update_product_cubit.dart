import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Services/My_Put_Request/my_update_product_service.dart';

part 'my_update_product_states.dart';

class MyUpdateProductCubit extends Cubit<MyUpdateProductStates> {
  MyUpdateProductCubit() : super(MyUpdateProductInitiaLState());
  Future<MyProductModeL> myUpdateProductMethod({
    required int productID,
    required String newProductTitLe,
    required String newProductPrice,
    required String newProductDescription,
    required String newProductImage,
    required String newProductCategory,
  }) async {
    emit(MyUpdateProductLoadingState());
    try {
      MyProductModeL myProduct = await MyUpdateProductService()
          .myUpdateProductService(
              productID: productID,
              newProductTitLe: newProductTitLe,
              newProductPrice: newProductPrice,
              newProductDescription: newProductDescription,
              newProductImage: newProductImage,
              newProductCategory: newProductCategory);
      emit(MyUpdateProductSuccessState());
      return myProduct;
    } catch (e) {
      emit(
        MyUpdateProductFaiLureState(
          errorMessage: e.toString(),
        ),
      );
      throw Exception(
        e.toString(),
      );
    }
  }
}
