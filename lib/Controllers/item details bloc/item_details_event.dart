part of 'item_details_bloc.dart';

// final DeletItemRepository deletItemRepository = DeletItemRepository();

sealed class ItemDetailsEvent extends Equatable {
  // const ItemDetailsEvent();

  @override
  List<Object> get props => [];
}

class ItemDetailsRsetEvent extends ItemDetailsEvent {}

class ItemEditeEvent extends ItemDetailsEvent {
  final String userEmail;
  final String itemId;
  final String itemTitle;
  final String itemDescription;
  final String itemImgUrl;
  ItemEditeEvent({
    required this.userEmail,
    required this.itemId,
    required this.itemTitle,
    required this.itemDescription,
    required this.itemImgUrl,
  });
  // List<Object> get props => [];
}

class ItemRemoveEvent extends ItemDetailsEvent {
  final String userEmail;
  final String itemId;

  ItemRemoveEvent({
    required this.userEmail,
    required this.itemId,
  });

  List<Object> get props => [
        // userEmail,
        // itemId,
      ];
}
