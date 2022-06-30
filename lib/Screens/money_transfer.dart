import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/aadhar_cardpay_screen.dart';
import 'package:genie_money/Screens/add_money_screen.dart';
import 'package:genie_money/Screens/balance_inquiry_screen.dart';
import 'package:genie_money/Screens/cash_withdrawal_screen.dart';
import 'package:genie_money/Screens/credit_to_bank.dart';
import 'package:genie_money/Screens/customer_money_transfer.dart';
import 'package:genie_money/Screens/mini_statement_screen.dart';
import 'package:genie_money/Screens/money_transfer_screen.dart';
import 'package:genie_money/Screens/qr_code_scanner_screen.dart';
import 'package:genie_money/utils/silver_delegate.dart';

class MoneyTransfer extends StatefulWidget{
  String fromScreen;
  MoneyTransfer({required this.fromScreen,Key? key}) : super(key: key);

  @override
  _MoneyTransfer createState() {
    // TODO: implement createState
    return _MoneyTransfer();
  }
}

class _MoneyTransfer extends State<MoneyTransfer>{

  late List<HomePageList> list;

  @override
  void initState() {
    if(widget.fromScreen=="Money Transfer"){
      list = [
        /*HomePageList(
            id: "1", name: "Scan QR", image: "images/scantopay_gm.png"),*/
        HomePageList(
            id: "1", name: "Bank A/c to bank A/c", image: "images/moneytransfer_gm.png"),
        HomePageList(
            id: "2", name: "Forex", image: "images/addmoney_gm.png"),
        HomePageList(
            id: "6", name: "Micro ATM", image: "images/micro_atm_gm.png"),
        HomePageList(
            id: "3", name: "Balance Inquiry", image: "images/balance_enquiry_gm.png"),
        HomePageList(
            id: "4", name: "Cash Withdrawal", image: "images/cash_withdraw_gm.png"),
        HomePageList(
            id: "5", name: "Mini Statement", image: "images/mini_statement_gm.png"),
        HomePageList(
            id: "7", name: "Credit Card Payment", image: "images/creditcard_gm.png"),
        HomePageList(
            id: "7", name: "Payment by cards", image: "images/credit_card_offer.png"),
        HomePageList(
            id: "8", name: "Pay via Aadhar Card", image: "images/aadharcard_payment_gm.png")
      ];
    }else{
      list = [
        HomePageList(
            id: "7", name: "Scan QR", image: "images/scantopay_gm.png"),
        HomePageList(
            id: "1", name: "Transfer to Mobile", image: "images/moneytransfer_gm.png"),
        HomePageList(
            id: "1", name: "Transfer to Bank A/c", image: "images/moneytransfer_gm.png"),
        HomePageList(
            id: "7", name: "Payment by cards", image: "images/credit_card_offer.png"),
        /*HomePageList(
            id: "2", name: "Forex", image: "images/addmoney_gm.png"),*/
        /*HomePageList(
            id: "6", name: "Micro ATM", image: "images/micro_atm_gm.png"),*/
        HomePageList(
            id: "3", name: "Balance Inquiry", image: "images/balance_enquiry_gm.png"),
        /*HomePageList(
            id: "4", name: "Cash Withdrawal", image: "images/cash_withdraw_gm.png"),*/
        /*HomePageList(
            id: "5", name: "Mini Statement", image: "images/mini_statement_gm.png"),*/
        HomePageList(
            id: "7", name: "Loans Repayment", image: "images/consumer_loan.png"),
        HomePageList(
            id: "7", name: "Credit Card Payment", image: "images/creditcard_gm.png"),

        HomePageList(
            id: "8", name: "Pay via Aadhar Card", image: "images/aadharcard_payment_gm.png")
      ];

    }

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          widget.fromScreen,
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
                  itemCount: list.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: () async {
                        if (list[index].name == "Bank A/c to bank A/c"|| list[index].name == "Transfer to Bank A/c") {
                         /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CustomerMoneyTransfer()));*/
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MoneyTransferScreen()));
                        }else if(list[index].name == "Credit Card Payment" ||
                            list[index].name == "Payment by cards"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreditToBank()));
                        }else if(list[index].name == "Balance Inquiry"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      BalanceInquiry()));
                        }else if(list[index].name == "Cash Withdrawal"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CashWithdrawalScreen()));
                        }else if(list[index].name == "Mini Statement"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MiniStatementScreen()));
                        }else if(list[index].name == "Scan QR"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QRCodeScannerScreen()));
                        }else if(list[index].name == "Pay via Aadhar Card"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AadharCardPayScreen()));
                        }else /*if(list[index].name == "Micro ATM")*/{
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
                                  image: AssetImage(list[index].image),
                                  width: 50.0,
                                  height: 50.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0),
                                child: Text(
                                  list[index].name,
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