import 'package:flutter/material.dart';

class ActualityCard extends StatelessWidget {
  final String logoUri;
  final String title;
  final String imageUri;
  final Color logoColor;
  final bool isFavorite;

  ActualityCard(this.logoUri, this.title, this.imageUri,this.logoColor,this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      child: Card(
        margin: EdgeInsets.all(0),
        shape: BeveledRectangleBorder(),
        elevation: 2,
        child: Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.fromLTRB(0, 10, 5, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 60, width: 70, child: Image.asset("$logoUri",color: (logoColor != null && logoColor != Colors.transparent)?logoColor:null)),
                  Expanded(
                      child: Text('$title',
                          overflow: TextOverflow.ellipsis,
                          style:
                          TextStyle(fontSize: 19, color: Colors.black54))),
                  SizedBox(
                      height: 60,
                      width: 20,
                      child: Text('2j',
                          style:
                          TextStyle(fontSize: 20, color: Colors.grey[300])))
                ],
              ),
            ),
            Container(
              height: size.width*0.55,
              width: size.width,
              child: Image.asset(
                "$imageUri",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 50,
              padding: EdgeInsets.only(left: 20),
              child: Row(
                children: [
                  (isFavorite)?ImageIcon(
                    AssetImage('assets/logos/like.png'),
                    color: Colors.grey,
                    size: 35,
                  ):Container(),
                  Icon(
                    Icons.share_outlined,
                    color: Colors.grey,
                  ),
                  IconButton(
                      icon: Icon(Icons.bookmark_border), color: Colors.grey),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}