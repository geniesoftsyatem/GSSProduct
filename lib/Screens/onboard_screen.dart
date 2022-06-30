import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/onboard_screen_model.dart';
import 'package:genie_money/Screens/portfolio.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/utils/constants.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../home.dart';
import 'signup_screen.dart';

class OnBoardScreen extends StatefulWidget {
  String from, type;

  OnBoardScreen(this.from, this.type, {Key? key}) : super(key: key);

  @override
  _OnBoardScreen createState() {
    // TODO: implement createState
    return _OnBoardScreen();
  }
}

class _OnBoardScreen extends State<OnBoardScreen> {
  late List<OnBoardScreenList> onboardlist;
  bool isLayoutVisible = false;

  void _checkLogin() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var isLogedIn = false;
    var type = "Customer";
    Constants.userid = prefs.getString("userid") ?? "";
    Constants.name = prefs.getString("name") ?? "";
    Constants.email = prefs.getString("email") ?? "";
    Constants.phone = prefs.getString("phone") ?? "";
    Constants.type = prefs.getString("type") ?? "Customer";
    if (prefs.containsKey("isLoggedIn")) {
      isLogedIn = prefs.getBool("isLoggedIn") ?? false;
    }

    if (prefs.containsKey("type")) {
      type = prefs.getString("type") ?? "Customer";
    }

    setState(() {
      if (widget.from == "signin") {
        Route route = MaterialPageRoute(builder: (context) => SignupScreen(widget.type));
        Navigator.of(context).push(route);
      } else if (widget.from == "signup") {
        Route route = MaterialPageRoute(builder: (context) => SignInScreen(widget.type));
        Navigator.of(context).push(route);
      }
      if (isLogedIn) {
        isLayoutVisible = false;
        if (type == "Employee") {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => PortfolioScreen(type),
            ),
            (route) => false,
          );
        } else {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => const Home(),
            ),
            (route) => false,
          );
        }
      } else {
        isLayoutVisible = true;
      }
    });
  }

  @override
  void initState() {
    _checkLogin();
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Visibility(
      visible: isLayoutVisible,
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        //appBar: AppBar(
          /*actions: <Widget>[
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil<dynamic>(
                  context,
                  MaterialPageRoute<dynamic>(
                    builder: (BuildContext context) => const Home(),
                  ),
                  (route) => false,
                );
              },
              child: const Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Center(
                    child: Text(
                      "SKIP",
                      style:
                          TextStyle(color: Color(0XFFFFAE00), fontSize: 18.0),
                    ),
                  ),
                ),
              ),
            ),
          ],*/
        //),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: height * 0.50,
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
                                    child: Container(
                                      margin: EdgeInsets.all(10.0),
                                      child: Image(
                                        image: AssetImage(e.image),
                                        width: width,
                                        height: height,
                                        fit: BoxFit.fill,
                                      ),
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
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 30.0),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignInScreen("0")),
                        );
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupScreen("0")));
                      },
                    ),
                  ),
                  /*Container(
                    margin: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 10.0),
                    child: ElevatedButton(
                      child: const Text(
                        "DEMO",
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
                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => const Home(),
                          ),
                              (route) => false,
                        );
                      },
                    ),
                  ),*/
                ],
              ),
            ],
          ),
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
