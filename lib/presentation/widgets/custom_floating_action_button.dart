import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import 'add_note_bottom_sheet.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
      return Container(
        height: 70,
        width: 70,
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
          boxShadow: [
            BoxShadow(
              color: MyColors.myWhite.withOpacity(0.4),
              spreadRadius: 6,
              blurRadius: 6,
              offset: const Offset(0.5, 0.5),
            ),
          ],
        ),
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isDismissible: false,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)),
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const AddNoteBottomSheet(),
                    );
                  });
            },
            backgroundColor: MyColors.myGreen,
            elevation: 10,
            child: const Icon(
              Icons.add,
              color: MyColors.myWhite,
              size: 20,
              shadows: [
                Shadow(
                  color: MyColors.myWhite,
                  offset: Offset(1, 1),
                  blurRadius: 5.0,
                )
              ],
            ),
          ),
        ),
      );
    }
  }

