import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/utils/network.dart';

class AddressScreen extends StatefulWidget {
  var title;

  AddressScreen(this.title, {Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {

  final TextEditingController _current_address_controller = TextEditingController();
  final TextEditingController _locality_controller = TextEditingController();
  final TextEditingController _pincode_controller = TextEditingController();
  final TextEditingController _city_controller = TextEditingController();
  final TextEditingController _state_controller = TextEditingController();

  bool isCurrentAddress = false;

  List<String> ownerShipList = [
    'Owned',
    'Rented',
    'Parental'
  ];

  List<String> residing_with_list = [
    'Family',
    'Friends',
    'Alone'
  ];

  List<String> number_of_yrs_list = [
    'Less than Six Months',
    'Six Months to Two Years',
    'Two Years to Five Years',
    'More than Five Years'
  ];

  String ownership = 'Owned';
  String residing_with = 'Family';
  String number_of_yrs = 'Less than Six Months';

  NetworkCall networkCall = NetworkCall();

  @override
  void initState() {
    if (widget.title == "Current Address") {
      isCurrentAddress = true;
    }
    var residential_details;
    networkCall.getPersonalDetails().then((value) => {
      if (value.userdetails!.residentialinfo!.isNotEmpty) {
        residential_details = jsonDecode(value.userdetails!.residentialinfo!),
        print(residential_details),
        setState((){
          // ur_id_cur = residential_details[0]["ur_id"];
          // ur_same = residential_details[0]["ur_same"];
          if (residential_details[0]["ur_ownership"] != "sd") {
            ownership = residential_details[0]["ur_ownership"];
          }
          if (residential_details[0]["ur_residingwith"] != "sdsd") {
            residing_with = residential_details[0]["ur_residingwith"];
          }
          if (residential_details[0]["ur_noofyears"] != "2") {
            number_of_yrs = residential_details[0]["ur_noofyears"];
          }
          _current_address_controller.text = residential_details[0]["ur_address"];
          _locality_controller.text = residential_details[0]["ur_locality"];
          _pincode_controller.text = residential_details[0]["ur_pincode"];
          _city_controller.text = residential_details[0]["ur_city"];
          _state_controller.text = residential_details[0]["ur_state"];
        }),
      },
    });
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
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFFFAE00),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Visibility(
                  visible: isCurrentAddress,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xFF111111),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                            label: Text("Home Ownership Status"),
                            isDense: true,
                          ),
                          value: ownership,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFFFAE00),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              ownership = data!;
                            });
                          },
                          items: ownerShipList.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xFF111111),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                            label: Text("Residing With"),
                            isDense: true,
                          ),
                          value: residing_with,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFFFAE00),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              residing_with = data!;
                            });
                          },
                          items: residing_with_list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xFF111111),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                            label: Text("Number Of Years At Current Address"),
                            isDense: true,
                          ),
                          value: number_of_yrs,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFFFAE00),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              number_of_yrs = data!;
                            });
                          },
                          items: number_of_yrs_list.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _current_address_controller,
                    keyboardType: TextInputType.multiline,
                    minLines: 1,
                    maxLines: 10,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Address',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _locality_controller,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Locality / Area',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _pincode_controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Pin Code',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _city_controller,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'City',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _state_controller,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'State',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_current_address_controller.text.isNotEmpty) {
                        if (_locality_controller.text.isNotEmpty) {
                          if (_city_controller.text.isNotEmpty) {
                            if (_state_controller.text.isNotEmpty) {
                              if (_pincode_controller.text.isNotEmpty) {
                                final data;
                                if (isCurrentAddress) {
                                  data = {
                                    "ownership" : ownership,
                                    "residing": residing_with,
                                    "years" : number_of_yrs,
                                    "address" :  _current_address_controller.text + ", " + _locality_controller.text,
                                    "locality" : _locality_controller.text,
                                    "city" : _city_controller.text,
                                    "state" : _state_controller.text,
                                    "pincode" : _pincode_controller.text
                                  };
                                } else {
                                  data = {
                                    "address" :  _current_address_controller.text + ", " + _locality_controller.text,
                                    "city" : _city_controller.text,
                                    "locality" : _locality_controller.text,
                                    "state" : _state_controller.text,
                                    "pincode" : _pincode_controller.text
                                  };
                                }
                                var result =  jsonEncode(data);
                                Navigator.pop(context, result);
                              } else {
                                _createToast("Please enter Pincode");
                              }
                            } else {
                              _createToast("Please enter State");
                            }
                          } else {
                            _createToast("Please enter City");
                          }
                        } else {
                          _createToast("Please enter Locality");
                        }
                      } else {
                        _createToast("Please enter Address");
                      }
                    },
                    child: const Text(
                      "Save",
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 16.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 40.0),
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
          ),
        ),
      ),
    );
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}
