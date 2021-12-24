import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/payment_screen.dart';
import 'package:genie_money/utils/silver_delegate.dart';

class RechargeAndBillPayment extends StatefulWidget {
  const RechargeAndBillPayment({Key? key}) : super(key: key);

  @override
  _RechargeAndBillPaymentState createState() => _RechargeAndBillPaymentState();
}

class _RechargeAndBillPaymentState extends State<RechargeAndBillPayment> {
  late List<HomePageList> homepageList;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void initState() {
    // TODO: implement initState
    homepageList = [
      HomePageList(
          id: "7",
          name: "Mobile Prepaid",
          image: "images/mobile_prepaid.png"),
      HomePageList(
          id: "8", name: "DTH", image: "images/dth.png"),
      HomePageList(
          id: "9", name: "Electricity", image: "images/electricity.png"),
      HomePageList(
          id: "10", name: "GAS", image: "images/gas.png"),
      HomePageList(
          id: "11", name: "Water", image: "images/water.png"),
      HomePageList(id: "12", name: "BroadBand Prepaid", image: "images/boardband_prepaid.png"),
      HomePageList(
          id: "13",
          name: "Landline Postpaid",
          image: "images/landline_postpaid.png"),
      HomePageList(
          id: "14", name: "BroadBand Postpaid", image: "images/boardband_prepaid.png"),
      HomePageList(
          id: "15", name: "Mobile Postpaid", image: "images/mobile_prepaid.png")
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "Recharge and Bill Payment",
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
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        if(homepageList[index].name == "BroadBand Prepaid") {
                          _alertDialog();
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentScreen(homepageList[index].name)));
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
}
