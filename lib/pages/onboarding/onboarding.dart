import 'package:body_control/const/strings.dart';
import 'package:body_control/pages/authorisation/authorisation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnBoardingPages extends StatefulWidget {
  static const ROUTE_NAME = 'onBoarding';

  const OnBoardingPages({Key key}) : super(key: key);

  @override
  _OnBoardingPagesState createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {
  int currentPage = 0;

  static final data = [
    {
      'backgroundImage': 'assets/images/onboarding1.jpg',
      'title': Strings.ON_BOARDING_TITLE_1,
      'description': Strings.ON_BOARDING_TITLE_1_DESC,
    },
    {
      'backgroundImage': 'assets/images/onboarding2.jpg',
      'title': Strings.ON_BOARDING_TITLE_2,
      'description': Strings.ON_BOARDING_TITLE_2_DESC,
    },
    {
      'backgroundImage': 'assets/images/onboarding3.jpg',
      'title': Strings.ON_BOARDING_TITLE_3,
      'description': Strings.ON_BOARDING_TITLE_3_DESC,
    },
    {
      'backgroundImage': 'assets/images/onboarding4.jpg',
      'title': Strings.ON_BOARDING_TITLE_4,
      'description': Strings.ON_BOARDING_TITLE_4_DESC,
    },
    {
      'backgroundImage': 'assets/images/onboarding5.jpg',
      'title': Strings.ON_BOARDING_TITLE_5,
      'description': Strings.ON_BOARDING_TITLE_5_DESC,
    }
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light);
    return Scaffold(
      body: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('${data[currentPage]['backgroundImage']}'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              /** STEPPER **/
              Expanded(
                flex: 2,
                child: Container(
                  width: size.width * 0.25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(5, (index) {
                      return Icon(
                        Icons.circle,
                        color:
                            (currentPage == index) ? Colors.grey : Colors.white,
                        size: 13,
                      );
                    }),
                  ),
                ),
              ),

              /** CONTENT **/
              Expanded(
                flex: 10,
                child: Container(
                  margin: EdgeInsets.only(top: size.width * 0.6),
                  child: Column(children: [
                    Text(
                      '${data[currentPage]['title']}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 25),
                    Flexible(
                      child: Text(
                        '${data[currentPage]['description']}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: size.width * 0.85,
                  child: Column(
                    children: [
                      if(currentPage==4)MaterialButton(
                        height: 55,
                        minWidth: double.infinity,
                        color: Colors.white,
                        elevation: 0,
                        child: Text(
                          '${Strings.CUSTOM_MY_EXP}',
                          style: TextStyle(color: Colors.black, fontSize: 22),
                        ),
                        shape: BeveledRectangleBorder(
                          side: BorderSide(color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pushNamed(context, AuthorisationPage.ROUTE_NAME);
                          });
                        },
                      ),
                      SizedBox(height: (currentPage==4)?10:65),
                      MaterialButton(
                        height: 55,
                        minWidth: double.infinity,
                        child: Text(
                          '${(currentPage<4)?Strings.NEXT:Strings.CONTINUE_ANONYMOUSLY}',
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        shape: BeveledRectangleBorder(
                          side: BorderSide(color: Colors.white),
                        ),
                        onPressed: () {
                          setState(() {
                            if(currentPage<4)
                            currentPage++;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
