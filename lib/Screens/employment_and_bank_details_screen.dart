import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EmploymentAndBankDetailsScreen extends StatefulWidget {
  // const EmploymentAndBankDetailsScreen({Key? key}) : super(key: key);

  String title;

  EmploymentAndBankDetailsScreen(this.title, {Key? key}) : super(key: key);

  @override
  _EmploymentAndBankDetailsScreenState createState() =>
      _EmploymentAndBankDetailsScreenState();
}

class _EmploymentAndBankDetailsScreenState
    extends State<EmploymentAndBankDetailsScreen> {
  bool isEmployment = false;
  bool isBank = false;

  String emp_type = 'Salaried';
  String salary_type = 'Direct Account Transfer';
  String job_function_type = 'Research and development (R & D)';
  String designation_type = 'Executive';
  String work_sector_type = 'Agriculture';
  String organization_type = 'Private Company';

  final format = DateFormat("dd-MM-yyyy");

  final TextEditingController _employer_name_controller =
      TextEditingController();
  final TextEditingController _official_email_controller =
      TextEditingController();
  final TextEditingController _net_monthly_salary_controller =
      TextEditingController();
  final TextEditingController _office_address_controller =
      TextEditingController();
  final TextEditingController _bank_name_controller = TextEditingController();
  final TextEditingController _account_no_controller = TextEditingController();
  final TextEditingController _confirm_account_no_controller =
      TextEditingController();
  final TextEditingController _ifsc_code_controller = TextEditingController();
  final TextEditingController _upi_id_controller = TextEditingController();

  List<String> emp_type_list = ['Salaried', 'UnEmployed', 'Self-Employed'];

  List<String> salary_type_list = ['Direct Account Transfer', 'Cheque', 'Cash'];

  List<String> job_function_type_list = [
    'Research and development (R & D)',
    'Administration',
    'Customer Service',
    'Sales',
    'Marketing',
    'IT and Engineering',
    'Human resources',
    'Finance',
    'Operations',
    'Legal and Audit',
    'Others'
  ];

  List<String> designation_type_list = [
    'Executive',
    'Middle Management',
    'Sr. Management',
    'Leadership role'
  ];

  List<String> work_sector_type_list = [
    'Agriculture',
    'Banking and Financial Services',
    'Construction, Real Estate and Infrastructure',
    'Education and Training',
    'Government and public administration',
    'Healthcare',
    'Information Technology',
    'Legal',
    'Manufacturing',
    'Media, Sports and Entertainment',
    'Oil and Gases',
    'Security and Law Enforcement',
    'Trade and Commerce',
    'Transport and Logistics',
    'Tourism and Hospitality',
    'Others'
  ];

  List<String> organization_type_list = [
  'Private Company',
  'Public Company',
  'Listed Public Company',
  'State Government',
  'Central Government',
  'Partnership Firm',
  'Proprietorship Firm',
  'Limited Liability Partnership (LLP)',
  'Trust'
  ];

  @override
  void initState() {
    super.initState();
    if (widget.title == "Employment Details") {
      isEmployment = true;
    } else if (widget.title == "Bank Details") {
      isBank = true;
    }
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
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Visibility(
                  visible: isEmployment,
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                            label: Text("Employment Type"),
                            isDense: true,
                          ),
                          value: emp_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFFFAE00),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              emp_type = data!;
                            });
                          },
                          items: emp_type_list
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
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _employer_name_controller,
                          keyboardType: TextInputType.name,
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'Employer Name',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _official_email_controller,
                          keyboardType: TextInputType.emailAddress,
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'Official Email',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DateTimeField(
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'Working Since',
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
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _net_monthly_salary_controller,
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'Net Monthly Salary',
                            isDense: true,
                          ),
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                            label: Text("Salary Received By"),
                            isDense: true,
                          ),
                          value: salary_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFFFAE00),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              salary_type = data!;
                            });
                          },
                          items: salary_type_list
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
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xFF111111),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                            label: Text("Job Function"),
                            isDense: true,
                          ),
                          value: job_function_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFFFAE00),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              job_function_type = data!;
                            });
                          },
                          items: job_function_type_list
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
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xFF111111),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                            label: Text("Designation"),
                            isDense: true,
                          ),
                          value: designation_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFFFAE00),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              designation_type = data!;
                            });
                          },
                          items: designation_type_list
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
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xFF111111),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                            label: Text("Work Sector"),
                            isDense: true,
                          ),
                          value: work_sector_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFFFAE00),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              work_sector_type = data!;
                            });
                          },
                          items: work_sector_type_list
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
                        child: DropdownButtonFormField<String>(
                          dropdownColor: const Color(0xFF111111),
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                            label: Text("Organization"),
                            isDense: true,
                          ),
                          value: organization_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Color(0xFFFFAE00),
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: Color(0xFFFFAE00), fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              organization_type = data!;
                            });
                          },
                          items: organization_type_list
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
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _office_address_controller,
                          keyboardType: TextInputType.streetAddress,
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'Work / Office Address',
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
                Visibility(
                  visible: isBank,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _bank_name_controller,
                          keyboardType: TextInputType.name,
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'Bank Name',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _account_no_controller,
                          keyboardType: TextInputType.number,
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'Account Number',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _confirm_account_no_controller,
                          keyboardType: TextInputType.number,
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'Confirm Account Number',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _ifsc_code_controller,
                          keyboardType: TextInputType.text,
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'IFSC Code',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _upi_id_controller,
                          keyboardType: TextInputType.text,
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
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'UPI id',
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
