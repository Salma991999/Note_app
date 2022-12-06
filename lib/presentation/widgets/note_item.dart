import 'package:flutter/material.dart';
import 'package:note_hive/constant/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NoteItem extends StatelessWidget{
  const NoteItem({super.key});
  @override
  Widget build(BuildContext context) {
   return Container(
     margin: const EdgeInsets.only(top: 10,left: 5.0,right: 5.0),
     padding: const EdgeInsets.all(16),
     decoration: BoxDecoration(
       color: MyColors.myYellow,
       borderRadius: const BorderRadius.all(Radius.circular(20)),
       boxShadow:  [
     BoxShadow(
     color: MyColors.myGreen.withOpacity(1),
     spreadRadius:2,
     blurRadius: 2,
     blurStyle: BlurStyle.solid
     //offset:const Offset(2, 2),
     ),],),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.end,
       children: [
         ListTile(
           title: const Text('Title',
           style: TextStyle(
             color: MyColors.myGreen,
             fontWeight: FontWeight.bold,
             fontSize: 26
           )),
           subtitle:  Padding(
             padding: const EdgeInsets.only(top: 16.0,bottom: 16.0),
             child: Text('body of note ',
                 style: TextStyle(
                   color: MyColors.myGreen.withOpacity(0.6),
                   fontSize: 18 ,
             )),
           ),
           trailing: InkWell(
             onTap: (){},
               child: const Icon(
                      FontAwesomeIcons.trash ,
                 //Icons.delete,
               color:MyColors.myGreen,
                 size: 24,
               ),
           ),
         ),
         Padding(
           padding: const EdgeInsets.only(bottom: 10.0, right: 15.0),
           child: Text('May21 , 2022',
           style: TextStyle(
             color: MyColors.myGreen.withOpacity(0.8),
                 fontSize: 12,
             fontWeight:FontWeight.w300,
           ),
           ),
         ),
       ],
     ),
   );
  }
  
}