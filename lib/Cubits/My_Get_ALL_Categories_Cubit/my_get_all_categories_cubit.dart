import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_store_app/Services/My_Get_Request/my_get_all_categories_service.dart';

part 'my_get_all_categories_states.dart';

class MyGetALLCategoriesCubit extends Cubit<MyGetALLCategoriesStates> {
  MyGetALLCategoriesCubit() : super(MyGetALLCategoriesInitiaLState());
  Future<List<dynamic>> myGetALLCategoriesMethod() async {
    emit(MyGetALLCategoriesLoadingState());
    try {
      List<dynamic> myCategoriesList =
          await MyGetALLCategoriesService().myGetALLCategoriesService();
      emit(MyGetALLCategoriesSuccessState());
      return myCategoriesList;
    } catch (e) {
      emit(
        MyGetALLCategoriesFaiLureState(
          errorMessage: e.toString(),
        ),
      );
      throw Exception(
        e.toString(),
      );
    }
  }
}
