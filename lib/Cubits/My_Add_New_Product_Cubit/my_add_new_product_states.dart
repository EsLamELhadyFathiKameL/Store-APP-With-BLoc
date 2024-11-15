part of 'my_add_new_product_cubit.dart';

@immutable
sealed class MyAddNewProductStates {}

final class MyAddNewProductInitiaLState extends MyAddNewProductStates {}

final class MyAddNewProductLoadingState extends MyAddNewProductStates {}

final class MyAddNewProductSuccessState extends MyAddNewProductStates {}

final class MyAddNewProductFaiLureState extends MyAddNewProductStates {
  final String errorMessage;

  MyAddNewProductFaiLureState({
    required this.errorMessage,
  });
}
