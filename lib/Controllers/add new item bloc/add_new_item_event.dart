part of 'add_new_item_bloc.dart';

sealed class AddNewItemEventsss extends Equatable {
  const AddNewItemEventsss();

  @override
  List<Object> get props => [];
}

class AddNewItemNowEvent extends AddNewItemEventsss {
  final String itemTitle;
  final String itemDescription;
  final String itemImgUrl;

  const AddNewItemNowEvent(
      {required this.itemTitle,
      required this.itemDescription,
      required this.itemImgUrl});
}
