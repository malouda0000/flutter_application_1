part of 'item_details_bloc.dart';

sealed class ItemDetailsState extends Equatable {
  const ItemDetailsState();

  @override
  List<Object> get props => [];
}

final class ItemDetailsInitialState extends ItemDetailsState {}

final class ItemDetailsLoadingState extends ItemDetailsState {}

final class ItemDetailsLoadedState extends ItemDetailsState {
  // final Emeritem emeritem;
  // const LoadedState({required this.emeritem});
  // @override
  // List<Object> get props => [emeritem];
}

final class ItemDetailsRemovdedState extends ItemDetailsState {}

final class ItemEditedSuccsfluyState extends ItemDetailsState {}

final class ItemDetailsErrorState extends ItemDetailsState {
  final String errorMassage;
  const ItemDetailsErrorState({required this.errorMassage});
  @override
  List<Object> get props => [errorMassage];
}
