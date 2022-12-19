import 'package:flutter/material.dart';
import 'package:note_hive/constant/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_hive/models/note_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_hive/presentation/widgets/update_bottom_sheet.dart';
import 'package:provider/provider.dart';
import '../../data/database.dart';
import '../../state_mangment/home_provider.dart';

class NoteItem extends StatefulWidget {
  late Note note;

  NoteItem(this.note,{super.key});

  @override
  State<NoteItem> createState() => _NoteItemState();
}

class _NoteItemState extends State<NoteItem> {
  updateCheckBox(bool? value) {
    setState(() {
      widget.note.isDone = value;
    });
     DataBase.updateNoteInList(widget.note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder:(context,homeProvider,child){
      return Padding(
        padding: const EdgeInsets.only(top: 15, left: 5.0, right: 5.0),
        child: Slidable(
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                borderRadius: BorderRadius.circular(30),
                onPressed: (_) {
                 // homeProvider.deleteNote(widget.note);
                  homeProvider.deleteFromUi(widget.note);
                  // Fluttertoast.showToast(
                  //     msg: "Undo",
                  //     toastLength: Toast.LENGTH_LONG,
                  //     gravity: ToastGravity.CENTER,
                  //     timeInSecForIosWeb: 1,
                  //     backgroundColor: MyColors.myGreen,
                  //     textColor: MyColors.myWhite,
                  //     fontSize: 18.0,
                  // );
                  final text = "${widget.note.title} will be delete";
                  final snackBar = SnackBar(
                    behavior: SnackBarBehavior.floating,
                      duration: const Duration(milliseconds:1400 ),
                      margin:const EdgeInsets.only(top: 15,bottom:50.0,right: 40.0,left: 40.0),
                      content: Padding(
                        padding: const EdgeInsets.only(left: 15.0,bottom: 5.0,top: 5.0),
                        child: Text (text,
                        style: const TextStyle(
                          color: MyColors.myWhite,
                          fontSize: 16,
                        ),
                        ),
                      ),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: (){
                        homeProvider.undo = true;
                      },
                      textColor: MyColors.myYellow,
                      disabledTextColor:MyColors.myPink,
                    ),
                    backgroundColor: MyColors.myGreen,
                    elevation: 5,
                    padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0)),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                icon: FontAwesomeIcons.solidTrashCan,
                backgroundColor: MyColors.myGreen,
              ),
            ],
          ),
          child: Container(
            // margin: const EdgeInsets.only(top: 10,left: 5.0,right: 5.0),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(int.parse(widget.note.noteColor ?? '0xff78787')),
              //MyColors.myYellow,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: MyColors.myGreen.withOpacity(1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    blurStyle: BlurStyle.solid),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  title: Row(
                    children: [
                      Transform.scale(
                        scale: 1.3,
                        child: Checkbox(
                          onChanged: updateCheckBox,
                          value: widget.note.isDone,
                          // false,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0)),
                          activeColor: MyColors.myGreen.withOpacity(0.85),
                          checkColor: MyColors.myWhite,
                          side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                            const BorderSide(
                                width: 1.5, color: MyColors.myGreen),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(widget.note.title!,
                            style: TextStyle(
                                decoration: widget.note.isDone!
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                decorationThickness: 2.0,
                                decorationColor: MyColors.myWhite,
                                color: MyColors.myGreen,
                                fontWeight: FontWeight.w500,
                                fontSize: 26)),
                      ),
                    ],
                  ),
                  subtitle: Padding(
                    padding:
                    const EdgeInsets.only(top: 16.0, bottom: 16.0, left: 15),
                    child: Text(widget.note.content!,
                        style: TextStyle(
                          color: MyColors.myGreen.withOpacity(0.7),
                          fontSize: 18,
                        )),
                  ),
                  trailing: InkWell(
                    highlightColor: MyColors.myGreen.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(30.0),
                    onTap: () {
                      showModalBottomSheet(
                          isDismissible: false,
                          // backgroundColor: MyColors.myGrey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32)),
                          context: context,
                          builder: (context) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery
                                      .of(context)
                                      .viewInsets
                                      .bottom),
                              child: UpdateBottomSheet(
                                note: widget.note,
                                //homeProvider:widget.homeProvider
                              ),
                            );
                          });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(2.0),
                      child: Icon(
                        FontAwesomeIcons.pencil,
                        color: MyColors.myGreen,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0, right: 15.0),
                  child: Text(
                    widget.note.onCreateDate.toString(),
                    style: TextStyle(
                      color: MyColors.myGreen.withOpacity(0.8),
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
