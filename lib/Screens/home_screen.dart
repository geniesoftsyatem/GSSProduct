import 'dart:io';

import 'package:android_intent_plus/android_intent.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_apps/device_apps.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/bank_service.dart';
import 'package:genie_money/Screens/distributor_retailer_screen.dart';
import 'package:genie_money/Screens/essentials_screen.dart';
import 'package:genie_money/Screens/bill_payment_screen.dart';
import 'package:genie_money/Screens/offer_screen.dart';
import 'package:genie_money/Screens/portfolio.dart';
import 'package:genie_money/Screens/qr_code_scanner_screen.dart';
import 'package:genie_money/Screens/recharge_and_bill_payment_screen.dart';
import 'package:genie_money/Screens/sales_partner_screen.dart';
import 'package:genie_money/Screens/settings_screen.dart';
import 'package:genie_money/Screens/sub_catagories_screen.dart';
import 'package:genie_money/Screens/sub_sub_categories_screen.dart';
import 'package:genie_money/Screens/wallet_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'balance_inquiry_screen.dart';
import 'cash_withdrawal_screen.dart';
import 'credit_score_screen.dart';
import 'credit_to_bank.dart';
import 'essential_details_screen.dart';
import 'install_screen.dart';
import 'mini_statement_screen.dart';
import 'money_transfer.dart';
import 'optionsfile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomeClass();
  }
}

class MyHomeClass extends State<HomeScreen> {
  int _currentPosition = 0;
  String _result = "";

  late bool _load = true;
  late List<HomePageList> homepageList = [];
  var type;

  List<String> imgList = [
    "images/banner1.png",
    "images/banner2.png",
    "images/banner3.png",
    "images/banner4.png"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  Future<void> _check_preference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = prefs.get("type") ?? "Customer";

    });
  }

  @override
  void initState() {
    _check_preference().then((value) => {
      if (type == "Customer")
            {
              homepageList = [
                HomePageList(
                    id: "1", name: "Finance", image: "images/finance.png"),
                HomePageList(
                    id: "2", name: "Essentials", image: "images/essential.png"),
                HomePageList(
                    id: "7",
                    name: "Travel",
                    image: "images/travel.png"),
                HomePageList(
                    id: "3",
                    name: "Personal Security",
                    image: "images/personal_security.png"),
                HomePageList(
                    id: "4",
                    name: "Device Security",
                    image: "images/device_security.png"),
                /*HomePageList(
                    id: "3", name: "Personal Security", image: "images/personal_security.png"),*/
                HomePageList(
                    id: "6",
                    name: "Entertainment",
                    image: "images/entertainment.png"),
                HomePageList(
                    id: "7",
                    name: "Offer",
                    image: "images/offers.png"),
                HomePageList(
                    id: "5",
                    name: "Value Addition",
                    image: "images/valueaddition.png"),
                HomePageList(
                    id: "8",
                    name: "Games",
                    image: "images/games.png"),

              ]
            }else if(type == "Retailer" || type == "Distributor" || type == "Super Distributor"){
                  homepageList = [
                    /*HomePageList(
                        id: "1",
                        name: "Generate Code",
                        image: "images/generate_code.png"),
                    HomePageList(
                        id: "2",
                        name: "Apps History",
                        image: "images/app_history.png"),*/
                    HomePageList(
                        id: "1", name: "Finance Services", image: "images/finance.png"),
                    HomePageList(
                        id: "2", name: "Essentials Services", image: "images/essential.png"),
                    HomePageList(
                        id: "7",
                        name: "Travel Booking Services",
                        image: "images/travel.png"),
                    HomePageList(
                        id: "4",
                        name: "Digital Security Services",
                        image: "images/device_security.png"),
                    HomePageList(
                        id: "5",
                        name: "Value Addition Services",
                        image: "images/valueaddition.png"),
                    HomePageList(
                        id: "6",
                        name: "Entertainment Service",
                        image: "images/entertainment.png"),
                    HomePageList(
                        id: "3",
                        name: "Advertisment Services",
                        image: "images/advertisement.png"),
                    /*HomePageList(
                        id: "3",
                        name: "Add Portfolio",
                        image: "images/profolio.png"),*/
                    HomePageList(
                        id: "5", name: "Employee", image: "images/retailer.png"),
                    /*HomePageList(
                        id: "6", name: "Money Transfer", image: "images/money_transfer.png"),
                    HomePageList(
                        id: "7", name: "Scan To Pay", image: "images/scantopay_gm.png"),
                    HomePageList(
                        id: "8", name: "Recharge and Bill Payment", image: "images/recharge_and_bill.png"),
                    HomePageList(
                        id: "16", name: "Financial Calculator", image: "images/finance_calculator.png"),*/

                    ]
            }
         /* else if (type == "Retailer")
            {
              {
                homepageList = [
                  HomePageList(
                      id: "1",
                      name: "Generate Code",
                      image: "images/generate_code.png"),
                  HomePageList(
                      id: "2",
                      name: "Apps History",
                      image: "images/app_history.png"),
                  HomePageList(
                      id: "3",
                      name: "Add Portfolio",
                      image: "images/profolio.png"),
                  HomePageList(
                      id: "5", name: "Employee", image: "images/retailer.png")
                ]
              }
            }
          else if (type == "Distributor")
            {
              homepageList = [
                HomePageList(
                    id: "1",
                    name: "Generate Code",
                    image: "images/generate_code.png"),
                HomePageList(
                    id: "2",
                    name: "Apps History",
                    image: "images/app_history.png"),
                HomePageList(
                    id: "3",
                    name: "Add Portfolio",
                    image: "images/profolio.png"),
                HomePageList(
                    id: "5", name: "Retailer", image: "images/retailer.png")
              ]
            }*/
          else
            {
              homepageList = [
                HomePageList(
                    id: "1",
                    name: "Generate Code",
                    image: "images/generate_code.png"),
                HomePageList(
                    id: "2",
                    name: "Apps History",
                    image: "images/app_history.png"),
                HomePageList(
                    id: "3",
                    name: "Add Portfolio",
                    image: "images/profolio.png"),
                HomePageList(
                    id: "5", name: "Distributor", image: "images/retailer.png")
              ]
            },
          _showUi(),
        });
    // _load = false;
    super.initState();
  }

  _showUi() {
    setState(() {
      _load = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: type == "Customer"
          ? AppBar(
              backgroundColor: const Color(0xFF3A3A3A),
              title: const Text(
                "Genie Money",
                style: TextStyle(color: Color(0xFFFFAE00)),
              ),
              leading: InkWell(
                onTap: () => ZoomDrawer.of(context)!.toggle(),
                child: const Icon(
                  Icons.sort,
                  color: Color(0xFFFFAE00),
                ),
              ),
              actions: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                      onTap: () async {
                        String? result = await showSearch(
                            context: context, delegate: DataSearch());
                        if (result! == "Essentials" ) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const EssentialsScreen()));
                        }else if(result == "Essentials Services"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const EssentialsScreen()));
                        } else if (result == "Finance" ||
                            result == "Personal Security" ||
                            result == "Digit Security" ||
                            result == "Value Addition" ||
                            result == "Entertainment" ||
                            /*result == "Privilage Offer" ||*/
                            result == "Games") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllOptions(result)));
                        }else if (result == "Finance Services" ||
                            result == "Digital Security Services" ||
                            result == "Value Added Services") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllOptions(result)));
                        } else if (result == "Money Transfer") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MoneyTransfer(fromScreen: result,)));
                        } else if (result == "Recharge and Bill Payment") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const RechargeAndBillPayment()));
                        } else if (result == "Credit Score") {
                          Route route = MaterialPageRoute(
                              builder: (context) => const CreditScoreScreen());
                          Navigator.push(context, route);
                        } else if (result == "Financial Calculator") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.financecalculator");
                          if (installed) {
                            launchNativeActivity(result);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => InstallApps(result)));
                          }
                        } else if(result == "Credit Card to Bank A/C"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const CreditToBank()));
                        } else if(result == "Balance Inquiry"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BalanceInquiry()));
                        } else if(result == "Cash Withdrawal"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CashWithdrawalScreen()));
                        } else if(result == "Mini Statement"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MiniStatementScreen()));
                        } else if (result == "Mobile Prepaid" || result == "DTH" || result == "Electricity" ||
                            result == "GAS" || result == "Water" || result == "Landline Postpaid" ||
                            result == "BroadBand Postpaid" || result == "Mobile Postpaid") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) =>
                              BillPaymentScreen(result)));
                        } else if (result == "AC/ Appliance Repair") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubCatagoriesScreen(result)));
                        } else if (result == "General Store") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubSubCategoriesScreen(result)));
                        } else if (result == "Dmart" || result == "Big Bazzar" || result == "Metro Mall" ||
                            result == "Harbans Karyana Store" || result == "Atharva Enterprises" ||
                            result == "Pawan Enterprises") {
                          Route route = MaterialPageRoute(
                              builder: (context) =>
                                  EssentialDetailsScreen(result, result == "Dmart" ? 5.0 :
                                  result == "Big Bazzar" ? 4.5 : result == "Metro Mall" ? 4.0 :
                                  result == "Harbans Karyana Store" ? 3.5 : result == "Atharva Enterprises" ? 4.5 : result == "Pawan Enterprises" ? 3.5 : 0.0));
                          Navigator.push(context, route);
                        } else if (result == "Air Conditioner") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubSubCategoriesScreen(result)));
                        } else if (result == "Spy Camera" || result == "Life Saver" || result == "Secure Chat" ||
                            result == "Anti Hacking" || result == "Anti Virus" || result == "Anti Theft" ||
                            result == "Wi-Fi Protect") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.genieshield");
                          if (installed) {
                            launchNativeActivity(result);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(result)));
                          }
                        }else if(result == "Offer"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => OfferScreen()));
                        } else if (result == "Education" || result == "Jobs") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.education");
                          if (installed) {
                            launchNativeActivity(result);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(result)));
                          }
                        } else if (result == "Health / Fitness") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.gssfitness");
                          if (installed) {
                            launchNativeActivity(result);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(result)));
                          }
                        } else if (result == "YouTube Video") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.vanced.android.youtube");
                          if (installed) {
                            DeviceApps.openApp("com.vanced.android.youtube");
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(result)));
                          }
                        } else if (result == "YouTube Music") {
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
                                        InstallApps(result)));
                          }
                        } else if (result == "OTT") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                  const OTTScreen()));
                        } else if (result == "YouTube Download" || result == "News Channels" ||
                            result == "Other Channels") {
                          bool installed = await DeviceApps.isAppInstalled(
                              "com.gss.entertainment");
                          if (installed) {
                            launchNativeActivity(result);
                          } else {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InstallApps(result)));
                          }
                        } else {
                          _alertDialog(context);
                        }


                      },
                      child: const Icon(Icons.search,
                          size: 26.0, color: Color(0xFFFFAE00)),
                    )
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  WalletScrreen()));
                    },
                    child: const Icon(
                      Icons.account_balance_wallet,
                      color: Color(0xFFFFAE00),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.notifications,
                      color: Color(0xFFFFAE00),
                    ),
                  ),
                ),
              ],
            )
          : AppBar(
              backgroundColor: const Color(0xFF3A3A3A),
              title: type == null
                  ? const Text("")
                  : Text(
                      "Genie Money - " + type,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                    ),
              actions: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SettingsScreen(type)));
                    },
                    child: const Icon(
                      Icons.settings,
                      color: Color(0xFFFFAE00),
                    ),
                  ),
                ),
              ],
            ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: type == "Customer" ? true : false,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: height * 0.25,
                          viewportFraction: 0.85,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(seconds: 3),
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _currentPosition = index;
                            });
                          },
                        ),
                        items: imgList
                            .map(
                              (e) => ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Stack(
                                  fit: StackFit.expand,
                                  children: <Widget>[
                                    InkWell(
                                      child: Image(
                                        image: AssetImage(e),
                                        width: width,
                                        height: height,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: map<Widget>(
                        imgList,
                        (index, url) {
                          return Container(
                            width: 5.0,
                            height: 5.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentPosition == index
                                  ? const Color(0xFFFFAE00)
                                  : Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: type == "Customer" ? false : true,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Color(0xFF3A3A3A),
                        ),
                        color: Color(0xFF3A3A3A),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: const EdgeInsets.all(10.0),
                    margin: const EdgeInsets.only(top: 10.0),
                    width: width,
                    child: const Center(
                      child: Text(
                        "Balance : "+"\u20B9" +"405",
                        style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: _load
                    ? Center(
                        child: Container(
                          color: const Color(0xFF111111),
                          width: width,
                          height: 70.0,
                          child: const Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xFFFFAE00)),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            GridView.count(
                              crossAxisCount: 3,
                              childAspectRatio: width / 450,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: homepageList.map((e) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (e.name == "Retailer" ||
                                        e.name == "Distributor" ||
                                        e.name == "Employee") {
                                      ZoomDrawer.of(context)!.isOpen()
                                          ? ZoomDrawer.of(context)!.toggle()
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RetailerScreen(
                                                          e.name, type)));
                                    } else if (e.name == "Add Portfolio") {
                                      ZoomDrawer.of(context)!.isOpen()
                                          ? ZoomDrawer.of(context)!.toggle()
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PortfolioScreen(type)));
                                    } else if (e.name == "Generate Code" ||
                                        e.name == "Apps History" ||
                                        e.name == "Advertisement" ) {
                                      ZoomDrawer.of(context)!.isOpen()
                                          ? ZoomDrawer.of(context)!.toggle()
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SalesPartnerScreen(
                                                          e.name)));
                                    } else if (e.name == "Essentials" || e.name == "Essentials Services") {
                                      ZoomDrawer.of(context)!.isOpen()
                                          ? ZoomDrawer.of(context)!.toggle()
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const EssentialsScreen()));
                                    }
                                      else if (e.name == "Recharge and Bill Payment") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              const RechargeAndBillPayment()));
                                    }    else if (e.name == "Financial Calculator") {
                                      bool installed = await DeviceApps.isAppInstalled(
                                          "com.gss.financecalculator");
                                      if (installed) {
                                        launchNativeActivity(e.name);
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    InstallApps(e.name)));
                                      }
                                    }  else if (e.name == "Money Transfer") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MoneyTransfer(fromScreen: e.name,)));
                                    }else if (e.name == "Payment") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => MoneyTransfer(fromScreen: e.name,)));
                                    }else if (e.name == "Scan To Pay") {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => QRCodeScannerScreen()));

                                    }else if(e.name == "Advertisment Services"){
                                        _alertDialog(context);
                                    }else if(e.name == "Offer"){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => OfferScreen()));
                                    }
                                    else {
                                      ZoomDrawer.of(context)!.isOpen()
                                          ? ZoomDrawer.of(context)!.toggle()
                                          : Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AllOptions(e.name)));
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
                                    // margin: const EdgeInsets.symmetric(
                                    //     vertical: 10.0, horizontal: 10.0),
                                    color: const Color(0xFF444444),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Ink(
                                            decoration: const BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x63FFAE00),
                                                  blurRadius: 30.0,
                                                  spreadRadius: 5.0,
                                                ),
                                              ],
                                            ),
                                            child: Image(
                                              image: AssetImage(e.image),
                                              width: 60.0,
                                              height: 60.0,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                top: 10,
                                                left: 5.0,
                                                right: 5.0,
                                                bottom: 5.0),
                                            child: Text(
                                              e.name,
                                              style: const TextStyle(
                                                color: Color(0xFFFFAE00),
                                                fontSize: 15.0,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
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

  Future _alertDialog(BuildContext context) {
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

class DataSearch extends SearchDelegate<String> {
  final services = [
    "Finance",
    "Essentials",
    "Personal Security",
    "Digit Security",
    "Value Addition",
    "Entertainment",
    "Privilage Offer",
    "Games",
    "Money Transfer",
    "Instant Loan",
    "Consumer Loan",
    "Insurance",
    "Investment",
    "Stock & IPOs",
    "Recharge and Bill Payment",
    "Credit Score",
    "Digi Locker",
    "Financial Calculator",
    "Credit Card to Bank A/C",
    "Balance Inquiry",
    "Cash Withdrawal",
    "Mini Statement",
    "Micro ATM",
    "Mobile Prepaid",
    "DTH",
    "Electricity",
    "GAS",
    "Water",
    "BroadBand Prepaid",
    "Landline Postpaid",
    "BroadBand Postpaid",
    "Mobile Postpaid",
    "General Store",
    "Vegetable Vendor",
    "AC / Appliance Repair",
    "Electricians",
    "Plumber",
    "Carpenter",
    "Car / Bike Mechanic",
    "Cleaning",
    "Tutor",
    "Maid",
    "Laundry",
    "Cable Vendor",
    "Saloon, Spa, Massage",
    "Home Painting",
    "Pest Control",
    "Medicine Shop",
    "Emergency",
    "Gas / Cylinder Vendor",
    "Internet Provider",
    "Restaurants",
    "Gardener",
    "Dmart",
    "Big Bazzar",
    "Metro Mall",
    "Harbans Karyana Store",
    "Air Conditioner",
    "Chimney",
    "Geyser",
    "Microwave",
    "Television",
    "Washing Machine",
    "Water Purifier",
    "Atharva Enterprises",
    "Pawan Enterprises",
    "Spy Camera",
    "Life Saver",
    "Secure Chat",
    "Anti Hacking",
    "Anti Virus",
    "Anti Theft",
    "Wifi Protect",
    "Education",
    "Health / Fitness",
    "Jobs",
    "YouTube Video",
    "YouTube Music",
    "YouTube Download",
    "News Channels",
    "Other Channels",
    "Facebook Video",
    "OTT"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for the app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of app bar
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when some one searches for something
    final suggestionList = query.isEmpty
        ? services
        : services
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          Navigator.of(context).pop(suggestionList[index]);
        },
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color(0xFF3A3A3A),
        );
      },
    );
  }
}
