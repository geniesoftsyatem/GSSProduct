import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:genie_shield/utils/screen_sizes.dart';

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
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal! * 10;
    double height = SizeConfig.blockSizeVertical! * 10;
    return Scaffold(
      backgroundColor: const Color(0xFF444444),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: width * 3.5),
              height: height * 2.7,
              width: width * 20,
              child: DrawerHeader(
                child: Center(
                  child: Column(
                    children: [
                      const Center(
                        child: CircleAvatar(
                          child: Icon(
                            Icons.person,
                            color: Color(0xFFFFAE00),
                          ),
                          radius: 30,
                        ),
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(top: height / 10),
                            child: const Text(
                              "User Name",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: height / 10),
                            child: const Text(
                              "mobile number",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                      Center(
                        child: Container(
                          margin: EdgeInsets.only(top: height / 10),
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
                            _navigate("Privilage Offer");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/privilage_offer.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Privilage Offer",
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
                            _alertDialog();
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
                            _alertDialog();
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
                            _alertDialog();
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
                      SizedBox(
                        height: height,
                      ),
                      // Align(
                      //   alignment: FractionalOffset.bottomCenter,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(2.0),
                      //     child: InkWell(
                      //       onTap: () {
                      //         // _navigate("Privilage Offer");
                      //         _alertDialog();
                      //       },
                      //       child: Container(
                      //         margin: const EdgeInsets.only(left: 10.0),
                      //         child: Row(
                      //           children: const [
                      //             Icon(
                      //               Icons.logout,
                      //               color: Color(0xFFFFAE00),
                      //             ),
                      //             SizedBox(
                      //               width: 15,
                      //             ),
                      //             Text(
                      //               "Logout",
                      //               style: TextStyle(
                      //                 color: Color(0xFFFFAE00),
                      //                 fontSize: 22,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
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
     Navigator.push(context, MaterialPageRoute(builder: (context) => AllOptions(name)));
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
