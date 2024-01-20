import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repositories/add_item_repo.dart';

part 'add_new_item_event.dart';
part 'add_new_item_state.dart';

class AddNewItemBloc extends Bloc<AddNewItemEvent, AddNewItemState> {
  AddNewItemBloc() : super(AddNewItemInitial()) {
    on<AddNewItemEvent>((event, emit) {
      (event, emit) async {
        emit(LoadingNewItemState());
        try {
          // final emeritem = await customItemsRepo.getAllItems();
          // emit(LoadedState(emeritem: emeritem));

          bool result = await postItem();

          // return result;

          if (result == true) {
            // emit();
            emit(LoadedNewItemState());
          }
        } catch (e) {
          emit(
            AddNewItemErrorState(
              errorMassage: e.toString(),
            ),
          );
        }
      };
    });
  }
}
