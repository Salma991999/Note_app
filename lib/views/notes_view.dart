import 'package:flutter/material.dart';
import 'package:note_hive/constant/colors.dart';
import 'package:note_hive/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
const NotesView({super.key});

@override
Widget build(BuildContext context) {
  return  Scaffold(
    body: const NotesViewBody(),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    floatingActionButton: Container(
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
            onPressed: (){},
          backgroundColor: MyColors.myGreen,
          elevation: 10,
          // child: Container(
          //   padding: const EdgeInsets.all(14.0),
          //   decoration: BoxDecoration(
          //     color: Colors.transparent,
          //     borderRadius: const BorderRadius.all(
          //       Radius.circular(60),
          //     ),
          //     boxShadow: [
          //       BoxShadow(
          //         color: MyColors.myWhite.withOpacity(0.35),
          //         spreadRadius: 8,
          //         blurRadius: 8,
          //         offset: const Offset(1, 1),
          //       ),
          //     ],
          //   ),
            child: const Icon(Icons.add,
            color: MyColors.myWhite,
              size: 20,
              shadows: [Shadow(
                color: MyColors.myWhite,
                offset: Offset(1, 1),
                blurRadius: 5.0,
              )],
            ),
          ),
        ),
    //  ),
    ),
  );
}
}