import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'employment_and_bank_details_screen.dart';

class WalletScrreen extends StatefulWidget {
  const WalletScrreen({Key? key}) : super(key: key);

  @override
  State<WalletScrreen> createState() => _WalletScrreenState();
}

class _WalletScrreenState extends State<WalletScrreen> {

  TextEditingController amountController = TextEditingController();
  double walletAmount = 0.0;

  @override
  void initState() {
    getWalletAmount();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "Wallet",
          style: const TextStyle(color: Color(0xFFFFAE00)),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFAE00),
          ),
          onPressed: () {
              Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Container(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xFF3A3A3A),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Wallet Balance : ",
                      style: TextStyle(
                        color: Color(0xFFFFAE00),
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    Text(
                        "Rs. ",
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,)
                    ),

                    Text(
                        walletAmount.toString(),
                        style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold,))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20,bottom: 20,left: 10,right: 10),
                  child: Text(
                      "Add Money to Wallet",
                    style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold, fontSize: 22),
                  ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: TextFormField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,

                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: amountController,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    isDense: true,
                    hintText: "Enter Amount",
                    hintStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: ElevatedButton(
                  child: const Text(
                    "PROCEED",
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onPressed: () async{
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    bool isAccountAdded = pref.getBool("isAccountAdded")??false;
                    if(isAccountAdded){
                      if(amountController.text.isNotEmpty){
                        dailogForWallet(double.parse(amountController.text));
                      }else{
                        Fluttertoast.showToast(msg: "Please enter amount");
                      }

                    }else{
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                              EmploymentAndBankDetailsScreen("Bank Details")));
                    }
                  },
                ),
              ),
              /*Expanded(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                        "Amount will detect from wallet for functionality like Recharge, Bill-Play, etc",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
              )*/
            ],
          ),
        ),
      ),
    );
  }

  dailogForWallet(double amount){

    Dialog dailogWallet = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Color(0xFF3A3A3A),
      child: StatefulBuilder(builder: (context,setState){
        return Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Update wallet",style: TextStyle(fontSize: 18,color: Color(0xFFFFAE00), fontWeight: FontWeight.bold),),
                  IconButton(
                    icon:Icon(Icons.clear,color: Color(0xFFFFAE00)),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Available balance : ",style: TextStyle(fontSize: 18,color: Color(0xFFFFAE00)),),
                    Text("Rs."+ walletAmount.toString(),style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add balance : ",style: TextStyle(fontSize: 18,color: Color(0xFFFFAE00)),),
                    Text("Rs."+ amount.toString(),style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.bold),)
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 40,
                child: ElevatedButton(
                  onPressed: ()async{

                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      })
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) => dailogWallet);
  }

  getWalletAmount()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    walletAmount = pref.getDouble("upiId")??0.0;
  }
}
