import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_shield/Model/onboard_screen_model.dart';
import 'package:genie_shield/utils/screen_sizes.dart';

import '../home.dart';
import 'signup_screen.dart';
class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreen createState() {
    // TODO: implement createState
    return _OnBoardScreen();
  }
}

class _OnBoardScreen extends State<OnBoardScreen> {
  late List<OnBoardScreenList> onboardlist;

  @override
  void initState() {
    // TODO: implement initState
    onboardlist = [
      OnBoardScreenList("images/finance_intro.png", "Business & Finance",
          "Heart of Perfect Financial Planning. We offer financial wings to let your dreams soar higher."),
      OnBoardScreenList(
          "images/personalsecurity_intro.png",
          "Personal Security",
          "Protect personal information. The identity saved could be your own."),
      OnBoardScreenList("images/devicesecurity_intro.png", "Device Security",
          "Right Protection, Right Time. One place for all security solutions."),
      OnBoardScreenList("images/entertainment_intro.png", "Entertainment",
          "Provides you a new perspective towards entertainment. We bring you what you want."),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal! * 90;
    double height = SizeConfig.blockSizeVertical! * 50;
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        actions: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Center(
                  child: Text(
                    "SKIP",
                    style: TextStyle(color: Color(0XFFFFAE00), fontSize: 18.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: height,
                  viewportFraction: 1.0,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                  autoPlay: true,
                  // onPageChanged: (index, reason) {
                  //   setState(() {
                  //     _currentPosition = index;
                  //   });
                  // },
                ),
                items: onboardlist
                    .map(
                      (e) => ClipRRect(
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                child: Image(
                                  image: AssetImage(e.image),
                                  width: width,
                                  height: height,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30.0),
                              child: Center(
                                child: Text(
                                  e.title,
                                  style: const TextStyle(
                                      color: Color(0xFFFFAE00),
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: Text(e.subtitle,
                                    style: const TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 15.0),
                                    textAlign: TextAlign.center),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                  child: ElevatedButton(
                    child: const Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 25.0),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      _alertDialog();
                    },
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: ElevatedButton(
                    child: const Text(
                      "SIGN IN",
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 25.0),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      _alertDialog();
                      /*Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignupScreen()),
                      );*/
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future _alertDialog() {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          contentText: 'Coming Soon',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}
