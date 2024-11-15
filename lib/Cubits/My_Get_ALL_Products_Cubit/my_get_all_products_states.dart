part of 'my_get_all_products_cubit.dart';

@immutable
sealed class MyGetALLProductsStates {}

final class MyGetALLProductsInitiaLState extends MyGetALLProductsStates {}

final class MyGetALLProductsLoadingState extends MyGetALLProductsStates {}

final class MyGetALLProductsSuccessState extends MyGetALLProductsStates {}

final class MyGetALLProductsFaiLureState extends MyGetALLProductsStates {
  final String errorMessage;

  MyGetALLProductsFaiLureState({
    required this.errorMessage,
  });
}
