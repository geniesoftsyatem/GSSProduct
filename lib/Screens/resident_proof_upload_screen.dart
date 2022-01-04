import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';

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

  var aadhar_both_path;
  var aadhar_front_path;
  var aadhar_back_path;
  var utility_first_path;
  var utility_second_path;
  var utility_third_path;
  var utility_all_path;
  var tele_first_path;
  var tele_second_path;
  var tele_third_path;
  var tele_all_path;
  var passport_all_path;
  var passport_first_path;
  var passport_last_path;
  var voter_all_path;
  var voter_front_path;
  var voter_last_path;
  var driving_all_path;
  var driving_front_path;
  var driving_back_path;
  var rental_all_path;
  var rental_front_path;
  var rental_back_path;
  var company_all_path;
  var company_first_path;
  var company_second_path;
  var house_all_path;
  var house_first_path;
  var house_second_path;

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
                                  ClipRect(
                                    child: aadhar_both_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        aadhar_both_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "aadhar_both_image");
                                  },
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
                                  ClipRect(
                                    child: aadhar_front_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        aadhar_front_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "aadhar_front_image");
                                  },
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
                                  ClipRect(
                                    child: aadhar_back_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        aadhar_back_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "aadhar_back_image");
                                  },
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
                                      ClipRect(
                                        child: utility_first_path != null ? ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.file(
                                            utility_first_path,
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ) : ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: const Icon(
                                            CupertinoIcons.home,
                                            color: Color(0xFFFFAE00),
                                            size: 40.0,
                                          ),
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
                                      onPressed: () {
                                        _showPicker(context, "utility_first_image");
                                      },
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
                                        ClipRect(
                                          child: utility_second_path != null ? ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.file(
                                              utility_second_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ) : ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: const Icon(
                                              CupertinoIcons.home,
                                              color: Color(0xFFFFAE00),
                                              size: 40.0,
                                            ),
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
                                        onPressed: () {
                                          _showPicker(context, "utility_second_image");
                                        },
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
                                        ClipRect(
                                          child: utility_third_path != null ? ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.file(
                                              utility_third_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ) : ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: const Icon(
                                              CupertinoIcons.home,
                                              color: Color(0xFFFFAE00),
                                              size: 40.0,
                                            ),
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
                                        onPressed: () {
                                          _showPicker(context, "utility_third_image");
                                        },
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
                                  ClipRect(
                                    child: utility_all_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        utility_all_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "utility_all_image");
                                  },
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
                                      ClipRect(
                                        child: tele_first_path != null ? ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image.file(
                                            tele_first_path,
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ) : ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: const Icon(
                                            CupertinoIcons.home,
                                            color: Color(0xFFFFAE00),
                                            size: 40.0,
                                          ),
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
                                      onPressed: () {
                                        _showPicker(context, "tele_first_image");
                                      },
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
                                        ClipRect(
                                          child: tele_second_path != null ? ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.file(
                                              tele_second_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ) : ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: const Icon(
                                              CupertinoIcons.home,
                                              color: Color(0xFFFFAE00),
                                              size: 40.0,
                                            ),
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
                                        onPressed: () {
                                          _showPicker(context, "tele_second_image");
                                        },
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
                                        ClipRect(
                                          child: tele_third_path != null ? ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: Image.file(
                                              tele_third_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ) : ClipRRect(
                                            borderRadius: BorderRadius.circular(8.0),
                                            child: const Icon(
                                              CupertinoIcons.home,
                                              color: Color(0xFFFFAE00),
                                              size: 40.0,
                                            ),
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
                                        onPressed: () {
                                          _showPicker(context, "tele_third_image");
                                        },
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
                                  ClipRect(
                                    child: tele_all_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        tele_all_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "tele_all_image");
                                  },
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
                                  ClipRect(
                                    child: passport_all_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        passport_all_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "passport_all_image");
                                  },
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
                                  ClipRect(
                                    child: passport_first_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        passport_first_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "passport_first_image");
                                  },
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
                                  ClipRect(
                                    child: passport_last_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        passport_last_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "passport_last_image");
                                  },
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
                                  ClipRect(
                                    child: voter_all_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        voter_all_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "voter_all_image");
                                  },
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
                                  ClipRect(
                                    child: voter_front_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        voter_front_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "voter_front_image");
                                  },
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
                                  ClipRect(
                                    child: voter_last_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        voter_last_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "voter_last_image");
                                  },
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
                                  ClipRect(
                                    child: driving_all_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        driving_all_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "driving_all_image");
                                  },
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
                                  ClipRect(
                                    child: driving_front_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        driving_front_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "driving_front_image");
                                  },
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
                                  ClipRect(
                                    child: driving_back_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        driving_back_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "driving_back_image");
                                  },
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
                                  ClipRect(
                                    child: rental_all_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        rental_all_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "rental_all_image");
                                  },
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
                                  ClipRect(
                                    child: rental_front_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        rental_front_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "rental_front_image");
                                  },
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
                                  ClipRect(
                                    child: rental_back_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        rental_back_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "rental_back_image");
                                  },
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
                                  ClipRect(
                                    child: company_all_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        company_all_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "company_all_image");
                                  },
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
                                  ClipRect(
                                    child: company_first_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        company_first_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "company_first_image");
                                  },
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
                                  ClipRect(
                                    child: company_second_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        company_second_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "company_second_image");
                                  },
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
                                  ClipRect(
                                    child: house_all_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        house_all_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "house_all_image");
                                  },
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
                                  ClipRect(
                                    child: house_first_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        house_first_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "house_first_image");
                                  },
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
                                  ClipRect(
                                    child: house_second_path != null ? ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.file(
                                        house_second_path,
                                        width: 50.0,
                                        height: 50.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ) : ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: const Icon(
                                        CupertinoIcons.home,
                                        color: Color(0xFFFFAE00),
                                        size: 40.0,
                                      ),
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
                                  onPressed: () {
                                    _showPicker(context, "house_second_image");
                                  },
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

  void _showPicker(context, String which_image) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery(which_image);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera(which_image);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromGallery(String which_image) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
    await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (which_image == "aadhar_both_image") {
        aadhar_both_path = image == null ? null : File(image.path);
      } else if (which_image == "aadhar_front_image") {
        aadhar_front_path = image == null ? null : File(image.path);
      } else if (which_image == "aadhar_back_image") {
        aadhar_back_path = image == null ? null : File(image.path);
      } else if (which_image == "utility_first_image") {
        utility_first_path = image == null ? null : File(image.path);
      } else if (which_image == "utility_second_image") {
        utility_second_path = image == null ? null : File(image.path);
      } else if (which_image == "utility_third_image") {
        utility_third_path = image == null ? null : File(image.path);
      } else if (which_image == "utility_all_image") {
        utility_all_path = image == null ? null : File(image.path);
      } else if (which_image == "tele_first_image") {
        tele_first_path = image == null ? null : File(image.path);
      } else if (which_image == "tele_second_image") {
        tele_second_path = image == null ? null : File(image.path);
      } else if (which_image == "tele_third_image") {
        tele_third_path = image == null ? null : File(image.path);
      } else if (which_image == "tele_all_image") {
        tele_all_path = image == null ? null : File(image.path);
      } else if (which_image == "passport_all_image") {
        passport_all_path = image == null ? null : File(image.path);
      } else if (which_image == "passport_first_image") {
        passport_first_path = image == null ? null : File(image.path);
      } else if (which_image == "passport_last_image") {
        passport_last_path = image == null ? null : File(image.path);
      } else if (which_image == "voter_all_image") {
        voter_all_path = image == null ? null : File(image.path);
      } else if (which_image == "voter_front_image") {
        voter_front_path = image == null ? null : File(image.path);
      } else if (which_image == "voter_last_image") {
        voter_last_path = image == null ? null : File(image.path);
      } else if (which_image == "driving_all_image") {
        driving_all_path = image == null ? null : File(image.path);
      } else if (which_image == "driving_front_image") {
        driving_front_path = image == null ? null : File(image.path);
      } else if (which_image == "driving_back_image") {
        driving_back_path = image == null ? null : File(image.path);
      } else if (which_image == "rental_all_image") {
        rental_all_path = image == null ? null : File(image.path);
      } else if (which_image == "rental_front_image") {
        rental_front_path = image == null ? null : File(image.path);
      } else if (which_image == "rental_back_image") {
        rental_back_path = image == null ? null : File(image.path);
      } else if (which_image == "company_all_image") {
        company_all_path = image == null ? null : File(image.path);
      } else if (which_image == "company_first_image") {
        company_first_path = image == null ? null : File(image.path);
      } else if (which_image == "company_second_image") {
        company_second_path = image == null ? null : File(image.path);
      } else if (which_image == "house_all_image") {
        house_all_path = image == null ? null : File(image.path);
      } else if (which_image == "house_first_image") {
        house_first_path = image == null ? null : File(image.path);
      } else if (which_image == "house_second_image") {
        house_second_path = image == null ? null : File(image.path);
      }
    });
  }

  _imgFromCamera(String which_image) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
    await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (which_image == "aadhar_both_image") {
        aadhar_both_path = image == null ? null : File(image.path);
      } else if (which_image == "aadhar_front_image") {
        aadhar_front_path = image == null ? null : File(image.path);
      } else if (which_image == "aadhar_back_image") {
        aadhar_back_path = image == null ? null : File(image.path);
      } else if (which_image == "utility_first_image") {
        utility_first_path = image == null ? null : File(image.path);
      } else if (which_image == "utility_second_image") {
        utility_second_path = image == null ? null : File(image.path);
      } else if (which_image == "utility_third_image") {
        utility_third_path = image == null ? null : File(image.path);
      } else if (which_image == "utility_all_image") {
        utility_all_path = image == null ? null : File(image.path);
      } else if (which_image == "tele_first_image") {
        tele_first_path = image == null ? null : File(image.path);
      } else if (which_image == "tele_second_image") {
        tele_second_path = image == null ? null : File(image.path);
      }else if (which_image == "tele_third_image") {
        tele_third_path = image == null ? null : File(image.path);
      } else if (which_image == "tele_all_image") {
        tele_all_path = image == null ? null : File(image.path);
      } else if (which_image == "passport_all_image") {
        passport_all_path = image == null ? null : File(image.path);
      } else if (which_image == "passport_first_image") {
        passport_first_path = image == null ? null : File(image.path);
      } else if (which_image == "passport_last_image") {
        passport_last_path = image == null ? null : File(image.path);
      } else if (which_image == "voter_all_image") {
        voter_all_path = image == null ? null : File(image.path);
      } else if (which_image == "voter_last_image") {
        voter_last_path = image == null ? null : File(image.path);
      } else if (which_image == "driving_all_image") {
        driving_all_path = image == null ? null : File(image.path);
      } else if (which_image == "rental_all_image") {
        rental_all_path = image == null ? null : File(image.path);
      } else if (which_image == "rental_front_image") {
        rental_front_path = image == null ? null : File(image.path);
      } else if (which_image == "rental_back_image") {
        rental_back_path = image == null ? null : File(image.path);
      } else if (which_image == "company_all_image") {
        company_all_path = image == null ? null : File(image.path);
      } else if (which_image == "company_first_image") {
        company_first_path = image == null ? null : File(image.path);
      } else if (which_image == "company_second_image") {
        company_second_path = image == null ? null : File(image.path);
      } else if (which_image == "house_all_image") {
        house_all_path = image == null ? null : File(image.path);
      } else if (which_image == "house_first_image") {
        house_first_path = image == null ? null : File(image.path);
      } else if (which_image == "house_second_image") {
        house_second_path = image == null ? null : File(image.path);
      }
    });
  }
}
