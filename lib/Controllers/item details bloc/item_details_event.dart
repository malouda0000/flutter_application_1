part of 'item_details_bloc.dart';

final DeletItemRepository deletItemRepository = DeletItemRepository();

sealed class ItemDetailsEvent extends Equatable {
  // const ItemDetailsEvent();

  @override
  List<Object> get props => [];
}

class ItemEditedEvent extends ItemDetailsEvent {
  ItemEditedEvent(
      // {required super.deletItemRepository}
      );
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
