import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repositories/add_item_repo.dart';

part 'add_new_item_event.dart';
part 'add_new_item_state.dart';

class AddNewItemBloc extends Bloc<AddNewItemEventsss, AddNewItemState> {
  AddNewItemBloc() : super(AddNewItemInitial()) {
    on<AddNewItemEventsss>((event, emit) async {
      // on<AddNewItemNowEvent>((event, emit) async {
      if (event is AddNewItemNowEvent) {
        emit(LoadingNewItemState());
        try {
          bool result = await postNewItem(
            itemTitle: event.itemTitle,
            itemDescription: event.itemDescription,
            itemImgUrl: event.itemImgUrl,
          );

          if (result == true) {
            emit(NewItemAddedSuccessState());
          }
        } catch (e) {
          emit(
            AddNewItemErrorState(
              errorMassage: e.toString(),
            ),
          );
        }
      }
    });
  }
}
