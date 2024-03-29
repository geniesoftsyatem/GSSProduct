import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/cowin_screen.dart';
import 'package:genie_money/Screens/credit_score_screen.dart';
import 'package:genie_money/Screens/digital_security_detail_screen.dart';
import 'package:genie_money/Screens/insurance_screen.dart';
import 'package:genie_money/Screens/investment_services.dart';
import 'package:genie_money/Screens/loan_service.dart';
import 'package:genie_money/Screens/offer_screen.dart';
import 'package:genie_money/Screens/qr_code_scanner_screen.dart';
import 'package:genie_money/Screens/recharge_and_bill_payment_screen.dart';
import 'package:genie_money/Screens/web_view_screen.dart';
import 'package:genie_money/utils/silver_delegate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/ott_model.dart';
import 'bank_service.dart';
import 'install_screen.dart';
import 'money_transfer.dart';

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
    if (option.endsWith("Travel") ||
        option.endsWith("Travel Booking Services")) {
      homepageList = [
        HomePageList(id: "1", name: "Aeroplane", image: "images/aeroplane.png"),
        HomePageList(id: "2", name: "Hotel", image: "images/hotel_gs.png"),
        HomePageList(id: "3", name: "Train", image: "images/train_gs.png"),
        HomePageList(id: "4", name: "Cabs", image: "images/car.png"),
        HomePageList(id: "5", name: "Bus", image: "images/bus.png"),
      ];
    } else if (option.endsWith("Finance")) {
      homepageList = [
        HomePageList(
            id: "6", name: "Payments", image: "images/money_transfer.png"),
        HomePageList(
            id: "8",
            name: "Recharge/Bill Payment",
            image: "images/recharge_and_bill.png"),
        HomePageList(
            id: "10", name: "Loans", image: "images/consumer_loan.png"),
        /*HomePageList(
            id: "9", name: "Instant Loan", image: "images/instant_loan.png"),
        HomePageList(
            id: "10", name: "Consumer Loans", image: "images/consumer_loan.png"),*/
        HomePageList(
            id: "11", name: "Insurance", image: "images/insurance.png"),
        HomePageList(
            id: "12", name: "Investments", image: "images/investment.png"),
        /*HomePageList(
            id: "13", name: "Stock & IPOs", image: "images/stock.png"),*/
        HomePageList(
            id: "14", name: "Credit Score", image: "images/cerdit_score.png"),
        HomePageList(
            id: "15", name: "Digi Locker", image: "images/digi_locker.png"),
        HomePageList(
            id: "16",
            name: "Financial Calculator",
            image: "images/finance_calculator.png")
      ];
    } else if (option.endsWith("Finance Services")) {
      homepageList = [
        HomePageList(
            id: "6",
            name: "Money Transfer",
            image: "images/money_transfer.png"),
        HomePageList(
            id: "7", name: "Bank Services", image: "images/bank_details.png"),
        /*HomePageList(
            id: "7", name: "Scan To Pay", image: "images/scantopay_gm.png"),*/
        HomePageList(
            id: "8",
            name: "Recharge/Bill Payment",
            image: "images/recharge_and_bill.png"),
        HomePageList(id: "9", name: "Loans", image: "images/instant_loan.png"),
        /*HomePageList(
            id: "9", name: "Instant Loan", image: "images/instant_loan.png"),
        HomePageList(
            id: "10", name: "Consumer Loans", image: "images/consumer_loan.png"),*/
        HomePageList(
            id: "11", name: "Insurance", image: "images/insurance.png"),
        HomePageList(
            id: "12", name: "Investments", image: "images/investment.png"),
        /* HomePageList(
            id: "13", name: "Stock & IPOs", image: "images/stock.png"),
        HomePageList(
            id: "14", name: "Credit Score", image: "images/cerdit_score.png"),
        HomePageList(
            id: "15", name: "Digi Locker", image: "images/digi_locker.png"),*/
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
    } else if (option.endsWith("Device Security") ||
        option.endsWith("Digital Security Services")) {
      homepageList = [
        HomePageList(
            id: "20", name: "Anti Hacking", image: "images/anti_hacking.png"),
        /*HomePageList(
            id: "21", name: "Anti Virus", image: "images/anitvirus.png"),*/
        HomePageList(
            id: "22", name: "Anti Theft", image: "images/anittheft.png"),
        HomePageList(
            id: "23",
            name: "Wi-Fi Protect",
            image: "images/wifi_protection.png")
      ];
    } else if (option.endsWith("Entertainment") ||
        option.endsWith("Entertainment Service")) {
      homepageList = [
        HomePageList(
            id: "24", name: "YouTube Video", image: "images/youtube_video.png"),
        HomePageList(
            id: "8", name: "YouTube Music", image: "images/youtube_music.png"),
        HomePageList(
            id: "25",
            name: "YouTube Download",
            image: "images/youtube_download.png"),
        HomePageList(
            id: "26", name: "News Channels", image: "images/valueaddition.png"),
        HomePageList(
            id: "27",
            name: "Other Channels",
            image: "images/other_channel.png"),
        HomePageList(
            id: "28",
            name: "Facebook video downloader",
            image: "images/facebook_video_downloader.png"),
        HomePageList(id: "29", name: "OTT", image: "images/ott.png")
      ];
    } else if (option.endsWith("Value Addition") ||
        option.endsWith("Value Addition Services")) {
      homepageList = [
        HomePageList(
            id: "30", name: "Education", image: "images/education.png"),
        HomePageList(
            id: "31", name: "Health / Fitness", image: "images/fitness.png"),
        HomePageList(id: "32", name: "Jobs", image: "images/jobs.png"),
        HomePageList(id: "35", name: "CoWIN", image: "images/cowinlogo.png")
      ];
    } else if (option.endsWith("Privilage Offer")) {
      homepageList = [
        /*HomePageList(
            id: "33",
            name: "Accidental Insurance",
            image: "images/accidental_insurance.png"),*/
        /*HomePageList(
            id: "8",
            name: "COVID-19 Insurance",
            image: "images/covid_insurance.png"),*/
        HomePageList(id: "34", name: "Offers", image: "images/offers.png"),
        /*HomePageList(
            id: "35", name: "CoWIN", image: "images/cowinlogo.png")*/
      ];
    } else if (option.endsWith("Games")) {
      homepageList = [
        HomePageList(
            id: "7",
            name: "I Have To Fly",
            image: "images/i_have_to_fly_icon.png"),
        HomePageList(
            id: "8",
            name: "Space Shooter",
            image: "images/space_shooter_icon.png"),
        HomePageList(
            id: "24",
            name: "Flying Fish",
            image: "images/flying_fish_icon.png"),
        HomePageList(
            id: "25",
            name: "Plane Shooter",
            image: "images/plane_shooter_icon.png"),
        HomePageList(id: "25", name: "Ludo", image: "images/ludo_gs.png")
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
                      onTap: () async {
                        if (homepageList[index].name == "Hotel") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://www.goibibo.com/hotels/", "Hotel"));
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Aeroplane") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://www.goibibo.com/flights/",
                                  "Aeroplane"));
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Bus") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://www.goibibo.com/bus/", "Bus"));
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Train") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://www.goibibo.com/trains/", "Train"));
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Cabs") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://www.goibibo.com/cars/", "Cabs"));
                          Navigator.of(context).push(route);
                        } else if (homepageList[index].name == "Digi Locker") {
                          Route route = MaterialPageRoute(
                              builder: (context) => WebViewScreen(
                                  "https://accounts.digilocker.gov.in/signin/smart_v2/cbf21f85030e4d26e590207443947a9f--en",
                                  "Digi Locker"));
                          Navigator.push(context, route);
                        } else if (homepageList[index].name ==
                            "I Have To Fly") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.heyletscode.ihavetofly");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                            /*Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DigitalSecurityDetailScren(name:homepageList[index].name)));*/
                          }
                        } else if (homepageList[index].name ==
                            "Space Shooter") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.spaceshooter");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Flying Fish") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.salinda.flyingfishgame");
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
                            "Plane Shooter") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.planeshooter");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Ludo") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.myludogame");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Credit Score") {
                          Route route = MaterialPageRoute(
                              builder: (context) => const CreditScoreScreen());
                          Navigator.push(context, route);
                        } else if (homepageList[index].name ==
                            "Recharge/Bill Payment") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RechargeAndBillPayment()));
                        } else if (homepageList[index].name ==
                            "Accidental Insurance") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      InsuranceScreen("Accidental Insurance")));
                        } else if (homepageList[index].name ==
                            "COVID-19 Insurance") {
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
                           /* Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));*/
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DigitalSecurityDetailScren( name: homepageList[index].name,)));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTTScreen()));
                        } else if (homepageList[index].name ==
                                "YouTube Download" ||
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
                        } else if (homepageList[index].name ==
                            "Financial Calculator") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.financecalculator");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Education" ||
                            homepageList[index].name == "Jobs") {
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
                        } else if (homepageList[index].name ==
                            "Money Transfer") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoneyTransfer(
                                        fromScreen: homepageList[index].name,
                                      )));
                        } else if (homepageList[index].name == "Payments") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoneyTransfer(
                                        fromScreen: homepageList[index].name,
                                      )));
                        } else if (homepageList[index].name == "Scan To Pay") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRCodeScannerScreen()));
                        } else if (homepageList[index].name == "Offers") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OfferScreen()));
                        } else if (homepageList[index].name == "CoWIN") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CowinScreen()));
                        } else if (homepageList[index].name ==
                            "Health / Fitness") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.gssfitness");
                          if (installed) {
                            launchNativeActivity(homepageList[index].name);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(homepageList[index].name)));
                          }
                        } else if (homepageList[index].name == "Bank Services") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BankServices()));
                        } else if (homepageList[index].name == "Loans") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoanService()));
                        } else if (homepageList[index].name == "Investments") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InvestmentServices()));
                        } else {
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
    var userid = prefs.getString('userid') ?? '';
    var name = prefs.getString('name') ?? '';
    var email = prefs.getString('email') ?? '';
    var phone = prefs.getString('phone') ?? '';

    final Map<String, String> someMap = {
      "activity": pageName,
      "userid": userid,
      "name": name,
      "email": email,
      "phone": phone
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
        bool isInstalled = await DeviceApps.isAppInstalled('com.gss.education');
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
        bool isInstalled = await DeviceApps.isAppInstalled('com.gss.education');
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
      } else if (pageName == "Health / Fitness") {
        bool isInstalled = await DeviceApps.isAppInstalled('com.gss.education');
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
      } else if (pageName == "Financial Calculator") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.financecalculator');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.financecalculator',
            componentName: 'com.gss.financecalculator.activity.MainActivity',
            data: 'com.gss.financecalculator',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "I Have To Fly") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.heyletscode.ihavetofly');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.heyletscode.ihavetofly',
            componentName: 'com.heyletscode.ihavetofly.MainActivity',
            data: 'com.heyletscode.ihavetofly',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "Space Shooter") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.spaceshooter');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.spaceshooter',
            componentName: 'com.gss.spaceshooter.StartUp',
            data: 'com.gss.spaceshooter',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "Flying Fish") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.salinda.flyingfishgame');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.salinda.flyingfishgame',
            componentName: 'com.gss.salindia.flyingfishgame.SplashActivity',
            data: 'com.gss.salinda.flyingfishgame',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "Plane Shooter") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.planeshooter');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.planeshooter',
            componentName: 'com.gss.planeshooter.MainActivity',
            data: 'com.gss.planeshooter',
            arguments: someMap,
          );
          await intent.launch();
        } else {
          print("not installed");
        }
      } else if (pageName == "Ludo") {
        bool isInstalled =
            await DeviceApps.isAppInstalled('com.gss.myludogame');
        if (isInstalled == true) {
          AndroidIntent intent;
          intent = AndroidIntent(
            action: 'android_send',
            package: 'com.gss.myludogame',
            componentName: 'com.gss.myludogame.MainActivity',
            data: 'com.gss.myludogame',
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

class OTTScreen extends StatefulWidget {
  const OTTScreen({Key? key}) : super(key: key);

  @override
  State<OTTScreen> createState() => _OTTScreenState();
}

class _OTTScreenState extends State<OTTScreen> {
  late List<OTTModel> ottList;

  @override
  void initState() {
    ottList = [
      OTTModel(
          "7", "Netflix", "images/netflix_gs1.png", "com.netflix.mediaclient"),
      OTTModel("8", "Amazon Prime", "images/primvideo_gs2.png",
          "com.amazon.avod.thirdpartyclient"),
      OTTModel("9", "Disney+ Hotstar", "images/disney_hotstar_gs3.png",
          "in.startv.hotstar"),
      OTTModel("10", "Sony Liv", "images/sonyliv-gs4.png", "com.sonyliv"),
      OTTModel("11", "Zee 5", "images/zee5_gs5.png", "com.graymatrix.did"),
      OTTModel("12", "Voot", "images/voot_gs6.png", "com.tv.v18.viola"),
      OTTModel("13", "MX Player", "images/mx_player_gs7.png",
          "com.mxtech.videoplayer.ad"),
      OTTModel(
          "14", "ALT Balaji", "images/alt_balaji_gs8.png", "com.balaji.alt"),
      OTTModel("15", "TVF Play", "images/tvf_gs9.png", "com.tvf.tvfplay"),
      OTTModel("16", "Eros Now", "images/erosnow_gs10.png", "com.erosnow"),
      OTTModel("16", "Jio Cinema", "images/jiocinema_gs11.png",
          "com.jio.media.ondemand"),
      OTTModel("16", "Airtel XStream", "images/airtel_xstream_gs12.png",
          "tv.accedo.airtel.wynk")
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "OTT",
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
                margin: const EdgeInsets.only(top: 10.0),
                child: GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 3,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    height: height * 0.25,
                  ),
                  itemCount: ottList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        bool isInstalled = await DeviceApps.isAppInstalled(
                            ottList[index].packageName);
                        if (isInstalled) {
                          DeviceApps.openApp(ottList[index].packageName);
                        } else {
                          launch(
                              "https://play.google.com/store/apps/details?id=${ottList[index].packageName}");
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
                                  image: AssetImage(ottList[index].image),
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0),
                                child: Text(
                                  ottList[index].name,
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
}
