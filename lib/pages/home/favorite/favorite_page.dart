import 'package:body_control/const/strings.dart';
import 'package:body_control/pages/home/actuality/actuality_card.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {

  final favorites = [
    {
      'logo': 'assets/logos/cuisine.jpg',
      'title': '${Strings.ACT_3_TITLE}',
      'image': 'assets/images/donut.jpg',
      'logoColor':null,
    },
    {
      'logo': 'assets/logos/cuisine.jpg',
      'title': '${Strings.FAV_1_TITLE}',
      'image': 'assets/images/friandise.jpg',
      'logoColor':null,
    },
    {
      'logo': 'assets/logos/cuisine.jpg',
      'title': '${Strings.FAV_2_TITLE}',
      'image': 'assets/images/regime.jpg',
      'logoColor':Colors.transparent,
    },
  ];

  @override
  Widget build(BuildContext context) {return ListView.builder(
    itemCount: favorites.length,
    itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(bottom: 5.0),
        child: ActualityCard(favorites[index]['logo'],
            favorites[index]['title'], favorites[index]['image'], favorites[index]['logoColor'],true)),
  );
  }
}
