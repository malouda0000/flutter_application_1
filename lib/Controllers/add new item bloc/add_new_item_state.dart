part of 'add_new_item_bloc.dart';

sealed class AddNewItemState extends Equatable {
  const AddNewItemState();

  @override
  List<Object> get props => [];
}

final class AddNewItemInitial extends AddNewItemState {}

// final class CustomItemsInitial extends CustomItemsState {}
class LoadingNewItemState extends AddNewItemState {}

class LoadedNewItemState extends AddNewItemState {
  // final List<Emeritem> emeritem;
  // const LoadedState({required this.emeritem});
  @override
  List<Object> get props => [];
}

class AddNewItemErrorState extends AddNewItemState {
  final String errorMassage;
  const AddNewItemErrorState({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
