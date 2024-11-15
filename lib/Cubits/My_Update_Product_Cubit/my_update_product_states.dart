part of 'my_update_product_cubit.dart';

@immutable
sealed class MyUpdateProductStates {}

final class MyUpdateProductInitiaLState extends MyUpdateProductStates {}

final class MyUpdateProductLoadingState extends MyUpdateProductStates {}

final class MyUpdateProductSuccessState extends MyUpdateProductStates {}

final class MyUpdateProductFaiLureState extends MyUpdateProductStates {
  final String errorMessage;

  MyUpdateProductFaiLureState({
    required this.errorMessage,
  });
}
