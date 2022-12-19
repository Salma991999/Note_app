import 'package:flutter/material.dart';
import 'package:note_hive/presentation/widgets/home_body.dart';
import '../../constant/colors.dart';
import '../widgets/custom_floating_action_button.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: MyColors.myBlack,
        body: HomeBody(),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:const CustomFloatingActionButton(),
      );
  }
}
