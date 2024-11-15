import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_store_app/ModeLs/my_product_model.dart';
import 'package:my_store_app/Services/My_Get_Request/my_get_category_service.dart';

part 'my_get_category_states.dart';

class MyGetCategoryCubit extends Cubit<MyGetCategoryStates> {
  MyGetCategoryCubit() : super(MyGetCategoryInitiaLState());
  Future<List<MyProductModeL>> myGetCategoryMethod(
      {required String categoryName}) async {
    emit(MyGetCategoryLoadingState());
    try {
      List<MyProductModeL> myProductsList = await MyGetCategoryService()
          .myGetCategoryService(categoryName: categoryName);

      emit(MyGetCategorySuccessState());
      return myProductsList;
    } catch (e) {
      emit(
        MyGetCategoryFaiLureState(
          errorMessage: e.toString(),
        ),
      );

      throw Exception(
        e.toString(),
      );
    }
  }
}
