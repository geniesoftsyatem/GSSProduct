import 'dart:convert';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/address_screen.dart';
import 'package:genie_money/utils/constants.dart';
import 'package:genie_money/utils/network.dart';
import 'package:intl/intl.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

enum GenderCharacter { Male, Female, Transgender }
enum Marital { Single, Married, Others }

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen>
    with SingleTickerProviderStateMixin {
  late List<String> personal_details_list;

  late TabController _tabController;

  TextEditingController _mobile_no_controller = TextEditingController();
  TextEditingController _full_name_controller = TextEditingController();
  TextEditingController alt_mobile_no_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController _pan_card_no_controller = TextEditingController();
  TextEditingController _aadhar_card_no_controller = TextEditingController();
  TextEditingController _current_address_controller = TextEditingController();
  TextEditingController _permanent_address_controller = TextEditingController();
  TextEditingController _pincode_controller = TextEditingController();
  TextEditingController _city_controller = TextEditingController();
  TextEditingController _state_controller = TextEditingController();
  TextEditingController _reference_name_1_controller = TextEditingController();
  TextEditingController date_controller = TextEditingController();
  TextEditingController _reference_mobile_no_1_controller =
      TextEditingController();
  TextEditingController _reference_relation_type_1_controller =
      TextEditingController();
  TextEditingController _reference_name_2_controller = TextEditingController();
  TextEditingController _reference_mobile_no_2_controller =
  TextEditingController();
  TextEditingController _reference_relation_type_2_controller =
  TextEditingController();
  TextEditingController _reference_name_3_controller = TextEditingController();
  TextEditingController _reference_mobile_no_3_controller =
  TextEditingController();
  TextEditingController _reference_relation_type_3_controller =
  TextEditingController();
  TextEditingController _reference_name_4_controller = TextEditingController();
  TextEditingController _reference_mobile_no_4_controller =
  TextEditingController();
  TextEditingController _reference_relation_type_4_controller =
  TextEditingController();

  GenderCharacter? _character = GenderCharacter.Male;
  Marital? _marital_status = Marital.Single;

  String selected_date = "", basic_info_json = "", residential_info_json = "", ownership = "",
      per_ownership = "", residing = "", years = "", locality = "", per_locality = "", urf_id_1 = "",
      urf_id_2 = "",  urf_id_3 = "", urf_id_4 = "", ur_id_cur = "", ur_id_per = "", ur_same = "";

  final format = DateFormat("dd-MM-yyyy");

  String qualification_type = 'Undergraduate';

  List<String> qualification_type_list = [
    'Undergraduate',
    'Graduate',
    'Postgraduate'
  ];

  bool isToggle = true;
  bool show_permanent_address = false;

  late Map<String, dynamic> basicInfobody;
  var residentialInfoBody;

  NetworkCall networkCall = NetworkCall();
  List date = [];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    var user_details, residential_details, reference_details;
    networkCall.getPersonalDetails().then((value) => {
      if(value.userdetails!.basicinfo!.isNotEmpty) {
        user_details = jsonDecode(value.userdetails!.basicinfo!),
        setState((){
          _full_name_controller.text = user_details["fname"];
          _mobile_no_controller.text = user_details["phone"];
          alt_mobile_no_controller.text = user_details["alt_mobile_no"];
          _character = user_details["gender"] == "male" || user_details["gender"] == "Male" ? GenderCharacter.Male : user_details["gender"] == "female" || user_details["gender"] == "Female" ? GenderCharacter.Female : GenderCharacter.Transgender;
          email_controller.text = user_details["email"];
          selected_date = user_details["dob"];
          date = selected_date.split("-");
          if (date[0].toString().length == 4) {
            date_controller.text = date[2] + "-" + date[1] + "-" + date[0];
          } else {
            date_controller.text = date[0] + "-" + date[1] + "-" + date[2];
          }
          qualification_type = user_details["qualification"] == "1" ? "Undergraduate" : user_details["qualification"] == "2" ? "Graduate" : "Postgraduate";
          _pan_card_no_controller.text = user_details["pancard"];
          _aadhar_card_no_controller.text = user_details["adharcard"];
          _marital_status = user_details["maritalstatus"] == "Single" || user_details["maritalstatus"] == "single" ? Marital.Single : user_details["maritalstatus"] == "Married" || user_details["maritalstatus"] == "married" ? Marital.Married : Marital.Others;
        }),
      },
      if (value.userdetails!.residentialinfo!.isNotEmpty) {
        residential_details = jsonDecode(value.userdetails!.residentialinfo!),
        print(residential_details),
        setState((){
          ur_id_cur = residential_details[0]["ur_id"];
          ur_same = residential_details[0]["ur_same"];
          _current_address_controller.text = residential_details[0]["ur_address"] + ", " + residential_details[0]["ur_locality"];
          _pincode_controller.text = residential_details[0]["ur_pincode"];
          _city_controller.text = residential_details[0]["ur_city"];
          _state_controller.text = residential_details[0]["ur_state"];
          if (ur_same == "1") {
            isToggle = true;
            show_permanent_address = false;
          } else {
            isToggle = false;
            show_permanent_address = true;
          }
          if (residential_details.length == 2 || residential_details.length > 2) {
            ur_id_per = residential_details[1]["ur_id"];
            _permanent_address_controller.text = residential_details[1]["ur_address"] + ", " + residential_details[1]["ur_locality"];
          }
        }),
      },
      if (value.userdetails!.references!.isNotEmpty) {
        reference_details = jsonDecode(value.userdetails!.references!),
        print(reference_details),
        setState((){
          urf_id_1 = reference_details[0]["urf_id"];
          _reference_name_1_controller.text = reference_details[0]["urf_name"];
          _reference_mobile_no_1_controller.text = reference_details[0]["urf_mobile"];
          _reference_relation_type_1_controller.text = reference_details[0]["urf_relation"];

          if (reference_details.length == 2 || reference_details.length > 2) {
            urf_id_2 = reference_details[1]["urf_id"];
            _reference_name_2_controller.text = reference_details[1]["urf_name"];
            _reference_mobile_no_2_controller.text = reference_details[1]["urf_mobile"];
            _reference_relation_type_2_controller.text = reference_details[0]["urf_relation"];
          }

          if (reference_details.length == 3 || reference_details.length > 3) {
            urf_id_3 = reference_details[2]["urf_id"];
            _reference_name_3_controller.text = reference_details[2]["urf_name"];
            _reference_mobile_no_3_controller.text = reference_details[2]["urf_mobile"];
            _reference_relation_type_3_controller.text = reference_details[0]["urf_relation"];
          }

          if (reference_details.length == 4 || reference_details.length > 4) {
            urf_id_4 = reference_details[3]["urf_id"];
            _reference_name_4_controller.text = reference_details[3]["urf_name"];
            _reference_mobile_no_4_controller.text = reference_details[3]["urf_mobile"];
            _reference_relation_type_4_controller.text = reference_details[0]["urf_relation"];
          }
        }),
      }
    });
    setState(() {
      _full_name_controller.text = Constants.name;
      _mobile_no_controller.text = Constants.phone;
      email_controller.text = Constants.email;
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: const Color(0xFF111111),
          appBar: AppBar(
            backgroundColor: const Color(0xFF3A3A3A),
            bottom: TabBar(
              indicatorColor: Color(0xFFFFAE00),
              controller: _tabController,
              labelColor: Color(0xFFFFAE00),
              unselectedLabelColor: Colors.white,
              tabs: const [
                Tab(
                  child: Text(
                    "Basic Info",
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text("Residential Info", textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text("References", textAlign: TextAlign.center),
                ),
              ],
            ),
            title: const Text(
              "Personal Details",
              style: TextStyle(
                color: Color(0xFFFFAE00),
              ),
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
          body: TabBarView(
            controller: _tabController,
            children: [
              _basicInfo(width, context),
              _residentialInfo(width, height),
              _reference(width, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _basicInfo(double width, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                cursorColor: const Color(0xFFFFAE00),
                controller: _full_name_controller,
                keyboardType: TextInputType.name,
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
                  labelText: 'Full Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _mobile_no_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
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
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: alt_mobile_no_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
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
                  labelText: 'Alternate Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                "Gender",
                style: TextStyle(
                    color: Color(0xFFFFAE00),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
                textAlign: TextAlign.left,
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
                    "Transgender",
                    style: TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: email_controller,
                keyboardType: TextInputType.emailAddress,
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
                  labelText: 'E-Mail',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: DateTimeField(
                  controller: date_controller,
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
                  labelText: 'Date of Birth',
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
                onChanged: (date) {
                  selected_date = date!.day.toString() + "-" + date.month.toString() + "-" + date.year.toString();
                },
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
                  labelStyle: TextStyle(color: Color(0xFFFFAE00),),
                  label: Text("Qualification"),
                  isDense: true,
                ),
                value: qualification_type,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFFFFAE00),
                ),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                onChanged: (String? data) {
                  setState(() {
                    qualification_type = data!;
                  });
                },
                items: qualification_type_list
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
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _pan_card_no_controller,
                textCapitalization: TextCapitalization.characters,
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
                  labelText: 'PAN Card',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _aadhar_card_no_controller,
                keyboardType: TextInputType.number,
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
                  labelText: 'Aadhar Card Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                "Marital Status",
                style: TextStyle(
                    color: Color(0xFFFFAE00),
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
                textAlign: TextAlign.left,
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
              child: ElevatedButton(
                onPressed: () {
                  basicInfobody = {
                    "fname" : _full_name_controller.text,
                    "altmobile" : alt_mobile_no_controller.text,
                    "gender" : _character == GenderCharacter.Male ? "Male" : _character == GenderCharacter.Female ? "Female" : "Transgender",
                    "email" : email_controller.text,
                    "dob" : selected_date,
                    "qualification" : qualification_type == "Undergraduate" ? "1" : qualification_type == "Graduate" ? "2" : "3",
                    "pancard" : _pan_card_no_controller.text,
                    "adharcard" : _aadhar_card_no_controller.text,
                    "maritalstatus" : _marital_status == Marital.Single ? "Single" : _marital_status == Marital.Married ? " Married" : "Others"

                  };
                  basic_info_json = jsonEncode(basicInfobody);
                  print(basic_info_json);
                  final addresses = {
                    "ur_id" : ur_id_cur,
                    "ur_same" : "1",
                    "ur_userid" : Constants.userid,
                    "ur_ownership" : ownership,
                    "ur_residingwith" : residing,
                    "ur_noofyears" : years,
                    "ur_address" : _current_address_controller.text,
                    "ur_locality" : locality,
                    "ur_pincode" : _pincode_controller.text,
                    "ur_city" : _city_controller.text,
                    "ur_state" : _state_controller.text,
                  };
                  residentialInfoBody = [
                    addresses,
                    addresses
                  ];
                  residential_info_json = jsonEncode(residentialInfoBody);
                  print(residential_info_json);
                  Map<String, dynamic> reference_1 = Map<String, dynamic>();
                  Map<String, dynamic> reference_2 = Map<String, dynamic>();
                  Map<String, dynamic> reference_3 = Map<String, dynamic>();
                  Map<String, dynamic> reference_4 = Map<String, dynamic>();
                  var refer;

                  reference_1 = {
                    "urf_id" : urf_id_1,
                    "urf_userid" : Constants.userid,
                    "urf_name" : _reference_name_1_controller.text,
                    "urf_mobile" : _reference_mobile_no_1_controller.text,
                    "urf_relation" : _reference_relation_type_1_controller.text
                  };

                  reference_2 = {
                    "urf_id" : urf_id_2,
                    "urf_userid" : Constants.userid,
                    "urf_name" : _reference_name_2_controller.text,
                    "urf_mobile" : _reference_mobile_no_2_controller.text,
                    "urf_relation" : _reference_relation_type_2_controller.text
                  };

                  reference_3 = {
                    "urf_id" : urf_id_3,
                    "urf_userid" : Constants.userid,
                    "urf_name" : _reference_name_3_controller.text,
                    "urf_mobile" : _reference_mobile_no_3_controller.text,
                    "urf_relation" : _reference_relation_type_3_controller.text
                  };

                  reference_4 = {
                    "urf_id" : urf_id_4,
                    "urf_userid" : Constants.userid,
                    "urf_name" : _reference_name_4_controller.text,
                    "urf_mobile" : _reference_mobile_no_4_controller.text,
                    "urf_relation" : _reference_relation_type_4_controller.text
                  };

                  String data = "";
                  if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty) {
                    refer = [
                      reference_1,
                      reference_2,
                      reference_3,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty){
                    refer = [
                      reference_2,
                      reference_3,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty){
                    refer = [
                      reference_1,
                      reference_3,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isEmpty && reference_4.isNotEmpty){
                    refer = [
                      reference_1,
                      reference_2,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isEmpty) {
                    refer = [
                      reference_1,
                      reference_2,
                      reference_3
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty) {
                    refer = [
                      reference_3,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isNotEmpty && reference_3.isEmpty && reference_4.isNotEmpty) {
                    refer = [
                      reference_2,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isEmpty) {
                    refer = [
                      reference_2,
                      reference_3
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isEmpty && reference_3.isEmpty && reference_4.isNotEmpty) {
                    refer = [
                      reference_1,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isEmpty && reference_3.isNotEmpty && reference_4.isEmpty) {
                    refer = [
                      reference_1,
                      reference_3
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isEmpty && reference_4.isEmpty) {
                    refer = [
                      reference_1,
                      reference_2
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isEmpty && reference_3.isEmpty && reference_4.isEmpty) {
                    refer = [
                      ""
                    ];
                    data = jsonEncode(refer);
                  }
                  NetworkCall network = NetworkCall();
                  network.update_profile(basicInfobody, residentialInfoBody, refer, "1", context);
                  _tabController.animateTo(1);
                },
                child: const Text(
                  "Save and Continue",
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
    );
  }

  Widget _residentialInfo(double width, double height) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddressScreen("Current Address")),
                  );

                  if (result != null) {
                    final data = jsonDecode(result);
                    setState(() {
                      _current_address_controller.text = data["address"];
                      ownership = data["ownership"];
                      residing = data["residing"];
                      years = data["years"];
                      locality = data["locality"];
                      _city_controller.text = data["city"];
                      _state_controller.text = data["state"];
                      _pincode_controller.text = data["pincode"];
                    });
                  }
                },
                readOnly: true,
                style: const TextStyle(color: Color(0xFFFFAE00)),
                controller: _current_address_controller,
                minLines: 1,
                maxLines: 10,
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
                  labelText: 'Current Address',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Permanent Address",
                            style: TextStyle(
                                color: Color(0xFFFFAE00), fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              "Same as current address",
                              style: TextStyle(color: Color(0xFFFFAE00)),
                            ),
                          ),
                        ],
                      ),
                      FlutterSwitch(
                        activeColor: const Color(0xFFFFAE00),
                        width: width * 0.15,
                        height: height * 0.05,
                        toggleSize: 25.0,
                        value: isToggle,
                        borderRadius: 15.0,
                        onToggle: (val) {
                          setState(() {
                            isToggle = val;
                            if (isToggle) {
                              show_permanent_address = false;
                            } else {
                              show_permanent_address = true;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Visibility(
                    visible: show_permanent_address,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    AddressScreen("Permanent Address")),
                          );

                          if (result != null) {
                            final data = jsonDecode(result);
                            setState(() {
                              _permanent_address_controller.text = data["address"];
                              _city_controller.text = data["city"];
                              _state_controller.text = data["state"];
                              _pincode_controller.text = data["pincode"];
                            });
                          }
                        },
                        readOnly: true,
                        style: const TextStyle(color: Color(0xFFFFAE00)),
                        controller: _permanent_address_controller,
                        keyboardType: TextInputType.none,
                        minLines: 1,
                        maxLines: 10,
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
                          labelText: 'Permanent Address',
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _pincode_controller,
                keyboardType: TextInputType.number,
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
                  labelText: 'City',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _state_controller,
                keyboardType: TextInputType.streetAddress,
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
                  labelText: 'State',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                    if (isToggle) {
                      final addresses = {
                        "ur_id" : ur_id_cur,
                        "ur_same" : "1",
                        "ur_userid" : Constants.userid,
                        "ur_ownership" : ownership,
                        "ur_residingwith" : residing,
                        "ur_noofyears" : years,
                        "ur_address" : _current_address_controller.text,
                        "ur_locality" : locality,
                        "ur_pincode" : _pincode_controller.text,
                        "ur_city" : _city_controller.text,
                        "ur_state" : _state_controller.text,
                      };
                      residentialInfoBody = [
                        addresses,
                        addresses
                      ];
                      residential_info_json = jsonEncode(residentialInfoBody);
                      print(residential_info_json);
                      _tabController.animateTo(2);
                    } else {
                      final current_address = {
                        "ur_id" : ur_id_cur,
                        "ur_same" : "0",
                        "ur_userid" : Constants.userid,
                        "ur_ownership" : ownership,
                        "ur_residingwith" : residing,
                        "ur_noofyears" : years,
                        "ur_address" : _current_address_controller.text,
                        "ur_locality" : locality,
                        "ur_pincode" : _pincode_controller.text,
                        "ur_city" : _city_controller.text,
                        "ur_state" : _state_controller.text,
                      };
                      final permanent_address = {
                        "ur_id" : ur_id_per,
                        "ur_same" : "0",
                        "ur_userid" : Constants.userid,
                        "ur_ownership" : "",
                        "ur_residingwith" : "",
                        "ur_noofyears" : "",
                        "ur_address" : _permanent_address_controller.text,
                        "ur_locality" : locality,
                        "ur_pincode" : _pincode_controller.text,
                        "ur_city" : _city_controller.text,
                        "ur_state" : _state_controller.text,
                      };
                      final request = [
                        current_address,
                        permanent_address
                      ];
                      residential_info_json = jsonEncode(request);
                      print(residential_info_json);
                      Map<String, dynamic> reference_1 = Map<String, dynamic>();
                      Map<String, dynamic> reference_2 = Map<String, dynamic>();
                      Map<String, dynamic> reference_3 = Map<String, dynamic>();
                      Map<String, dynamic> reference_4 = Map<String, dynamic>();
                      var refer;

                      reference_1 = {
                        "urf_id" : urf_id_1,
                        "urf_userid" : Constants.userid,
                        "urf_name" : _reference_name_1_controller.text,
                        "urf_mobile" : _reference_mobile_no_1_controller.text,
                        "urf_relation" : _reference_relation_type_1_controller.text
                      };

                      reference_2 = {
                        "urf_id" : urf_id_2,
                        "urf_userid" : Constants.userid,
                        "urf_name" : _reference_name_2_controller.text,
                        "urf_mobile" : _reference_mobile_no_2_controller.text,
                        "urf_relation" : _reference_relation_type_2_controller.text
                      };

                      reference_3 = {
                        "urf_id" : urf_id_3,
                        "urf_userid" : Constants.userid,
                        "urf_name" : _reference_name_3_controller.text,
                        "urf_mobile" : _reference_mobile_no_3_controller.text,
                        "urf_relation" : _reference_relation_type_3_controller.text
                      };

                      reference_4 = {
                        "urf_id" : urf_id_4,
                        "urf_userid" : Constants.userid,
                        "urf_name" : _reference_name_4_controller.text,
                        "urf_mobile" : _reference_mobile_no_4_controller.text,
                        "urf_relation" : _reference_relation_type_4_controller.text
                      };

                      String data = "";
                      if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty) {
                        refer = [
                          reference_1,
                          reference_2,
                          reference_3,
                          reference_4
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty){
                        refer = [
                          reference_2,
                          reference_3,
                          reference_4
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isNotEmpty && reference_2.isEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty){
                        refer = [
                          reference_1,
                          reference_3,
                          reference_4
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isEmpty && reference_4.isNotEmpty){
                        refer = [
                          reference_1,
                          reference_2,
                          reference_4
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isEmpty) {
                        refer = [
                          reference_1,
                          reference_2,
                          reference_3
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isEmpty && reference_2.isEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty) {
                        refer = [
                          reference_3,
                          reference_4
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isEmpty && reference_2.isNotEmpty && reference_3.isEmpty && reference_4.isNotEmpty) {
                        refer = [
                          reference_2,
                          reference_4
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isEmpty) {
                        refer = [
                          reference_2,
                          reference_3
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isNotEmpty && reference_2.isEmpty && reference_3.isEmpty && reference_4.isNotEmpty) {
                        refer = [
                          reference_1,
                          reference_4
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isNotEmpty && reference_2.isEmpty && reference_3.isNotEmpty && reference_4.isEmpty) {
                        refer = [
                          reference_1,
                          reference_3
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isEmpty && reference_4.isEmpty) {
                        refer = [
                          reference_1,
                          reference_2
                        ];
                        data = jsonEncode(refer);
                      } else if (reference_1.isEmpty && reference_2.isEmpty && reference_3.isEmpty && reference_4.isEmpty) {
                        refer = [
                          ""
                        ];
                        data = jsonEncode(refer);
                      }
                      NetworkCall network = NetworkCall();
                      network.update_profile(basicInfobody, residentialInfoBody, refer, "2", context);
                      _tabController.animateTo(2);
                    }
                },
                child: const Text(
                  "Save and Continue",
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
    );
  }

  Widget _reference(double width, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                "Request you to share 4 contact details for processing your loan.",
                style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 20.0),
              child: const Text(
                "Reference 1",
                style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_name_1_controller,
                keyboardType: TextInputType.name,
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
                  labelText: 'Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_mobile_no_1_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
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
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_relation_type_1_controller,
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
                  labelText: 'Relation Type',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 20.0),
              child: const Text(
                "Reference 2",
                style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_name_2_controller,
                keyboardType: TextInputType.name,
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
                  labelText: 'Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_mobile_no_2_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
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
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_relation_type_2_controller,
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
                  labelText: 'Relation Type',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 20.0),
              child: const Text(
                "Reference 3",
                style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_name_3_controller,
                keyboardType: TextInputType.name,
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
                  labelText: 'Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_mobile_no_3_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
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
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_relation_type_3_controller,
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
                  labelText: 'Relation Type',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 20.0),
              child: const Text(
                "Reference 4",
                style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontSize: 18.0,
                    fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_name_4_controller,
                keyboardType: TextInputType.name,
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
                  labelText: 'Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_mobile_no_4_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
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
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: Color(0xFFFFAE00)),
                controller: _reference_relation_type_4_controller,
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
                  labelText: 'Relation Type',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  Map<String, dynamic> reference_1 = Map<String, dynamic>();
                  Map<String, dynamic> reference_2 = Map<String, dynamic>();
                  Map<String, dynamic> reference_3 = Map<String, dynamic>();
                  Map<String, dynamic> reference_4 = Map<String, dynamic>();
                  var refer;

                  reference_1 = {
                    "urf_id" : urf_id_1,
                    "urf_userid" : Constants.userid,
                    "urf_name" : _reference_name_1_controller.text,
                    "urf_mobile" : _reference_mobile_no_1_controller.text,
                    "urf_relation" : _reference_relation_type_1_controller.text
                  };

                  reference_2 = {
                    "urf_id" : urf_id_2,
                    "urf_userid" : Constants.userid,
                    "urf_name" : _reference_name_2_controller.text,
                    "urf_mobile" : _reference_mobile_no_2_controller.text,
                    "urf_relation" : _reference_relation_type_2_controller.text
                  };

                  reference_3 = {
                    "urf_id" : urf_id_3,
                    "urf_userid" : Constants.userid,
                    "urf_name" : _reference_name_3_controller.text,
                    "urf_mobile" : _reference_mobile_no_3_controller.text,
                    "urf_relation" : _reference_relation_type_3_controller.text
                  };

                  reference_4 = {
                    "urf_id" : urf_id_4,
                    "urf_userid" : Constants.userid,
                    "urf_name" : _reference_name_4_controller.text,
                    "urf_mobile" : _reference_mobile_no_4_controller.text,
                    "urf_relation" : _reference_relation_type_4_controller.text
                  };

                  String data = "";
                  if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty) {
                    refer = [
                      reference_1,
                      reference_2,
                      reference_3,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty){
                    refer = [
                      reference_2,
                      reference_3,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty){
                    refer = [
                      reference_1,
                      reference_3,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isEmpty && reference_4.isNotEmpty){
                    refer = [
                      reference_1,
                      reference_2,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isEmpty) {
                    refer = [
                      reference_1,
                      reference_2,
                      reference_3
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isEmpty && reference_3.isNotEmpty && reference_4.isNotEmpty) {
                    refer = [
                      reference_3,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isNotEmpty && reference_3.isEmpty && reference_4.isNotEmpty) {
                    refer = [
                      reference_2,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isNotEmpty && reference_3.isNotEmpty && reference_4.isEmpty) {
                    refer = [
                      reference_2,
                      reference_3
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isEmpty && reference_3.isEmpty && reference_4.isNotEmpty) {
                    refer = [
                      reference_1,
                      reference_4
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isEmpty && reference_3.isNotEmpty && reference_4.isEmpty) {
                    refer = [
                      reference_1,
                      reference_3
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isNotEmpty && reference_2.isNotEmpty && reference_3.isEmpty && reference_4.isEmpty) {
                    refer = [
                      reference_1,
                      reference_2
                    ];
                    data = jsonEncode(refer);
                  } else if (reference_1.isEmpty && reference_2.isEmpty && reference_3.isEmpty && reference_4.isEmpty) {
                    refer = [
                      ""
                    ];
                    data = jsonEncode(refer);
                  }
                  NetworkCall network = NetworkCall();
                  network.update_profile(basicInfobody, residentialInfoBody, refer, "3", context);
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
