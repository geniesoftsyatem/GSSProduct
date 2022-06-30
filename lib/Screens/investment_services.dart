import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/home_menu_list_model.dart';
import '../utils/silver_delegate.dart';

class InvestmentServices extends StatefulWidget {
  const InvestmentServices({Key? key}) : super(key: key);

  @override
  State<InvestmentServices> createState() => _InvestmentServicesState();
}

class _InvestmentServicesState extends State<InvestmentServices> {
  late List<HomePageList> homepageList;
  String type="";
  @override
  void initState() {
    homepageList = [
      HomePageList(
          id: "1", name: "Mutual Fund", image: "images/mutalfunds_gm.png"),
      HomePageList(
          id: "2", name: "Bonds", image: "images/bond_gm.png"),
      HomePageList(
          id: "3", name: "Alternative investment", image: "images/demat_account_gm.png"),
    ];
    getUserType();
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
          "Investment",
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
                        //if(homepageList[index].name == "BroadBand Prepaid") {
                        _alertDialog();
                        //} else {
                        /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentScreen(homepageList[index].name)));*/
                        //}
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
                                  color: Color(0xFFFFAE00),
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

  Future getUserType()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = (prefs.get("type")?? "Customer").toString();

    });
    if(type=="Customer"){
      homepageList = [
        HomePageList(
            id: "1", name: "Mutual Fund", image: "images/mutalfunds_gm.png"),
        HomePageList(
            id: "2", name: "Bonds", image: "images/bond_gm.png"),
        HomePageList(
            id: "3", name: "Equity/Derivatives", image: "images/equity_gn.png"),
        HomePageList(
            id: "3", name: "Commodities", image: "images/commodities_gm.png"),
        HomePageList(
            id: "3", name: "Crypto", image: "images/crypto_gm.png"),
      ];
    }else if(type == "Retailer" || type == "Distributor" || type == "Super Distributor") {
      homepageList = [
        HomePageList(
            id: "1", name: "Mutual Fund", image: "images/mutalfunds_gm.png"),
        HomePageList(
            id: "2", name: "Bonds", image: "images/bond_gm.png"),
        HomePageList(
            id: "3", name: "Alternative investment", image: "images/demat_account_gm.png"),
      ];

    }
  }

}
