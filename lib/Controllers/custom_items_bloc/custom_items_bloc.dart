import 'package:flutter_application_1/repositories/add_item_repo.dart';
import 'package:flutter_application_1/repositories/list_items_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/Models/emer_item_modle.dart';

part 'custom_items_event.dart';
part 'custom_items_state.dart';

class CustomItemsBloc extends Bloc<CustomItemsEvent, CustomItemsState> {
  final CustomItemsRepo customItemsRepo;
  CustomItemsBloc({required this.customItemsRepo}) : super(LoadingState()) {
    on<CustomItemsEvent>(
      (event, emit) async {
        if (event is GetAllItemsEvent) {
          emit(LoadingState());
          try {
            final emeritem = await customItemsRepo.getAllItems();
            emit(LoadedState(emeritem: emeritem));
          } catch (e) {
            emit(
              ErrorState(
                errorMassage: e.toString(),
              ),
            );
          }
        }
      },
    );
  }
}
