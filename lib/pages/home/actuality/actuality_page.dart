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
      itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.only(bottom: 5.0),
          child: Column(
            children: [
              ActualityCard(
                  actualities[index]['logo'],
                  actualities[index]['title'],
                  actualities[index]['image'],
                  actualities[index]['logoColor'],
                  false),
              if (index > 0) ActualityPub(pubs[index-1]['imageUri'], pubs[index-1]['text'], pubs[index-1]['buttonText'])
            ],
          )),
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
    return Container(
      width: size.width,
      height: size.width * 0.35,
      color: bgColor,
      child: Row(
        children: [
          Flexible(flex: 3, child: Image.asset('$imageUri')),
          Flexible(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Flexible(
                        child: Text(
                          '$text',
                          style: TextStyle(color: Colors.grey, fontSize: 20,),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),

                    if(buttonText != null)Container(
                      width: double.infinity,
                      child: TextButton(
                        child: Text('$buttonText',style:TextStyle(color: Colors.white)),
                        style: TextButton.styleFrom(
                          side: BorderSide(color:Colors.white),
                          shape: BeveledRectangleBorder()
                        ),
                      ),
                    )
                  ],
                ),
            ),
            ),
        ],
      ),
    );
  }
}
