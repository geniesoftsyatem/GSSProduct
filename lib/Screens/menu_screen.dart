import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:genie_money/Screens/cashback_screen.dart';
import 'package:genie_money/Screens/offer_screen.dart';
import 'package:genie_money/Screens/refer_and_earn_screen.dart';
import 'package:genie_money/Screens/settings_screen.dart';
import 'package:genie_money/utils/constants.dart';

import 'essentials_screen.dart';
import 'optionsfile.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreen createState() {
    // TODO: implement createState
    return _MenuScreen();
  }
}

class _MenuScreen extends State<MenuScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF444444),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: width * 0.34),
              height: height * 0.2852,
              width: width,
              child: DrawerHeader(
                child: Center(
                  child: Column(
                    children: [
                      Center(
                        child: Icon(
                          CupertinoIcons.profile_circled,
                          color: const Color(0xFFFFAE00),
                          size: height * 0.12,
                        ),
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              Constants.name.isNotEmpty ? Constants.name : "User Name",
                              style: const TextStyle(
                                color: Color(0xFFFFAE00),
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              Constants.phone.isNotEmpty ? Constants.phone : "mobile number",
                              style: const TextStyle(
                                color: Color(0xFFFFAE00),
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: height * 0.01),
                            child: const Text(
                              "upi@bank",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            if (ZoomDrawer.of(context)!.isOpen()) {
                              ZoomDrawer.of(context)!.toggle();
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.home,
                                  color: Color(0xFFFFAE00),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Finance");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/finance.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Finance",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Essentials");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/essential.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Essentials",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Travel");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/travel.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Travel",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Personal Security");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/personal_security.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Personal Security",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Device Security");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/device_security.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Device Security",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Value Addition");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/valueaddition.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Value Addition",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Entertainment");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/entertainment.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Entertainment",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Offer");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/offers.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Offer",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Games");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/games.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Games",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Wallet");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                /*Image(
                                  image: AssetImage("images/w"),
                                  width: 24.0,
                                  height: 24.0,
                                ),*/
                                Icon(Icons.account_balance_wallet, color: Color(0xFFFFAE00),),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Wallet",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const CashbackScreen()));
                            // _alertDialog();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/cashback.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Cashback & Deals",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const ReferAndEarnScreen()));
                            // _alertDialog();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/refer.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Refer & Earn",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Settings");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.settings,
                                  color: Color(0xFFFFAE00),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Setting",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 22,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }

  void _navigate(String name) {
    if (ZoomDrawer.of(context)!.isOpen()) {
      ZoomDrawer.of(context)!.toggle();
    }
    if (name == "Essentials") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const EssentialsScreen()));
    } else if (name == "Settings") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen("Customer")));
    }else if (name == "Offer") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => OfferScreen()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AllOptions(name)));
    }
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
