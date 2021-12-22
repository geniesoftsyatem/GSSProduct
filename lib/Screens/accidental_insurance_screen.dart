import 'dart:io';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AccidentalInsurance extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AccidentalInsurance();
  }
}

enum GenderCharacter { Male, Female, Transgender }
enum Marital { Single, Married, Others }

class _AccidentalInsurance extends State<AccidentalInsurance> {
  String prefixValue = 'Mr.';
  String stateValue = 'Andhra Pradesh';
  String occupationValue = 'Student';

  List<String> spinnerItems = ['Mr.', 'Mrs.', 'Ms.'];
  List<String> occupationItems = [
    'Student',
    'Self Employed',
    'Salaried',
    'House Wife',
    'Retired'
  ];
  List<String> stateList = [
    'Andhra Pradesh',
    'Arunachal Pradesh',
    'Assam',
    'Bihar',
    'Chhattisgarh',
    'Goa',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jharkhand',
    'Karnataka',
    'Kerala',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Mizoram',
    'Nagaland',
    'Odisha',
    'Punjab',
    'Rajasthan',
    'Sikkim',
    'Tamil Nadu',
    'Telangana',
    'Tripura',
    'Uttar Pradesh',
    'Uttarakhand',
    'Gairsain',
    'West Bengal'
  ];

  var _userImage;
  var _panImage;
  var _aadharBackImage;
  var _aadharFrontImage;

  final TextEditingController _first_name_controller = TextEditingController();
  final TextEditingController _last_name_controller = TextEditingController();
  final TextEditingController _address_line_2_controller =
      TextEditingController();
  final TextEditingController _city_controller = TextEditingController();
  final TextEditingController _mothers_maiden_name_controller =
      TextEditingController();
  final TextEditingController _address_line_1_controller =
      TextEditingController();
  final TextEditingController _state_controller = TextEditingController();
  final TextEditingController _district_controller = TextEditingController();
  final TextEditingController _pincode_controller = TextEditingController();
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _mobile_controller = TextEditingController();
  final TextEditingController _pan_controller = TextEditingController();
  final TextEditingController _aadhar_controller = TextEditingController();
  final TextEditingController _assured_amount_controller =
      TextEditingController();
  final TextEditingController _nominee_name_controller =
      TextEditingController();
  final TextEditingController _nominee_adhar_controller =
      TextEditingController();
  final TextEditingController _relationship_controller =
      TextEditingController();

  final format = DateFormat("dd-MM-yyyy");
  GenderCharacter? _character = GenderCharacter.Male;
  Marital? _marital_status = Marital.Single;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: Color(0xFF3A3A3A),
        title: const Text(
          "Accidental Insurance",
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
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    DropdownButton<String>(
                      value: prefixValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(
                          color: Color(0xFFFFAE00), fontSize: 18),
                      underline: Container(
                        height: 2,
                        color: const Color(0xFFFFAE00),
                      ),
                      onChanged: (String? data) {
                        setState(() {
                          prefixValue = data!;
                        });
                      },
                      items: spinnerItems
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 10.0),
                      width: width * 0.75,
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        controller: _first_name_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFFFAE00)),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                          labelText: 'First Name',
                          isDense: true,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _last_name_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Last Name',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: DateTimeField(
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Date of birth',
                    ),
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    "Gender",
                    style: TextStyle(
                        color: Color(0xFFFFAE00),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.10,
                        child: Radio<GenderCharacter>(
                          activeColor: const Color(0xFFFFAE00),
                          value: GenderCharacter.Male,
                          groupValue: _character,
                          onChanged: (GenderCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      const Text(
                        "Male",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      SizedBox(
                        width: width * 0.10,
                        child: Radio<GenderCharacter>(
                          activeColor: const Color(0xFFFFAE00),
                          value: GenderCharacter.Female,
                          groupValue: _character,
                          onChanged: (GenderCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      const Text(
                        "Female",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      SizedBox(
                        width: width * 0.10,
                        child: Radio<GenderCharacter>(
                          activeColor: const Color(0xFFFFAE00),
                          value: GenderCharacter.Transgender,
                          groupValue: _character,
                          onChanged: (GenderCharacter? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      const Text(
                        "Transgenter",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    "Marital Status",
                    style: TextStyle(
                        color: Color(0xFFFFAE00),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: width * 0.10,
                        child: Radio<Marital>(
                          activeColor: const Color(0xFFFFAE00),
                          value: Marital.Single,
                          groupValue: _marital_status,
                          onChanged: (Marital? value) {
                            setState(() {
                              _marital_status = value;
                            });
                          },
                        ),
                      ),
                      const Text(
                        "Single",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      SizedBox(
                        width: width * 0.10,
                        child: Radio<Marital>(
                          activeColor: const Color(0xFFFFAE00),
                          value: Marital.Married,
                          groupValue: _marital_status,
                          onChanged: (Marital? value) {
                            setState(() {
                              _marital_status = value;
                            });
                          },
                        ),
                      ),
                      const Text(
                        "Married",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                      SizedBox(
                        width: width * 0.10,
                        child: Radio<Marital>(
                          activeColor: const Color(0xFFFFAE00),
                          value: Marital.Others,
                          groupValue: _marital_status,
                          onChanged: (Marital? value) {
                            setState(() {
                              _marital_status = value;
                            });
                          },
                        ),
                      ),
                      const Text(
                        "Others",
                        style: TextStyle(color: Color(0xFFFFAE00)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _mothers_maiden_name_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: "Mother's Maiden Name",
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    "Address",
                    style: TextStyle(
                        color: Color(0xFFFFAE00),
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.streetAddress,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _address_line_1_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: "Address 1",
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.streetAddress,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _address_line_2_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: "Address 2",
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.streetAddress,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _city_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: "City / Town / Taluka",
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.streetAddress,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _district_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: "District",
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: DropdownButtonFormField<String>(
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      label: Text("State"),
                      isDense: true,
                    ),
                    value: stateValue,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFFFFAE00),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style:
                        const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                    onChanged: (String? data) {
                      setState(() {
                        stateValue = data!;
                      });
                    },
                    items:
                        stateList.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _pincode_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Pin code',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _email_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Email ID',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _mobile_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Mobile No.',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    textCapitalization: TextCapitalization.characters,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _pan_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Pan Card No.',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _aadhar_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'AADHAR Card No.',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: DropdownButtonFormField<String>(
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
                      label: Text("Occupation"),
                      isDense: true,
                    ),
                    value: occupationValue,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFFFFAE00),
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style:
                        const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                    onChanged: (String? data) {
                      setState(() {
                        occupationValue = data!;
                      });
                    },
                    items: occupationItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _assured_amount_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Sum Assured Amount',
                      isDense: true,
                    ),
                  ),
                ),
                Visibility(
                  visible: false,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: const Text(
                            "Medical History",
                            style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        Row(
                          children: [
                            Text("Blood Sugar", style: TextStyle(color: Color(0xFFFFAE0),),),
                            SizedBox(
                              width: width * 0.10,
                              child: Radio<GenderCharacter>(
                                activeColor: const Color(0xFFFFAE00),
                                value: GenderCharacter.Male,
                                groupValue: _character,
                                onChanged: (GenderCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            const Text(
                              "Yes",
                              style: TextStyle(color: Color(0xFFFFAE00)),
                            ),
                            SizedBox(
                              width: width * 0.10,
                              child: Radio<GenderCharacter>(
                                activeColor: const Color(0xFFFFAE00),
                                value: GenderCharacter.Male,
                                groupValue: _character,
                                onChanged: (GenderCharacter? value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            const Text(
                              "No",
                              style: TextStyle(color: Color(0xFFFFAE00)),
                            ),
                          ],
                        ),
                      ],
                    ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.name,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _nominee_name_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Nominee Name',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: DateTimeField(
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Nominee Date of birth',
                    ),
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    format: format,
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime(1900),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(2100));
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _nominee_adhar_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Aadhar No. of Nominee',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.text,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _relationship_controller,
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
                      labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                      labelText: 'Relationship with Nominee',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Center(
                            child: Text(
                              "User Image",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  _showPicker(context, "user_image");
                                },
                                child: ClipRect(
                                  child: _userImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.file(
                                            _userImage,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Color(0xFFFFAE00),
                                            size: 100,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Center(
                            child: Text(
                              "Pan Image",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  _showPicker(context, "pan_image");
                                },
                                child: ClipRect(
                                  child: _panImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.file(
                                            _panImage,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Color(0xFFFFAE00),
                                            size: 100,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          const Center(
                            child: Text(
                              "Aadhar Front",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  _showPicker(context, "aadhar_front_image");
                                },
                                child: ClipRect(
                                  child: _aadharFrontImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.file(
                                            _aadharFrontImage,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Color(0xFFFFAE00),
                                            size: 100,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Center(
                            child: Text(
                              "Aadhar Back",
                              style: TextStyle(
                                color: Color(0xFFFFAE00),
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: Center(
                              child: GestureDetector(
                                onTap: () {
                                  _showPicker(context, "aadhar_back_image");
                                },
                                child: ClipRect(
                                  child: _aadharBackImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: Image.file(
                                            _aadharBackImage,
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fitHeight,
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: const Icon(
                                            Icons.camera_alt,
                                            color: Color(0xFFFFAE00),
                                            size: 100,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: CheckboxListTile(
                    controlAffinity: ListTileControlAffinity.leading,
                    title: const Text(
                      "I agree to the terms and conditions.",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    checkColor: Colors.white,
                    activeColor: const Color(0xFFFFAE00),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text(
                      "SUBMIT",
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

  _imgFromCamera(String which_image) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (which_image == "user_image") {
        _userImage = image == null ? null : File(image.path);
      } else if (which_image == "pan_image") {
        _panImage = image == null ? null : File(image.path);
      } else if (which_image == "aadhar_back_image") {
        _aadharBackImage = image == null ? null : File(image.path);
      } else if (which_image == "aadhar_front_image") {
        _aadharFrontImage = image == null ? null : File(image.path);
      }
    });
  }

  _imgFromGallery(String which_image) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (which_image == "user_image") {
        _userImage = image == null ? null : File(image.path);
      } else if (which_image == "pan_image") {
        _panImage = image == null ? null : File(image.path);
      } else if (which_image == "aadhar_back_image") {
        _aadharBackImage = image == null ? null : File(image.path);
      } else if (which_image == "aadhar_front_image") {
        _aadharFrontImage = image == null ? null : File(image.path);
      }
    });
  }
}
