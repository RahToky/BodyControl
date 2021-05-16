import 'package:body_control/const/strings.dart';
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

class HomePage extends StatefulWidget implements RoutableWidget {
  @override
  String getRouteName() => "/home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  final List<MyTabDetail> tabDetail = [
    MyTabDetail(Strings.ACTUALITIES, [Colors.grey[200],Colors.grey[200]],Colors.grey),
    MyTabDetail(Strings.EXERCISES, [ColorUtil.fromHex("#112b4b"),ColorUtil.fromHex("#1b4466")],Colors.grey[300]),
    MyTabDetail(Strings.PROGRESS, [ColorUtil.fromHex("#696185"),ColorUtil.fromHex("#23496c")],Colors.grey[300]),
    MyTabDetail(Strings.PROGRESS, [ColorUtil.fromHex("#696185"),ColorUtil.fromHex("#23496c")],Colors.grey[300]),
    MyTabDetail(Strings.FAVORITES, [ColorUtil.fromHex("#afa4d8"),ColorUtil.fromHex("#9fcbf9")],Colors.white),
  ];

  String currentTitle;
  Color currentTitleColor;
  List<Color> currentTabColor;

  @override
  void initState() {
    super.initState();
    currentTitle = tabDetail[0].title;
    currentTitleColor = tabDetail[0].titleColor;
    currentTabColor = tabDetail[0].colors;
    _tabController = TabController(length: tabDetail.length, vsync: this)
      ..addListener(() {
        setState(() {
          currentTitle = tabDetail[_tabController.index].title;
          currentTitleColor = tabDetail[_tabController.index].titleColor;
          currentTabColor = tabDetail[_tabController.index].colors;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 5,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.grey[200],
              title: Text(
                '$currentTitle',
                style: TextStyle(color: currentTitleColor),
              ),
              actions: [
                const Icon(
                  Icons.account_circle,
                  size: 35,
                  color: Colors.grey,
                ),
                const SizedBox(
                  width: 15,
                )
              ],
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: currentTabColor)
                ),
              ),
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
            bottomNavigationBar: BottomTabBar(_tabController),
          ),
        ));
  }
}


class MyTabDetail{
  final String title;
  final List<Color> colors;
  final Color titleColor;
  MyTabDetail(this.title,this.colors,this.titleColor);
}