part of 'my_get_category_cubit.dart';

@immutable
sealed class MyGetCategoryStates {}

final class MyGetCategoryInitiaLState extends MyGetCategoryStates {}

final class MyGetCategoryLoadingState extends MyGetCategoryStates {}

final class MyGetCategorySuccessState extends MyGetCategoryStates {}

final class MyGetCategoryFaiLureState extends MyGetCategoryStates {
  final String errorMessage;

  MyGetCategoryFaiLureState({
    required this.errorMessage,
  });
}
