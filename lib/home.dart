import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:genie_shield/utils/screen_sizes.dart';

import 'Screens/home_screen.dart';
import 'Screens/menu_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  final drawerController = ZoomDrawerController();

  Future<bool> _onBackPressed() async {
    // Your back press code here...
    if (drawerController.isOpen!()) {
      drawerController.toggle!();
      return false;
    } else{
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = SizeConfig.blockSizeHorizontal! * 70;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        body: ZoomDrawer(
          controller: drawerController,
          style: DrawerStyle.Style1,
          menuScreen: const MenuScreen(),
          mainScreen: const HomeScreen(),
          borderRadius: 24.0,
          showShadow: true,
          angle: 0.0,
          backgroundColor: const Color(0xFF3A3A3A),
          slideWidth: width,
          openCurve: Curves.fastOutSlowIn,
          closeCurve: Curves.decelerate,
        ),
      ),
    );
  }
}
