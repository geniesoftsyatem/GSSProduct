import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PhotoProofUploadScreen extends StatefulWidget {
  String title;

  PhotoProofUploadScreen(this.title, {Key? key}) : super(key: key);

  @override
  _PhotoProofUploadScreenState createState() => _PhotoProofUploadScreenState();
}

class _PhotoProofUploadScreenState extends State<PhotoProofUploadScreen> {
  bool isProfile = false;
  bool isPanCard = false;
  bool isAadharCard = false;
  bool isAadharToggle = false;
  bool isAadharFront = false;
  bool isAadharBack = false;
  bool isAadharBoth = false;
  bool isEmpBadge = false;
  bool isLast3Slips = false;
  bool is3SlipsToggle = false;
  bool is3SalarySlip = false;
  bool isSalarySlip = false;
  bool isLast3bank = false;
  bool is3BankStatement = false;
  bool is3BankToggle = false;
  bool isBankStatement = false;
  bool isAllOfferPages = false;
  bool is3offerPages = false;
  bool isAllOfferPagesToggle = false;
  bool isOffer = false;

  @override
  void initState() {
    setState(() {
      if (widget.title == "Profile") {
        isProfile = true;
      } else if (widget.title == "PAN Card") {
        isPanCard = true;
      } else if (widget.title == "Aadhar Card") {
        isAadharCard = true;
        isAadharFront = true;
        isAadharBack = true;
      } else if (widget.title == "Employee Badge") {
        isEmpBadge = true;
      } else if (widget.title == "Salary Slip") {
        isLast3Slips = true;
        isSalarySlip = true;
      } else if (widget.title == "Bank Statement") {
        isLast3bank = true;
        isBankStatement = true;
      } else if (widget.title == "Offer/Appointment Letter") {
        is3offerPages = true;
        isOffer = true;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: Text(
            widget.title,
            style: const TextStyle(color: Color(0xFFFFAE00)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFFFFAE00),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: isProfile,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Visibility(
                            visible: true,
                            child: Image(
                              image: AssetImage("images/personal_details.png"),
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: const Text(
                              "Profile",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.40,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          iconSize: 30.0,
                          color: const Color(0xFFFFAE00),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isPanCard,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Visibility(
                            visible: true,
                            child: Image(
                              image: AssetImage("images/personal_details.png"),
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: const Text(
                              "PAN Card",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.40,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          iconSize: 30.0,
                          color: const Color(0xFFFFAE00),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isAadharCard,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload single document with front and back sides",
                            style: TextStyle(
                                color: Color(0xFFFFAE00), fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.12,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlutterSwitch(
                              activeColor: const Color(0xFFFFAE00),
                              width: width * 0.15,
                              height: height * 0.04,
                              toggleSize: 25.0,
                              value: isAadharToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isAadharToggle = val;
                                  if (isAadharToggle) {
                                    isAadharBoth = true;
                                    isAadharFront = false;
                                    isAadharBack = false;
                                  } else {
                                    isAadharBoth = false;
                                    isAadharFront = true;
                                    isAadharBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isAadharBoth,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.6445,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Image(
                                      image: AssetImage(
                                          "images/personal_details.png"),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Front and back sides",
                                      style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.2999,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: const Color(0xFFFFAE00),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isAadharFront,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.5639,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Image(
                                      image: AssetImage(
                                          "images/personal_details.png"),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Aadhar front side",
                                      style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.38,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: const Color(0xFFFFAE00),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isAadharBack,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.5667,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Image(
                                      image: AssetImage(
                                          "images/personal_details.png"),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Aadhar back side",
                                      style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.3777,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: const Color(0xFFFFAE00),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isEmpBadge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.5528,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Visibility(
                            visible: true,
                            child: Image(
                              image:
                                  AssetImage("images/employement_details.png"),
                              width: 50.0,
                              height: 50.0,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: const Text(
                              "Employee Badge",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.3916,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          iconSize: 30.0,
                          color: const Color(0xFFFFAE00),
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isSalarySlip,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload individual salary slips for the last 3 months",
                            style: TextStyle(
                                color: Color(0xFFFFAE00), fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.12,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlutterSwitch(
                              activeColor: const Color(0xFFFFAE00),
                              width: width * 0.15,
                              height: height * 0.04,
                              toggleSize: 25.0,
                              value: is3SlipsToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  is3SlipsToggle = val;
                                  if (is3SlipsToggle) {
                                    is3SalarySlip = true;
                                    isLast3Slips = false;
                                  } else {
                                    is3SalarySlip = false;
                                    isLast3Slips = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: is3SalarySlip,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.6445,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Visibility(
                                        visible: true,
                                        child: Image(
                                          image: AssetImage(
                                              "images/bank_details.png"),
                                          width: 50.0,
                                          height: 50.0,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 15.0),
                                        child: const Text(
                                          "First month",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2999,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: const Icon(Icons.add),
                                      iconSize: 30.0,
                                      color: const Color(0xFFFFAE00),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Visibility(
                                          visible: true,
                                          child: Image(
                                            image: AssetImage(
                                                "images/bank_details.png"),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Second month",
                                            style: TextStyle(
                                              color: Color(0xFFFFAE00),
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: const Color(0xFFFFAE00),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Visibility(
                                          visible: true,
                                          child: Image(
                                            image: AssetImage(
                                                "images/bank_details.png"),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Third month",
                                            style: TextStyle(
                                              color: Color(0xFFFFAE00),
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: const Color(0xFFFFAE00),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isLast3Slips,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7695,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Image(
                                      image:
                                          AssetImage("images/bank_details.png"),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Last 3 months Salary Slips",
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.1749,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: const Color(0xFFFFAE00),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isBankStatement,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload individual salary slips for the last 3 months",
                            style: TextStyle(
                                color: Color(0xFFFFAE00), fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.12,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlutterSwitch(
                              activeColor: const Color(0xFFFFAE00),
                              width: width * 0.15,
                              height: height * 0.04,
                              toggleSize: 25.0,
                              value: is3BankToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  is3BankToggle = val;
                                  if (is3BankToggle) {
                                    is3BankStatement = true;
                                    isLast3bank = false;
                                  } else {
                                    is3BankStatement = false;
                                    isLast3bank = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: is3BankStatement,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.6445,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Visibility(
                                        visible: true,
                                        child: Image(
                                          image: AssetImage(
                                              "images/bank_details.png"),
                                          width: 50.0,
                                          height: 50.0,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 15.0),
                                        child: const Text(
                                          "First month",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2999,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: const Icon(Icons.add),
                                      iconSize: 30.0,
                                      color: const Color(0xFFFFAE00),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Visibility(
                                          visible: true,
                                          child: Image(
                                            image: AssetImage(
                                                "images/bank_details.png"),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Second month",
                                            style: TextStyle(
                                              color: Color(0xFFFFAE00),
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: const Color(0xFFFFAE00),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Visibility(
                                          visible: true,
                                          child: Image(
                                            image: AssetImage(
                                                "images/bank_details.png"),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Third month",
                                            style: TextStyle(
                                              color: Color(0xFFFFAE00),
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: const Color(0xFFFFAE00),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isLast3bank,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7695,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Image(
                                      image:
                                          AssetImage("images/bank_details.png"),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4417,
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Last 3 months bank statement till today",
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.1749,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: const Color(0xFFFFAE00),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: const Text(
                        "Note : Bank statement is required for faster loan approval",
                        style: TextStyle(
                          color: Color(0xFFFFAE00)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isOffer,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload all pages in a single document",
                            style: TextStyle(
                                color: Color(0xFFFFAE00), fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.12,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlutterSwitch(
                              activeColor: const Color(0xFFFFAE00),
                              width: width * 0.15,
                              height: height * 0.04,
                              toggleSize: 25.0,
                              value: isAllOfferPagesToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isAllOfferPagesToggle = val;
                                  if (isAllOfferPagesToggle) {
                                    isAllOfferPages = true;
                                    is3offerPages = false;
                                  } else {
                                    isAllOfferPages = false;
                                    is3offerPages = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: is3offerPages,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.6445,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Visibility(
                                        visible: true,
                                        child: Image(
                                          image: AssetImage(
                                              "images/bank_details.png"),
                                          width: 50.0,
                                          height: 50.0,
                                        ),
                                      ),
                                      Container(
                                        margin:
                                        const EdgeInsets.only(left: 15.0),
                                        child: const Text(
                                          "First page",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2999,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: const Icon(Icons.add),
                                      iconSize: 30.0,
                                      color: const Color(0xFFFFAE00),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        const Visibility(
                                          visible: true,
                                          child: Image(
                                            image: AssetImage(
                                                "images/bank_details.png"),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                          const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Second page",
                                            style: TextStyle(
                                              color: Color(0xFFFFAE00),
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: const Color(0xFFFFAE00),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      children: [
                                        const Visibility(
                                          visible: true,
                                          child: Image(
                                            image: AssetImage(
                                                "images/bank_details.png"),
                                            width: 50.0,
                                            height: 50.0,
                                          ),
                                        ),
                                        Container(
                                          margin:
                                          const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Third page",
                                            style: TextStyle(
                                              color: Color(0xFFFFAE00),
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: const Color(0xFFFFAE00),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isAllOfferPages,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7695,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Image(
                                      image:
                                      AssetImage("images/bank_details.png"),
                                      width: 50.0,
                                      height: 50.0,
                                    ),
                                  ),
                                  Container(
                                    width: width * 0.4449,
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "All pages of your offer/appointment letter",
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.1749,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: const Color(0xFFFFAE00),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
