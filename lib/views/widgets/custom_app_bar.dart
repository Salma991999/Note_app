import 'package:flutter/material.dart';
import 'package:note_hive/constant/colors.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
      child: Row(
        children: [
       const DefaultTextStyle(
         style: TextStyle(
         fontSize: 30,
         color: MyColors.myWhite,
         shadows: [
          Shadow(
            blurRadius: 7.0,
            color: MyColors.myWhite,
            offset: Offset(0.2, 0.5),
          ),
        ],
      ),
         child:Text('Notes'),
      ),
          const Spacer(),
          CustomSearchIcon(),
        ],
      ),
    );
  }
  Widget CustomSearchIcon(){
    return InkWell(
      customBorder: const OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
      highlightColor: MyColors.myGrey,
      onTap: (){},
      child: Container(
        height: 45,
          width: 45,
           decoration: BoxDecoration(
             color: MyColors.myWhite.withOpacity(0.09),
             borderRadius:const BorderRadius.all(Radius.circular(15.0))
           ),
        child: const Center(
          child: Icon(
            Icons.search,
            color: MyColors.myWhite,
            size: 28,
          ),
        ),
      ),
    );
  }
}
