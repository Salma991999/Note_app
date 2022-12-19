import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:note_hive/constant/colors.dart';
import 'package:note_hive/models/note_model.dart';
import 'package:note_hive/state_mangment/home_provider.dart';
import 'package:provider/provider.dart';

class UpdateBottomSheet extends StatefulWidget {
  final Note note;
  UpdateBottomSheet(
      {super.key,required this.note});

  @override
  State<UpdateBottomSheet> createState() => _UpdateBottomSheetState();
}

class _UpdateBottomSheetState extends State<UpdateBottomSheet> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  late String getNoteColor;
  bool isPink = false;
  bool isLate = false;
  bool isMint = false ;
  bool isYellow = false;
  bool isBabyBlue = false;

  @override
  void initState() {
    titleController.text = widget.note.title ?? "";
    contentController.text = widget.note.content ?? "";
    getNoteColor = widget.note.noteColor ?? "";
    switch(getNoteColor) {
      case '0xffefb1c1': {
         isPink = true;
      }
      break;
      case '0xffffd9b4': {
        isLate = true;
      }
      break;
      case '0xffcfe7c0': {
        isMint = true;
      }
      break;
      case '0xffFFCC80': {
        isYellow = true;
      }
      break;
      case '0xffc7f3f2': {
        isBabyBlue = true;
      }
      break;
    }
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, child) {
      return Container(
        padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              colorChooser(),
              titleField(),
              contentField(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: Row(
                  children: [
                    saveButton(homeProvider),
                    const Spacer(),
                    cancelButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget colorChooser(){
    return Row(
      children: [
        Column(
          children: [
            isPink ?
            Container(
              margin: const EdgeInsets.all(3),
              width: 7,
              height: 7,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: MyColors.myWhite,
                borderRadius: BorderRadius.circular(20),),)
                : Container(),
            InkWell(
              onTap: (){ getNoteColor='0xffefb1c1';
              isPink = true;
              isLate = false;
              isMint = false ;
              isYellow = false;
              isBabyBlue = false;
              setState(() { });
              },
              borderRadius: BorderRadius.circular(30),
              child: Container(
                margin: const EdgeInsets.all(8),
                width: 30,
                height: 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: MyColors.myPink,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEDECF2).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0,1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            isLate ?
            Container(
              margin: const EdgeInsets.all(3),
              width: 7,
              height: 7,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: MyColors.myWhite,
                borderRadius: BorderRadius.circular(20),),)
                : Container(),
            InkWell(
              onTap: ( ){getNoteColor= '0xffffd9b4';
              isPink = false;
              isLate = true;
              isMint = false ;
              isYellow = false;
              isBabyBlue = false;
              setState(() { });
              },
              borderRadius: BorderRadius.circular(30),
              child:Container(
                margin: const EdgeInsets.all(8),
                width: 30,
                height: 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: MyColors.myLati,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEDECF2).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0,1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            isMint ?
            Container(
              margin: const EdgeInsets.all(3),
              width: 7,
              height: 7,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: MyColors.myWhite,
                borderRadius: BorderRadius.circular(20),),)
                : Container(),
            InkWell(
              onTap: (){getNoteColor='0xffcfe7c0';
              isPink = false;
              isLate = false;
              isMint = true ;
              isYellow = false;
              isBabyBlue = false;
              setState(() { });
              },
              borderRadius: BorderRadius.circular(30),
              child:Container(
                margin: const EdgeInsets.all(8),
                width: 30,
                height: 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: MyColors.myMent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEDECF2).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0,1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            isYellow ?
            Container(
              margin: const EdgeInsets.all(3),
              width: 7,
              height: 7,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: MyColors.myWhite,
                borderRadius: BorderRadius.circular(20),),)
                : Container(),
            InkWell(
              onTap: (){getNoteColor='0xffFFCC80';
              isPink = false;
              isLate = false;
              isMint = false ;
              isYellow = true;
              isBabyBlue = false;
              setState(() { });
              },
              borderRadius: BorderRadius.circular(30),
              child:Container(
                margin: const EdgeInsets.all(8),
                width: 30,
                height: 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: MyColors.myYellow,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEDECF2).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0,1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            isBabyBlue ?
            Container(
              margin: const EdgeInsets.all(3),
              width: 7,
              height: 7,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: MyColors.myWhite,
                borderRadius: BorderRadius.circular(20),),)
                : Container(),
            InkWell(
              onTap: (){getNoteColor='0xffc7f3f2';
              isPink = false;
              isLate = false;
              isMint = false ;
              isYellow = false;
              isBabyBlue = true;
              setState(() { });
              },
              borderRadius: BorderRadius.circular(30),
              child:Container(
                margin: const EdgeInsets.all(8),
                width: 30,
                height: 30,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: MyColors.myBabyBlue,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFFEDECF2).withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: const Offset(0,1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget titleField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        controller:titleController,
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
            fontWeight: FontWeight.w400,
          ),
          hintText: "Enter a title",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: MyColors.myWhite.withOpacity(0.5),
            fontSize: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
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

  Widget contentField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextField(
        controller:contentController,
        maxLines: 5,
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
            fontWeight: FontWeight.w400,
          ),
          hintText: "Enter a content",
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: MyColors.myWhite.withOpacity(0.5),
            fontSize: 16,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
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

  Widget saveButton(homeProvider) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        highlightColor: MyColors.myGreen,
        onTap: (){
             final updatedNote = Note(
             id: widget.note.id,
             title: titleController.text,
             content: contentController.text,
             onCreateDate: formatDate(
             DateTime.now(), [yyyy, '-', m, '-', d])
             .toString(),
             noteColor: getNoteColor,
              );
            homeProvider.updateNote(updatedNote);
           Navigator.of(context).pop();
          },
        child: Container(
          margin: const EdgeInsets.only(left: 1, bottom: 5.0, right: 1),
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
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: const Text("Save",
              style: TextStyle(
                color: MyColors.myGreen,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              )),
        ),
      ),
    );
  }

  Widget cancelButton(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(30.0),
        highlightColor: MyColors.myGreen,
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          margin: const EdgeInsets.only(left: 1, bottom: 5.0, right: 1),
          padding: const EdgeInsets.all(15.0),
          alignment: Alignment.center,
          width: 100,
          height: 60,
          decoration: BoxDecoration(
            color: MyColors.myPink,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: MyColors.myGreen.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 2,
                offset: const Offset(1, 2),
              ),
            ],
          ),
          child: const Text(
            "Cancel",
            style: TextStyle(
              color: MyColors.myGreen,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
