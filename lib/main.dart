import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_hive/data/database.dart';
import 'package:note_hive/presentation/screens/home.dart';
import 'package:note_hive/state_mangment/home_provider.dart';
import 'package:provider/provider.dart';

import 'constant/colors.dart';

 main() async{
  // message to hardware
  WidgetsFlutterBinding.ensureInitialized();

  // init the hive
  await Hive.initFlutter();
  DataBase.init();

  // open a box
  var box = await Hive.openBox('myBox');

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => HomeProvider(),
      // must be a class extend changeNotifier
      builder: (context, child) {
        return  MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              backgroundColor: MyColors.myBlack,
              brightness: Brightness.dark,
              fontFamily: 'Poppins'
          ),
          home: const Home(),
        );
      },
    );
  }
}

