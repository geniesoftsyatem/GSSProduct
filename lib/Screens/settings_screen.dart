import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/profile_settings_screen.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/utils/silver_delegate.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatefulWidget {

  String title;

  SettingsScreen(this.title, {Key? key}) : super(key: key);

  @override
  State createState() {
    return _SettingsScreen();
  }
}

class _SettingsScreen extends State<SettingsScreen> {
  late List<HomePageList> homepageList;
  late String version = "";
  late List<String> languages = [
    "English",
    "मराठी",
    "हिन्दी",
    "ગુજરાતી",
    "ਪੰਜਾਬੀ",
    "ಕನ್ನಡ",
    "తెలుగు",
    "தமிழ்",
    "മലയാളം",
    "বাংলা",
    "ଓଡିଆ",
  ];

  @override
  void initState() {
    // TODO: implement initState
    if(widget.title == "Customer") {
      homepageList = [
        HomePageList(
            id: "7",
            name: "Profile Setting",
            image: "images/profile_setting.png"),
        HomePageList(
            id: "8",
            name: "Payment Setting",
            image: "images/payment_setting.png"),
        HomePageList(
            id: "9",
            name: "Change Language",
            image: "images/change_language.png"),
        HomePageList(id: "10", name: "Logout", image: "images/logout.png")
      ];
    } else if (widget.title == "Employee") {
      homepageList = [
        HomePageList(
            id: "7",
            name: "Change Password",
            image: "images/change_password.png"),
        HomePageList(
            id: "8",
            name: "Help",
            image: "images/help.png"),
        HomePageList(
            id: "9",
            name: "Change Language",
            image: "images/change_language.png"),
        HomePageList(id: "10", name: "Logout", image: "images/logout.png")
      ];
    } else {
      homepageList = [
        HomePageList(
            id: "7",
            name: "My Topup History",
            image: "images/topup_history.png"),
        HomePageList(
            id: "7",
            name: "Change Password",
            image: "images/change_password.png"),
        HomePageList(
            id: "8",
            name: "Help",
            image: "images/help.png"),
        HomePageList(
            id: "9",
            name: "Change Language",
            image: "images/change_language.png"),
        HomePageList(id: "10", name: "Logout", image: "images/logout.png")
      ];
    }

    super.initState();
  }

  Future<void> _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _getVersion();
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFAE00),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    height: height * 0.25,
                  ),
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: ()  {
                        if(homepageList[index].name == "Logout") {
                          _alertDialog("Logout", "Are you sure you want to logout");
                        } else if (homepageList[index].name == "Profile Setting") {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()));
                        } else if (homepageList[index].name == "Change Language") {
                          showSelectDialog(context, width, height);
                        } else {
                          _alertDialog("", "Coming Soon");
                        }
                      },
                      child: Card(
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            side: BorderSide(
                              color: Color(0xFFFFAE00),
                              width: 2.0,
                            )),
                        color: const Color(0xFF444444),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 20.0),
                                child: Image(
                                  image: AssetImage(homepageList[index].image),
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0),
                                child: Text(
                                  homepageList[index].name,
                                  style: const TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 15.0,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  "Version: " + version,
                  style: const TextStyle(
                    color: Color(0xFFFFAE00),
                    fontSize: 20.0
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget setupAlertDialoadContainer(double width, double height) {
    return Container(
      color: const Color(0xFF3A3A3A),
      height: width * 0.70, // Change as per your requirement
      width: height * 0.70, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: false,
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){
              Navigator.of(context).pop();
            },
            title: Text(languages[index], style: const TextStyle(
              color: Color(0xFFFFAE00)
            ),),
          );
        },
      ),
    );
  }

  Future showSelectDialog(BuildContext context, double width, double height) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xFF3A3A3A),
            title: const Text("Select Language", style: TextStyle(color: Color(0xFFFFAE00)),),
            content: setupAlertDialoadContainer(width, height),
          );
        }
    );
  }

  Future _alertDialog(String title, String message) {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: title,
          contentText: message,
          onPositiveClick: () async {
            if (title == "Logout") {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.clear();
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => SignInScreen("0"),
                ),
                    (route) => false,
              );
            } else {
              Navigator.of(context).pop();
            }
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}
