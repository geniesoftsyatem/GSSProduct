import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/add_money_screen.dart';
import 'package:genie_money/Screens/balance_inquiry_screen.dart';
import 'package:genie_money/Screens/cash_withdrawal_screen.dart';
import 'package:genie_money/Screens/money_transfer_screen.dart';
import 'package:genie_money/utils/silver_delegate.dart';

class MoneyTransfer extends StatefulWidget{
  MoneyTransfer({Key? key}) : super(key: key);

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
    list = [
      HomePageList(
          id: "1", name: "Money Transfer", image: "images/moneytransfer_gm.png"),
      HomePageList(
          id: "2", name: "Add Money", image: "images/addmoney_gm.png"),
      HomePageList(
          id: "3", name: "Balance Inquiry", image: "images/balance_enquiry_gm.png"),
      HomePageList(
          id: "4", name: "Cash Withdrawal", image: "images/cash_withdraw_gm.png"),
      HomePageList(
          id: "5", name: "Mini Statement", image: "images/mini_statement_gm.png"),
      HomePageList(
          id: "6", name: "Micro ATM", image: "images/micro_atm_gm.png")
    ];
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
          "Money Transfer",
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
                        if (list[index].name == "Money Transfer") {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MoneyTransferScreen()));
                        }else if(list[index].name == "Add Money"){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      AddMoneyScreen()));
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

                        }else if(list[index].name == "Micro ATM"){

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

}