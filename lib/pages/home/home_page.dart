import 'package:body_control/interface/routable.dart';
import 'package:body_control/pages/home/actuality/actuality_page.dart';
import 'package:body_control/pages/home/exercise/exercise_page.dart';
import 'package:body_control/pages/home/favorite/favorite_page.dart';
import 'package:body_control/pages/home/progress/progress_list_page.dart';
import 'package:body_control/pages/home/progress/progress_main_page.dart';
import 'package:body_control/utils/colorUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bottom_tab_bar.dart';

class HomePage extends StatelessWidget implements RoutableWidget{

  @override
  String getRouteName() => "/home";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorUtil.fromHex("#40A7D5"),
          accentColor: ColorUtil.fromHex("#112948"),
          backgroundColor: ColorUtil.fromHex("#40A7D5"),
          hintColor: Colors.grey,
        ),
      home:DefaultTabController(
        length: 5,
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.grey[200],
            title: const Text('Actualités',style: TextStyle(color: Colors.grey),),
            actions: [const Icon(Icons.account_circle,size: 35,color: Colors.grey,),const SizedBox(width: 15,)],
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              ActualityPage(),
              ExercisePage(),
              ProgressMainPage(),
              ProgressListPage(),
              FavoritePage()
            ],
          ),
          bottomNavigationBar: BottomTabBar(),
        ),
      )
    );
  }
}
