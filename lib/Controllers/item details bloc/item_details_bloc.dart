import 'package:flutter_application_1/repositories/edit_item_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/repositories/delete_item_repo.dart';

part 'item_details_event.dart';
part 'item_details_state.dart';

class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {
  ItemDetailsBloc(
      // {required this.deletItemRepository}
      )
      : super(ItemDetailsInitialState()) {
    on<ItemDetailsEvent>(
      (event, emit) async {
// i have to fix this logic, becaus it may cus problems i the futuer
        // emit(ItemDetailsLoadedState());

        // if (event is ItemDetailsInitialState) {
        //   print('=-=-=-=-=-=-=-=-=-=-=-=-=-ß-=-=-=- loaaaaaddddeeedd');

        //   emit(ItemDetailsLoadedState());
        // }
        //  else
        if (event is ItemRemoveEvent) {
          final DeletItemRepository deletItemRepository = DeletItemRepository();
          emit(ItemDetailsLoadingState());
          try {
            http.Response result =
                await deletItemRepository.deletItemRepository(
              // userEmail: event.userEmail,
              // itemId: event.itemId,
              userEmail: event.userEmail,
              itemId: event.itemId,
            );

            if (result.statusCode == 200) {
              emit(ItemDetailsRemovdedState());
            } else {
              emit(
                ItemDetailsErrorState(
                  errorMassage: result.statusCode.toString(),
                ),
              );
            }
          } catch (error) {
            emit(
              ItemDetailsErrorState(
                errorMassage: error.toString(),
              ),
            );
          }
        }

        /////////////
        /////////////

        else if (event is ItemEditeEvent) {
          final EditItemRepository editItemRepository = EditItemRepository();
          emit(ItemDetailsLoadingState());
          try {
            http.Response result = await editItemRepository.editItemRepository(
              userEmail: event.userEmail,
              itemId: event.itemId,
              itemTitle: event.itemTitle,
              itemDescription: event.itemDescription,
              itemImgUrl: event.itemImgUrl,
            );

            if (result.statusCode == 200) {
              emit(ItemEditedSuccsfluyState());
            } else {
              emit(
                ItemDetailsErrorState(
                  errorMassage: 'Error: ${result.statusCode} + ${result.body}',
                ),
              );
            }
          } catch (error) {
            emit(
              ItemDetailsErrorState(
                errorMassage: error.toString(),
              ),
            );
          }
        }

        /////////////
        /////////////

        else if (event is ItemDetailsRsetEvent) {
          emit(ItemDetailsInitialState());
        }
      },
    );
  }
}
