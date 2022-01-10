import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:genie_money/Screens/address_screen.dart';
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

  final format = DateFormat("dd-MM-yyyy");

  String qualification_type = 'Undergraduate';

  List<String> qualification_type_list = [
    'Undergraduate',
    'Graduate',
    'Postgraduate'
  ];

  bool isToggle = true;
  bool show_permanent_address = true;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
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
              _reference(width),
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
                    setState(() {
                      _current_address_controller.text = result;
                    });
                  }
                },
                readOnly: true,
                style: const TextStyle(color: Color(0xFFFFAE00)),
                controller: _current_address_controller,
                keyboardType: TextInputType.none,
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
                            setState(() {
                              _permanent_address_controller.text = result;
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
                  _tabController.animateTo(2);
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

  Widget _reference(double width) {
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
                onPressed: () {},
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
}
