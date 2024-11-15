import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Services/My_Get_Request/my_get_all_products_service.dart';

part 'my_get_all_products_states.dart';

class MyGetALLProductsCubit extends Cubit<MyGetALLProductsStates> {
  MyGetALLProductsCubit() : super(MyGetALLProductsInitiaLState());

  Future<List<MyProductModeL>> myGetALLProductsMethod() async {
    emit(MyGetALLProductsLoadingState());
    try {
      List<MyProductModeL> myProductsList =
          await MyGetALLProductsService().myGetALLProductsService();

      emit(MyGetALLProductsSuccessState());
      return myProductsList;
    } catch (e) {
      emit(
        MyGetALLProductsFaiLureState(
          errorMessage: e.toString(),
        ),
      );

      throw Exception(
        e.toString(),
      );
    }
  }
}
