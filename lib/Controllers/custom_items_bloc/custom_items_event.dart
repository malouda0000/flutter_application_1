part of 'custom_items_bloc.dart';

sealed class CustomItemsEvent extends Equatable {
  const CustomItemsEvent();

  @override
  List<Object> get props => [];
}

class GetAllItemsEvent extends CustomItemsEvent {}

// class AddNewItemEvent extends CustomItemsEvent {}
