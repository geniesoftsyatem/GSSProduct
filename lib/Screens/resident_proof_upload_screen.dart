import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ResidentUploadImage extends StatefulWidget {
  String title;

  ResidentUploadImage(this.title, {Key? key}) : super(key: key);

  @override
  _ResidentUploadImageState createState() => _ResidentUploadImageState();
}

class _ResidentUploadImageState extends State<ResidentUploadImage> {
  bool isAadharCard = false;
  bool isAadharToggle = false;
  bool isAadharBoth = false;
  bool isAadharFront = false;
  bool isAadharBack = false;

  bool isUtilityBill = false;
  bool isUtilityToggle = false;
  bool isUtilityInOne = false;
  bool isShow2Utility = false;

  bool isTelephoneBill = false;
  bool isTelephoneToggle = false;
  bool isTelephoneInOne = false;
  bool isShow2Telephone = false;

  bool isPassportCard = false;
  bool isPassportToggle = false;
  bool isPassportBoth = false;
  bool isPassportFront = false;
  bool isPassportBack = false;

  bool isVoterCard = false;
  bool isVoterToggle = false;
  bool isVoterBoth = false;
  bool isVoterFront = false;
  bool isVoterBack = false;

  bool isDrivingCard = false;
  bool isDrivingToggle = false;
  bool isDrivingBoth = false;
  bool isDrivingFront = false;
  bool isDrivingBack = false;

  bool isRentalCard = false;
  bool isRentalToggle = false;
  bool isRentalBoth = false;
  bool isRentalFront = false;
  bool isRentalBack = false;

  bool isHRCard = false;
  bool isHRToggle = false;
  bool isHRBoth = false;
  bool isHRFront = false;
  bool isHRBack = false;

  bool isHouseCard = false;
  bool isHouseToggle = false;
  bool isHouseBoth = false;
  bool isHouseFront = false;
  bool isHouseBack = false;

  @override
  void initState() {
    setState(() {
      if (widget.title == "Aadhar Card") {
        isAadharCard = true;
        isAadharFront = true;
        isAadharBack = true;
      } else if (widget.title == "Utility Bill") {
        isUtilityBill = true;
        isShow2Utility = true;
      } else if (widget.title == "Telephone Bill") {
        isTelephoneBill = true;
        isShow2Telephone = true;
      } else if (widget.title == "Passport") {
        isPassportCard = true;
        isPassportFront = true;
        isPassportBack = true;
      } else if (widget.title == "Voter ID") {
        isVoterCard = true;
        isVoterFront = true;
        isVoterBack = true;
      } else if (widget.title == "Driving License") {
        isDrivingCard = true;
        isDrivingFront = true;
        isDrivingBack = true;
      } else if (widget.title == "Rental Agreement") {
        isRentalCard = true;
        isRentalFront = true;
        isRentalBack = true;
      } else if (widget.title == "Company HR Letter") {
        isHRCard = true;
        isHRFront = true;
        isHRBack = true;
      } else if (widget.title == "House Purchase Agreement Letter") {
        isHouseCard = true;
        isHouseFront = true;
        isHouseBack = true;
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
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
                visible: isUtilityBill,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload last 3 months bills in a single document",
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
                              value: isUtilityToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isUtilityToggle = val;
                                  if (isUtilityToggle) {
                                    isUtilityInOne = true;
                                    isShow2Utility = false;
                                  } else {
                                    isUtilityInOne = false;
                                    isShow2Utility = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isShow2Utility,
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
                                        child: Icon(
                                          CupertinoIcons.home,
                                          color: Color(0xFFFFAE00),
                                          size: 40.0,
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
                                          child: Icon(
                                            CupertinoIcons.home,
                                            color: Color(0xFFFFAE00),
                                            size: 40.0,
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
                                          child: Icon(
                                            CupertinoIcons.home,
                                            color: Color(0xFFFFAE00),
                                            size: 40.0,
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
                      visible: isUtilityInOne,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Last 3 months bills",
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
                visible: isTelephoneBill,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload last 3 months bills in a single document",
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
                              value: isTelephoneToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isTelephoneToggle = val;
                                  if (isTelephoneToggle) {
                                    isTelephoneInOne = true;
                                    isShow2Telephone = false;
                                  } else {
                                    isTelephoneInOne = false;
                                    isShow2Telephone = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isShow2Telephone,
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
                                        child: Icon(
                                          CupertinoIcons.home,
                                          color: Color(0xFFFFAE00),
                                          size: 40.0,
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
                                          child: Icon(
                                            CupertinoIcons.home,
                                            color: Color(0xFFFFAE00),
                                            size: 40.0,
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
                                          child: Icon(
                                            CupertinoIcons.home,
                                            color: Color(0xFFFFAE00),
                                            size: 40.0,
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
                      visible: isTelephoneInOne,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Last 3 months bills",
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
                visible: isPassportCard,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload single document with first and last pages",
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
                              value: isPassportToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isPassportToggle = val;
                                  if (isPassportToggle) {
                                    isPassportBoth = true;
                                    isPassportFront = false;
                                    isPassportBack = false;
                                  } else {
                                    isPassportBoth = false;
                                    isPassportFront = true;
                                    isPassportBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isPassportBoth,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "First and last pages",
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
                      visible: isPassportFront,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.5778,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Passport first page",
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
                              width: width * 0.3666,
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
                      visible: isPassportBack,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.5723,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Passport last page",
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
                              width: width * 0.3721,
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
                visible: isVoterCard,
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
                              value: isVoterToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isVoterToggle = val;
                                  if (isVoterToggle) {
                                    isVoterBoth = true;
                                    isVoterFront = false;
                                    isVoterBack = false;
                                  } else {
                                    isVoterBoth = false;
                                    isVoterFront = true;
                                    isVoterBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isVoterBoth,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
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
                      visible: isVoterFront,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Voter ID front side",
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
                      visible: isVoterBack,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Voter ID back side",
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
                visible: isDrivingCard,
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
                              value: isDrivingToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isDrivingToggle = val;
                                  if (isDrivingToggle) {
                                    isDrivingBoth = true;
                                    isDrivingFront = false;
                                    isDrivingBack = false;
                                  } else {
                                    isDrivingBoth = false;
                                    isDrivingFront = true;
                                    isDrivingBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isDrivingBoth,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
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
                      visible: isDrivingFront,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7167,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Driving License front side",
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
                              width: width * 0.2277,
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
                      visible: isDrivingBack,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7167,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Driving License back side",
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
                              width: width * 0.2277,
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
                visible: isRentalCard,
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
                              value: isRentalToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isRentalToggle = val;
                                  if (isRentalToggle) {
                                    isRentalBoth = true;
                                    isRentalFront = false;
                                    isRentalBack = false;
                                  } else {
                                    isRentalBoth = false;
                                    isRentalFront = true;
                                    isRentalBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isRentalBoth,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.654,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: SizedBox(
                                      width: width * 0.50,
                                      child: const Text(
                                        "All Pages of your rental agreement",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.2904,
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
                      visible: isRentalFront,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "First Page",
                                      style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
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
                      visible: isRentalBack,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
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
                visible: isHRCard,
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
                              value: isHRToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isHRToggle = val;
                                  if (isHRToggle) {
                                    isHRBoth = true;
                                    isHRFront = false;
                                    isHRBack = false;
                                  } else {
                                    isHRBoth = false;
                                    isHRFront = true;
                                    isHRBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isHRBoth,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.654,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: SizedBox(
                                      width: width * 0.50,
                                      child: const Text(
                                        "All pages of your company HR letter",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.2904,
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
                      visible: isHRFront,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "First Page",
                                      style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
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
                      visible: isHRBack,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
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
                visible: isHouseCard,
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
                              value: isHouseToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isHouseToggle = val;
                                  if (isHouseToggle) {
                                    isHouseBoth = true;
                                    isHouseFront = false;
                                    isHouseBack = false;
                                  } else {
                                    isHouseBoth = false;
                                    isHouseFront = true;
                                    isHouseBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isHouseBoth,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.654,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Visibility(
                                    visible: true,
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: SizedBox(
                                      width: width * 0.50,
                                      child: const Text(
                                        "House purchase agreement letter",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.2904,
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
                      visible: isHouseFront,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "First Page",
                                      style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
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
                      visible: isHouseBack,
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
                                    child: Icon(
                                      CupertinoIcons.home,
                                      color: Color(0xFFFFAE00),
                                      size: 40.0,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
