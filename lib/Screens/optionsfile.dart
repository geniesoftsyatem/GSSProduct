import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/cowin_screen.dart';
import 'package:genie_money/Screens/credit_score_screen.dart';
import 'package:genie_money/Screens/insurance_screen.dart';
import 'package:genie_money/Screens/offer_screen.dart';
import 'package:genie_money/Screens/recharge_and_bill_payment_screen.dart';

import 'package:genie_money/utils/silver_delegate.dart';

import 'install_screen.dart';
import 'money_transfer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AllOptions extends StatefulWidget {
  String option;

  AllOptions(this.option, {Key? key}) : super(key: key);

  @override
  _ALlOptions createState() {
    // TODO: implement createState
    return _ALlOptions();
  }
}

class _ALlOptions extends State<AllOptions> {
  late List<HomePageList> homepageList;

  late String option = widget.option;

  @override
  void initState() {
    // TODO: implement initState
    if (option.endsWith("Finance")) {
      homepageList = [
        HomePageList(
            id: "7",
            name: "Money Transfer",
            image: "images/money_transfer.png"),
        HomePageList(
            id: "8", name: "Instant Loan", image: "images/instant_loan.png"),
        HomePageList(
            id: "9", name: "Consumer Loans", image: "images/consumer_loan.png"),
        HomePageList(
            id: "10", name: "Insurance", image: "images/insurance.png"),
        HomePageList(
            id: "11", name: "Investments", image: "images/investment.png"),
        HomePageList(id: "12", name: "Stock & IPOs", image: "images/stock.png"),
        HomePageList(
            id: "13",
            name: "Recharge and Bill Payment",
            image: "images/recharge_and_bill.png"),
        HomePageList(
            id: "14", name: "Credit Score", image: "images/cerdit_score.png"),
        HomePageList(
            id: "15", name: "Digi Locker", image: "images/digi_locker.png"),
        HomePageList(
            id: "16",
            name: "Financial Calculator",
            image: "images/finance_calculator.png")
      ];
    } else if (option.endsWith("Personal Security")) {
      homepageList = [
        HomePageList(
            id: "17", name: "Spy Camera", image: "images/spy_camera.png"),
        HomePageList(
            id: "18", name: "Life Saver", image: "images/life_saver.png"),
        HomePageList(
            id: "19", name: "Secure Chat", image: "images/secure_chat.png")
      ];
    } else if (option.endsWith("Device Security")) {
      homepageList = [
        HomePageList(
            id: "20", name: "Anti Hacking", image: "images/anti_hacking.png"),
        HomePageList(
            id: "21", name: "Anti Virus", image: "images/anitvirus.png"),
        HomePageList(
            id: "22", name: "Anti Theft", image: "images/anittheft.png"),
        HomePageList(
            id: "23",
            name: "Wi-Fi Protect",
            image: "images/wifi_protection.png")
      ];
    } else if (option.endsWith("Entertainment")) {
      homepageList = [
        HomePageList(
            id: "7", name: "YouTube Video", image: "images/youtube_video.png"),
        HomePageList(
            id: "8", name: "YouTube Music", image: "images/youtube_music.png"),
        HomePageList(
            id: "9",
            name: "YouTube Download",
            image: "images/youtube_download.png"),
        HomePageList(
            id: "10", name: "News Channels", image: "images/valueaddition.png"),
        HomePageList(
            id: "11",
            name: "Other Channels",
            image: "images/other_channel.png"),
        HomePageList(
            id: "12",
            name: "Facebook video downloader",
            image: "images/facebook_video_downloader.png"),
        HomePageList(id: "13", name: "OTT", image: "images/ott.png")
      ];
    } else if (option.endsWith("Value Addition")) {
      homepageList = [
        HomePageList(id: "7", name: "Education", image: "images/education.png"),
        HomePageList(id: "8", name: "Health / Fitness", image: "images/fitness.png"),
        HomePageList(id: "8", name: "Jobs", image: "images/jobs.png")
      ];
    } else if (option.endsWith("Privilage Offer")) {
      homepageList = [
        HomePageList(
            id: "7",
            name: "Accidental Insurance",
            image: "images/accidental_insurance.png"),
        /*HomePageList(
            id: "8",
            name: "COVID-19 Insurance",
            image: "images/covid_insurance.png"),*/
        HomePageList(
            id: "24",
            name: "Offers",
            image: "images/offers.png"),
        HomePageList(
            id: "25",
            name: "CoWIN",
            image: "images/cowinlogo.png")
      ];
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          option,
          style: const TextStyle(
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
                margin: const EdgeInsets.only(top: 10.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    height: height * 0.25,
                  ),
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (homepageList[index].name == "Credit Score") {
                          Route route = MaterialPageRoute(builder: (context) => const CreditScoreScreen());
                          Navigator.push(context, route);
                        } else if (homepageList[index].name == "Recharge and Bill Payment") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RechargeAndBillPayment()));
                        } else if (homepageList[index].name == "Accidental Insurance") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InsuranceScreen("Accidental Insurance")));
                        } else if (homepageList[index].name == "COVID-19 Insurance") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InsuranceScreen("COVID-19 Insurance")));
                        } else if (homepageList[index].name == "Spy Camera" ||
                            homepageList[index].name == "Life Saver" ||
                            homepageList[index].name == "Secure Chat" ||
                            homepageList[index].name == "Anti Hacking" ||
                            homepageList[index].name == "Anti Virus" ||
                            homepageList[index].name == "Anti Theft" ||
                            homepageList[index].name == "Wi-Fi Protect") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.genieshield");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name ==
                            "YouTube Video") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.vanced.android.youtube");
                          if (installed) {
                            DeviceApps.openApp("com.vanced.android.youtube");
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name ==
                            "YouTube Music") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.vanced.android.apps.youtube.music");
                          if (installed) {
                            DeviceApps.openApp(
                                "com.vanced.android.apps.youtube.music");
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "OTT") {
                          // bool installed = await DeviceApps.isAppInstalled(
                          //     "com.vanced.android.apps.youtube.music");
                          // if (installed) {
                          //   DeviceApps.openApp("com.vanced.android.apps.youtube.music");
                          // } else {
                          //
                          // }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InstallApps(homepageList[index].name)));
                        } else if (homepageList[index].name == "YouTube Download" ||
                            homepageList[index].name == "News Channels" ||
                            homepageList[index].name == "Other Channels") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.entertainment");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Education" || homepageList[index].name == "Jobs") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.education");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        }else if(homepageList[index].name == "Money Transfer"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MoneyTransfer()));
                        }else if(homepageList[index].name == "Offers"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      OfferScreen()));
                        }else if(homepageList[index].name == "CoWIN"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CowinScreen()));
                        }else if(homepageList[index].name == "Health / Fitness"){
                          bool installed = await DeviceApps.isAppInstalled("com.gss.gssfitness");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          }else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        }
                        else {
                          _alertDialog();
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

  void launchNativeActivity(String pageName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userid = prefs.getString('userid')?? '';
    var name = prefs.getString('name')?? '';
    var email = prefs.getString('email')?? '';
    var phone = prefs.getString('phone')?? '';

    final Map<String, String> someMap = {
      "activity" : pageName,
      "userid" : userid,
      "name" : name,
      "email" : email,
      "phone" : phone
      };

    if (Platform.isAndroid) {
      //DeviceApps.openApp('com.google.android.apps.nbu.paisa.user');
      if (pageName == "Spy Camera" ||
          pageName == "Life Saver" ||
          pageName == "Secure Chat" ||
          pageName == "Anti Hacking" ||
          pageName == "Anti Virus" ||
          pageName == "Anti Theft" ||
          pageName == "Wi-Fi Protect") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.genieshield');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.genieshield',
            componentName: 'com.gss.genieshield.Activity.PasscodeActivity',
            data: 'com.gss.genieshield',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "YouTube Download") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.entertainment');
        if (isInstalled) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.entertainment',
            componentName: 'com.gss.entertainment.Dashboard',
            data: 'com.gss.entertainment',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "News Channels") {
        bool isInstalled =
        await DeviceApps.isAppInstalled('com.gss.entertainment');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.entertainment',
            componentName: 'com.gss.entertainment.Dashboard',
            data: 'com.gss.entertainment',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "Other Channels") {
        bool isInstalled =
        await DeviceApps.isAppInstalled('com.gss.entertainment');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.entertainment',
            componentName: 'com.gss.entertainment.Dashboard',
            data: 'com.gss.entertainment',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "Jobs") {
        bool isInstalled =
        await DeviceApps.isAppInstalled('com.gss.education');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.education',
            componentName: 'com.gss.education.cbse.ui.Dashboard',
            data: 'com.gss.education',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if (pageName == "Education") {
        bool isInstalled =
        await DeviceApps.isAppInstalled('com.gss.education');
        if (isInstalled == true) {
          AndroidIntent intent;
          //if (pageName == "Anti Hacking") {

          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.education',
            componentName: 'com.gss.education.cbse.ui.EducationActivity',
            data: 'com.gss.education',
            arguments: someMap,
          );
          await intent.launch();
          //}
        } else {
          print("not installed");
        }
      } else if(pageName == "Health / Fitness"){
        bool isInstalled =
        await DeviceApps.isAppInstalled('com.gss.education');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.gssfitness',
            componentName: 'com.gss.gssfitness.ui.FitnessActivity',
            data: 'com.gss.education',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      }
    }
  }
}
