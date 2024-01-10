part of 'custom_items_bloc.dart';

sealed class CustomItemsState extends Equatable {
  const CustomItemsState();

  @override
  List<Object> get props => [];
}

// final class CustomItemsInitial extends CustomItemsState {}
class LoadingState extends CustomItemsState {}

class LoadedState extends CustomItemsState {
  final List<Emeritem> emeritem;
  const LoadedState({required this.emeritem});
  @override
  List<Object> get props => [emeritem];
}

class ErrorState extends CustomItemsState {
  final String errorMassage;
  const ErrorState({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
