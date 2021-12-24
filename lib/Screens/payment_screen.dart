import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentScreen extends StatefulWidget {
  String title;

  PaymentScreen(this.title, {Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final TextEditingController _mobile_no_controller = TextEditingController();
  final TextEditingController _prepaid_recharge_amount_controller =
      TextEditingController();
  final TextEditingController _dth_customer_no_controller =
      TextEditingController();
  final TextEditingController _dth_amount_controller = TextEditingController();
  final TextEditingController _electricity_customer_no_controller =
      TextEditingController();
  final TextEditingController _electricity_amount_controller =
      TextEditingController();
  final TextEditingController _gas_customer_no_controller =
      TextEditingController();
  final TextEditingController _gas_amount_controller = TextEditingController();
  final TextEditingController _water_customer_no_controller =
      TextEditingController();
  final TextEditingController _water_amount_controller =
      TextEditingController();
  final TextEditingController _landline_no_controller = TextEditingController();
  final TextEditingController _landline_amount_controller =
      TextEditingController();
  final TextEditingController _broadband_postpaid_no_controller =
      TextEditingController();
  final TextEditingController _broadband_postpaid_amount_controller =
      TextEditingController();
  final TextEditingController _postpaid_mobile_no_controller =
      TextEditingController();
  final TextEditingController _mobile_postpaid_amount_controller =
      TextEditingController();

  bool prepaid_recharge = false;
  bool dth = false;
  bool _show_dth = false;
  bool electricity = false;
  bool _show_electricity = false;
  bool gas = false;
  bool _show_gas = false;
  bool water = false;
  bool _show_water = false;
  bool landline = false;
  bool _show_landline = false;
  bool broadband_postpaid = false;
  bool _show_broadband_postpaid = false;
  bool postpaid_recharge = false;
  bool _show_mobile_postpaid = false;

  String prepaid_operator = 'Select Operator';
  String dth_operator = 'Select Operator';
  String electricity_operator = 'Select Operator';
  String gas_operator = 'Select Operator';
  String water_operator = 'Select Operator';
  String landline_operator = 'Select Operator';
  String broadband_postpaid_operator = 'Select Operator';
  String mobile_postpaid_operator = 'Select Operator';

  List<String> prepaid_operator_list = [
    'Select Operator',
    'Airtel',
    'BSNL',
    'BSNL J&K',
    'BSNL-Special J&K',
    'BSNL-Special Tariff',
    'Idea',
    'Reliance Jio',
    'MTNL Delhi',
    'MTNL Delhi Special',
    'MTNL Mumbai'
  ];
  List<String> dth_operator_list = [
    'Select Operator',
    'Dish TV',
    'Sun Direct TV',
    'Sun Direct TV (With Validation)',
    'TATA Sky',
    'Videocon D2H'
  ];

  List<String> electricity_operator_list = [
    'Select Operator',
    'Assam Power Distribution Company LTD (RAPDR)',
    'Assam Power Distribution Company LTD (Non-RAPDR)',
    'Ajmer Vidyut Vitran Nigam Limited (AVVNL)',
    'Bangalore Electricity Supply Co. LTD. (BESCOM)',
    'Bharatpur Electricity Services LTD. (BESL) - Old',
    'Bharatpur Electricity Services LTD. (BESL)',
    'B.E.S.T Mumbai',
    'Bikaner Electricity Supply Limited (BKESL) - Old',
    'Bikaner Electricity Supply Limited (BKESL)',
    'BSES Rajdhani Power Limited'
  ];

  List<String> gas_operator_list = [
    'Select Operator',
    'Adani Gas',
    'Aavantika Gas LTD.',
    'Charotar Gas Sahakari Mandali LTD',
    'Central U.P. Gas Limited',
    'Gujrat Gas Limited',
    'Haryana City Gas - Kapil Chopra Enterprise - Old',
    'Haryana City Gas - Kapil Chopra Enterprise',
    'Indraprastha Gas',
    'Indian Oil - Adani Gas Private Limited',
    'Mahanagar Gas Limited'
  ];

  List<String> water_operator_list = [
    'Select Operator',
    'Bhopal Municipal Corporation - Water',
    'Bangalore Water Supply And Sewerage Board',
    'Delhi Jal Board',
    'Gwalior Municipal Corporation - Water',
    'Hyderabad Metropolitan Water Supply And Sewerage Board',
    'Indore Municipal Corporation - Water',
    'Jabalpur Municipal Corporation - Water',
    'Municipal Corporation Of Gurugram',
    'Municipal Corporation Of Jalandhar',
    'Municipal Corporation Of Ludhiana - Water'
  ];

  List<String> landline_operator_list = [
    'Select Operator',
    'Airtel Landline',
    'BSNL Landline - Corporate',
    'BSNL Landline - Individual',
    'MTNL Delhi',
    'MTNL Mumbai',
    'Tata Docomo CDMA Landline'
  ];

  List<String> broadband_postpaid_operator_list = [
    'Select Operator',
    'ACT Fibernet',
    'Airtel Broadband',
    'Connect Broadband',
    'Hathway Broadband',
    'Nextra Broadband',
    'Spectranet Broadband',
    'Tikona Digital Networks Private Limited',
    'TTN Broadband'
  ];

  List<String> mobile_postpaid_operator_list = [
    'Select Operator',
    'Airtel Postpaid',
    'BSNL Mobile Postpaid',
    'Idea Postpaid',
    'Jio Postpaid',
    'Tata Docomo CDMA Mobile Postpaid',
    'Tata Docomo GSM Mobile Postpaid',
    'Vodafone Postpaid',
    'Vodafone Postpaid (Fetch & Pay)'
  ];

  void _checkName() {
    setState(() {
      if (widget.title == "Mobile Prepaid") {
        prepaid_recharge = true;
      } else if (widget.title == "DTH") {
        dth = true;
      } else if (widget.title == "Electricity") {
        electricity = true;
      } else if (widget.title == "GAS") {
        gas = true;
      } else if (widget.title == "Water") {
        water = true;
      } else if (widget.title == "Landline Postpaid") {
        landline = true;
      } else if (widget.title == "BroadBrand Postpaid") {
        broadband_postpaid = true;
      } else if (widget.title == "Mobile Postpaid") {
        postpaid_recharge = true;
      }
    });
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _checkName();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: _scaffoldKey,
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          widget.title,
          style: const TextStyle(color: Color(0xFFFFAE00)),
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
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Visibility(
                  visible: prepaid_recharge,
                  child: perpaidMobileCenter(height, width, context),
                ),
                Visibility(
                  visible: dth,
                  child: dthColumn(height, width, context),
                ),
                Visibility(
                  visible: electricity,
                  child: electricityColumn(height, width, context),
                ),
                Visibility(
                  visible: gas,
                  child: gasColumn(height, width, context),
                ),
                Visibility(
                  visible: water,
                  child: waterColumn(height, width, context),
                ),
                Visibility(
                  visible: landline,
                  child: landlineColumn(height, width, context),
                ),
                Visibility(
                  visible: broadband_postpaid,
                  child: broadband_postpaid_Column(height, width, context),
                ),
                Visibility(
                  visible: postpaid_recharge,
                  child: mobile_postpaid_Column(height, width, context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column mobile_postpaid_Column(
      double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF3A3A3A),
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
            isDense: true,
          ),
          value: mobile_postpaid_operator,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (String? data) {
            setState(() {
              mobile_postpaid_operator = data!;
              if (mobile_postpaid_operator == "Select Operator") {
                _show_mobile_postpaid = false;
              } else {
                _show_mobile_postpaid = true;
              }
            });
          },
          items: mobile_postpaid_operator_list
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Visibility(
          visible: _show_mobile_postpaid,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _postpaid_mobile_no_controller,
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
                    label: const Text(
                      "Mobile Number",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _mobile_postpaid_amount_controller,
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
                    label: const Text(
                      "Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.4493,
              ),
              ElevatedButton(
                child: const Text(
                  "PAY",
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(width, MediaQuery.of(context).size.height * 0.05),
                  primary: const Color(0xFFFFAE00),
                  shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column broadband_postpaid_Column(
      double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF3A3A3A),
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
            isDense: true,
          ),
          value: broadband_postpaid_operator,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (String? data) {
            setState(() {
              broadband_postpaid_operator = data!;
              if (broadband_postpaid_operator == "Select Operator") {
                _show_broadband_postpaid = false;
              } else {
                _show_broadband_postpaid = true;
              }
            });
          },
          items: broadband_postpaid_operator_list
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Visibility(
          visible: _show_broadband_postpaid,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _broadband_postpaid_no_controller,
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
                    label: const Text(
                      "Customer ID",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _broadband_postpaid_amount_controller,
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
                    label: const Text(
                      "Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.4493,
              ),
              ElevatedButton(
                child: const Text(
                  "PAY",
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(width, MediaQuery.of(context).size.height * 0.05),
                  primary: const Color(0xFFFFAE00),
                  shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column landlineColumn(double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF3A3A3A),
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
            isDense: true,
          ),
          value: landline_operator,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (String? data) {
            setState(() {
              landline_operator = data!;
              if (landline_operator == "Select Operator") {
                _show_landline = false;
              } else {
                _show_landline = true;
              }
            });
          },
          items: landline_operator_list
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Visibility(
          visible: _show_landline,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _landline_no_controller,
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
                    label: const Text(
                      "Landline Number with STD Code",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _landline_amount_controller,
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
                    label: const Text(
                      "Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.4493,
              ),
              ElevatedButton(
                child: const Text(
                  "PAY",
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(width, MediaQuery.of(context).size.height * 0.05),
                  primary: const Color(0xFFFFAE00),
                  shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column waterColumn(double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF3A3A3A),
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
            isDense: true,
          ),
          value: water_operator,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (String? data) {
            setState(() {
              water_operator = data!;
              if (water_operator == "Select Operator") {
                _show_water = false;
              } else {
                _show_water = true;
              }
            });
          },
          items:
              water_operator_list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Visibility(
          visible: _show_water,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _water_customer_no_controller,
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
                    label: const Text(
                      "Connection ID",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _water_amount_controller,
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
                    label: const Text(
                      "Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.4493,
              ),
              ElevatedButton(
                child: const Text(
                  "PAY",
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(width, MediaQuery.of(context).size.height * 0.05),
                  primary: const Color(0xFFFFAE00),
                  shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column gasColumn(double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF3A3A3A),
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
            isDense: true,
          ),
          value: gas_operator,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (String? data) {
            setState(() {
              gas_operator = data!;
              if (gas_operator == "Select Operator") {
                _show_gas = false;
              } else {
                _show_gas = true;
              }
            });
          },
          items:
              gas_operator_list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Visibility(
          visible: _show_gas,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _gas_customer_no_controller,
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
                    label: const Text(
                      "Customer ID",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _gas_amount_controller,
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
                    label: const Text(
                      "Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.4493,
              ),
              ElevatedButton(
                child: const Text(
                  "PAY",
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(width, MediaQuery.of(context).size.height * 0.05),
                  primary: const Color(0xFFFFAE00),
                  shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column electricityColumn(double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF3A3A3A),
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
            isDense: true,
          ),
          value: electricity_operator,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (String? data) {
            setState(() {
              electricity_operator = data!;
              if (electricity_operator == "Select Operator") {
                _show_electricity = false;
              } else {
                _show_electricity = true;
              }
            });
          },
          items: electricity_operator_list
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Visibility(
          visible: _show_electricity,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _electricity_customer_no_controller,
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
                    label: const Text(
                      "Customer ID",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _electricity_amount_controller,
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
                    label: const Text(
                      "Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.4493,
              ),
              ElevatedButton(
                child: const Text(
                  "PAY",
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(width, MediaQuery.of(context).size.height * 0.05),
                  primary: const Color(0xFFFFAE00),
                  shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Column dthColumn(double height, double width, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButtonFormField<String>(
          dropdownColor: const Color(0xFF3A3A3A),
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
            isDense: true,
          ),
          value: dth_operator,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (String? data) {
            setState(() {
              dth_operator = data!;
              if (dth_operator == "Select Operator") {
                _show_dth = false;
              } else {
                _show_dth = true;
              }
            });
          },
          items:
              dth_operator_list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        Visibility(
          visible: _show_dth,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _dth_customer_no_controller,
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
                    label: const Text(
                      "Customer Number",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: TextField(
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  controller: _dth_amount_controller,
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
                    label: const Text(
                      "Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.4493,
              ),
              ElevatedButton(
                child: const Text(
                  "PAY",
                  style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize:
                      Size(width, MediaQuery.of(context).size.height * 0.05),
                  primary: const Color(0xFFFFAE00),
                  shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }

  Center perpaidMobileCenter(
      double height, double width, BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(top: height * 0.15),
        child: Card(
          color: const Color(0xFF3A3A3A),
          shadowColor: const Color(0xFF3A3A3A),
          elevation: 10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Select Operator*",
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18.0),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: DropdownButtonFormField<String>(
                    dropdownColor: const Color(0xFF3A3A3A),
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
                      isDense: true,
                    ),
                    value: prepaid_operator,
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
                        prepaid_operator = data!;
                      });
                    },
                    items: prepaid_operator_list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: const Text(
                    "Mobile Number*",
                    style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.number,
                    maxLength: 10,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _mobile_no_controller,
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
                      hintText: "Enter Here",
                      hintStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: const Text(
                    "Amount*",
                    style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 18.0,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 5.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    controller: _prepaid_recharge_amount_controller,
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
                      hintText: "Amount",
                      hintStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 15.0),
                  child: ElevatedButton(
                    child: const Text(
                      "PROCEED",
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(
                          width, MediaQuery.of(context).size.height * 0.05),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
