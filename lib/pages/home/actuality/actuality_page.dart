import 'package:body_control/const/strings.dart';
import 'package:body_control/utils/colorUtil.dart';
import 'package:flutter/material.dart';

import 'actuality_card.dart';

class ActualityPage extends StatelessWidget {
  final actualities = [
    {
      'logo': 'assets/logos/logo.png',
      'title': '${Strings.ACT_1_TITLE}',
      'image': 'assets/images/chirurgie.jpg',
      'logoColor': Colors.blue,
    },
    {
      'logo': 'assets/logos/natation.jpg',
      'title': '${Strings.ACT_2_TITLE}',
      'image': 'assets/images/natation.jpg',
      'logoColor': null,
    },
    {
      'logo': 'assets/logos/cuisine.jpg',
      'title': '${Strings.ACT_3_TITLE}',
      'image': 'assets/images/donut.jpg',
      'logoColor': null,
    },
  ];

  final pubs = [
    {
      'imageUri':'assets/images/spartiate.JPG',
      'text':'${Strings.PUB_1_TEXT}',
      'buttonText':null,
    },
    {
      'imageUri':'assets/images/pied.JPG',
      'text':'${Strings.PUB_2_TEXT}',
      'buttonText':'DECOUVRIR',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: actualities.length,
      itemBuilder: (context, index) => Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: ActualityCard(
                actualities[index]['logo'],
                actualities[index]['title'],
                actualities[index]['image'],
                actualities[index]['logoColor'],
                false),
          ),
          if (index > 0) Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: ActualityPub(pubs[index-1]['imageUri'], pubs[index-1]['text'], pubs[index-1]['buttonText']),
          )
        ],
      ),
    );
  }
}

class ActualityPub extends StatelessWidget {
  final Color bgColor = ColorUtil.fromHex("#112848");

  final String imageUri;
  final String text;
  final String buttonText;

  ActualityPub(this.imageUri, this.text, this.buttonText);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.all(0),
      elevation: 6,
      child: Container(
        width: size.width,
        height: size.width * 0.35,
        color: bgColor,
        child: Row(
          children: [
            Container(width: size.width*0.4, child: Image.asset('$imageUri',fit: BoxFit.cover,)),
            Container(
              width: size.width*0.6,
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: (buttonText == null)?_buildText():Container(
                  child: Column(
                      children: [
                        _buildText(),
                        Container(
                          //margin: EdgeInsets.only(top:10),
                          width: double.infinity,
                          child: TextButton(
                            child: Text('$buttonText',style:TextStyle(color: Colors.grey[200])),
                            style: TextButton.styleFrom(
                              side: BorderSide(color:Colors.grey[200]),
                              shape: const BeveledRectangleBorder()
                            ),
                          ),
                        )
                      ],
                    ),
                ),
              ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildText() => Text(
    '$text',
    style: TextStyle(color: Colors.grey, fontSize: 20,),
    overflow: TextOverflow.ellipsis,
    maxLines: 4,
    textAlign: TextAlign.start,
  );
}
