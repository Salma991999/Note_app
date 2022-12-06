import 'package:flutter/material.dart';
import 'package:note_hive/constant/colors.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 20.0),
       child: SingleChildScrollView(
         child: Column(
           children: [
             titleField(),
             contentField(),
             saveButton(),
           ],
         ),
       ),
    );
  }
  Widget titleField() {
    return  Padding(
  padding: const EdgeInsets.only(top: 20.0),
  child: TextField(
  textAlign: TextAlign.start,
  style: const TextStyle(
  color: MyColors.myWhite,
  fontSize: 20,
  fontWeight: FontWeight.w500,
  height: 1,
  ),
  decoration: InputDecoration(
  labelText: 'Title',
  labelStyle: const TextStyle(
  color: MyColors.myYellow,
  fontSize: 20,
  fontWeight:FontWeight.w400,
  ),
  hintText: "Enter a title",
  hintStyle: TextStyle(
  fontWeight: FontWeight.w400,
  color: MyColors.myWhite.withOpacity(0.5),
  fontSize: 16,
  ),
  enabledBorder:OutlineInputBorder(
  borderRadius: BorderRadius.circular(12),
  borderSide:  BorderSide(
  color: MyColors.myWhite.withOpacity(0.6),
  ),
  ),
  //  focusColor: MyColors.myYellow,
  focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(20),
  borderSide: const BorderSide(
  color: MyColors.myGreen,
  width: 3,
  ),
  ),
  ),
  cursorColor: MyColors.myGreen,
  cursorHeight: 25,
  cursorWidth: 3,
  ),
  );
}
  Widget contentField(){
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        maxLines: 7,
        textAlign: TextAlign.start,
        style: const TextStyle(
          color: MyColors.myWhite,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          labelText: 'Content',
          labelStyle: const TextStyle(
            color: MyColors.myYellow,
            fontSize: 20,
            fontWeight:FontWeight.w400,
          ),
          hintText: "Enter a content",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: MyColors.myWhite.withOpacity(0.5),
            fontSize: 16,
          ),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  BorderSide(
              color: MyColors.myWhite.withOpacity(0.6),
            ),
          ),
          //  focusColor: MyColors.myYellow,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: MyColors.myGreen,
              width: 3,
            ),
          ),
        ),
        cursorColor: MyColors.myGreen,
        cursorHeight: 25,
        cursorWidth: 3,
      ),
    );
  }
  Widget saveButton(){
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: InkWell(
      borderRadius: BorderRadius.circular(30.0),
      highlightColor: MyColors.myGreen,
      onTap: (){},
      child: Container(
      margin: const EdgeInsets.only(left: 1,bottom: 5.0,right: 1),
      padding: const EdgeInsets.all(15.0),
      alignment: Alignment.center,
      width: 100,
      height: 60,
      decoration: BoxDecoration(
      color: MyColors.myYellow,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
      BoxShadow(
      color: MyColors.myGreen.withOpacity(0.3),
      spreadRadius: 2,
      blurRadius: 2,
      offset:const Offset(1,2),
      ),
      ],
      ),
      child: const Text("Save",
      style: TextStyle(color: MyColors.myGreen,
      fontWeight: FontWeight.bold,fontSize: 18,
      )),
      ),
      ),
    );
  }
}
