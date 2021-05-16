import 'package:body_control/const/strings.dart';
import 'package:flutter/material.dart';

class BottomTabBar extends StatelessWidget {
  final defaultColor = Colors.grey;
  final TabController tabController;

  BottomTabBar(this.tabController);

  @override
  Widget build(BuildContext context) {
    final selectedColor = Theme.of(context).primaryColor;
    return Container(
      color:Colors.grey[200],
      child: Padding(
        padding:EdgeInsets.only(top:1),
        child: Container(
          color:Colors.white,
          child: TabBar(
            controller: tabController,
            labelColor: selectedColor,
            labelPadding: EdgeInsets.only(bottom: 10),
            indicatorColor: Colors.transparent,
            unselectedLabelColor: defaultColor,
            tabs: [
              {'icon': Icons.wysiwyg, 'label': '${Strings.ACTUALITIES}'},
              {'icon': Icons.accessibility, 'label': '${Strings.EXERCISES}'},
              {'icon': Icons.add_circle_outline_outlined,'label':''},
              {'icon': Icons.bar_chart, 'label': '${Strings.PROGRESS}'},
              {'icon': Icons.bookmark, 'label': '${Strings.FAVORITES}'},
            ].map((item) {
              return Container(
                height: 50,
                child: Center(
                  child: Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(item['icon'], size: (item['label'].toString().isNotEmpty)? null:45),
                        if(item['label'].toString().isNotEmpty) Text(
                          item['label'],
                          style: TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}