import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:note_hive/constant/colors.dart';
import 'package:note_hive/state_mangment/home_provider.dart';
import 'package:provider/provider.dart';
import '../../models/note_model.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}
class _CustomAppBarState extends State<CustomAppBar> {
 // late List<Note> allNotes ;
  late List<Note> searchedForNotes;
  bool _isSearching = false;
 // final _searchedTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: MyColors.myBlack,
        title: _isSearching ? _buildSearchField() : _buildAppBarTitle(),
        actions: _buildAppBarActions(), // handel the end icon
    );
  }
 Widget _buildAppBarTitle(){
    return
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
   );
 }
  Widget _buildSearchField(){  //ui
    return Consumer<HomeProvider>(builder:(context,homeProvider,child)
    {
      return Padding(
        padding: const EdgeInsets.only(left: 30),
        child: TextField(
          controller: homeProvider.searchedTextController,
          cursorColor: MyColors.myWhite,
          decoration: InputDecoration(
            hintText: 'Find a note by it \'s title...',
            border: InputBorder.none,
            hintStyle: TextStyle(
                color: MyColors.myWhite.withOpacity(0.7),
                fontSize: 18
            ),
          ),
          style: const TextStyle(
            color: MyColors.myWhite,
            fontSize: 20,
          ),
          onChanged: (searchedNoteChar) { // when write on search filled
            homeProvider.addSearchedForItemsToSearchedList(searchedNoteChar);
          },
        ),
      );
    });
  }

  Widget _CustomSearchIcon(){
    return Padding(
      padding: const EdgeInsets.only(right: 10,bottom: 5),
      child: InkWell(
        onTap: (){
          _startSearch();
          setState(() {
          });
        },
        customBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
            highlightColor: MyColors.myGrey,
        child: Container(
          height: 50,
            width: 50,
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
      ),
    );
  }
  List<Widget> _buildAppBarActions(){ // bar states
    if(_isSearching){  // true
      return [
        IconButton(
          onPressed: (){
            Provider.of<HomeProvider>(context,listen: false).clearSearch(); // to clear controller
            Navigator.pop(context); // return to the main bar and list
          },
          icon: const Icon(Icons.clear,
              color: MyColors.myWhite ,
              size: 30,
              shadows: [Shadow(
                  color: MyColors.myWhite,
                  blurRadius: 8.0,
              )]),
        ),
      ];
    }else{ // false
      return [
        _CustomSearchIcon(),
      ];
    }
  }
  void _startSearch(){
    // mad new rout for bar
    ModalRoute.of(context)!
    // onRemove ..> to stop search
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }
  void _stopSearching(){
    Provider.of<HomeProvider>(context,listen: false).clearSearch();
    setState(() {
      _isSearching = false;
    });
  }

}
