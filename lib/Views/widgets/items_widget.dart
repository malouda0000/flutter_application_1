import 'package:flutter/material.dart';
import 'package:flutter_application_1/Controllers/custom_items_bloc/custom_items_bloc.dart';
import 'package:flutter_application_1/Models/emer_item_modle.dart';
import 'package:flutter_application_1/Views/screens/add_more_item_screen.dart';
import 'package:flutter_application_1/Views/screens/item_details_screen.dart';
import 'package:flutter_application_1/core/constants/app_color.dart';
import 'package:flutter_application_1/core/constants/constants.dart';

class CustomItemsWidget extends StatelessWidget {
  final List<Emeritem> items;
  const CustomItemsWidget({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              GetAllItems();
            },
            color: AppColor.kPrimaryColor,
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                Emeritem emeritems = items[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColor.kPrimaryColor,
                          child: Text(
                            // emeritems[index].id.toString(),
                            emeritems.id.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        // title: Text(emeritems[index].title),
                        title: Text(emeritems.title),
                        subtitle: Text(emeritems.description),
                        trailing: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColor.kPrimaryColor,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetScreen(
                                emeritem: emeritems,
                              ),
                            ),

                            //  ItemDetScreen(emeritem: emeritems[index],)
                          );
                        }),
                  ),
                );
              },
            ),
          ),
        ),
        emptySpace,
        ElevatedButton(
          // style: ButtonStyle(backgroundColor: Colors.green),

          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.kPrimaryColor,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddMoreItemScreen(),
              ),

              //  ItemDetScreen(emeritem: emeritems[index],)
            );
          },
          child: const Text(
            'add more',
            style: TextStyle(color: Colors.white),
          ),
        ),
        emptySpace,
        emptySpace,
      ],
    );
  }
}
