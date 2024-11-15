part of 'my_get_all_categories_cubit.dart';

@immutable
sealed class MyGetALLCategoriesStates {}

final class MyGetALLCategoriesInitiaLState extends MyGetALLCategoriesStates {}

final class MyGetALLCategoriesLoadingState extends MyGetALLCategoriesStates {}

final class MyGetALLCategoriesSuccessState extends MyGetALLCategoriesStates {}

final class MyGetALLCategoriesFaiLureState extends MyGetALLCategoriesStates {
  final String errorMessage;

  MyGetALLCategoriesFaiLureState({
    required this.errorMessage,
  });
}
