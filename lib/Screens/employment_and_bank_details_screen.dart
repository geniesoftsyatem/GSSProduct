import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/utils/constants.dart';
import 'package:genie_money/utils/network.dart';
import 'package:intl/intl.dart';

import '../Model/bank_details_model.dart';
import '../Model/employment_details_model.dart';

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
  String job_function_id = "1", work_sector_id = "1", organisation_id = "1";

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
  final TextEditingController _date_controller = TextEditingController();

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

  NetworkCall _networkCall = NetworkCall();
  List<Employmentdetail>? employmentdetail = [];
  List<Bankdetail>? bankdetail = [];
  String ue_id = "", ub_id = "";

  @override
  void initState() {
    super.initState();
    if (widget.title == "Employment Details") {
      isEmployment = true;
      _networkCall.getEmploymentDetails().then((value) => {
        if(value.employmentdetail != null && value.employmentdetail!.isNotEmpty) {
          for (int i = 0; i < value.employmentdetail!.length; i++) {
            setState(() {
              employmentdetail!.add(value.employmentdetail![i]);
            }),
          },
          setState(() {
            ue_id = employmentdetail![6].ueId!;
            emp_type = employmentdetail![6].ueEmptype! == "1" ? "Salaried" : employmentdetail![6].ueEmptype! == "2" ? "UnEmployed" : "Self-Employed";
            _employer_name_controller.text = employmentdetail![6].ueEmployername!;
            _official_email_controller.text = employmentdetail![6].ueOfficeemail!;
            _date_controller.text = employmentdetail![6].ueWorkingsince!;
            _net_monthly_salary_controller.text = employmentdetail![6].ueMonthsalary!;
            salary_type = employmentdetail![6].ueSalaryaccount!;
            if (isNumeric(employmentdetail![6].ueDesignation!)) {
              int a = int.parse(employmentdetail![6].ueDesignation!);
              for (int i = 0; i < designation_type_list.length; i++) {
                if ((a - 1) == i) {
                  designation_type = designation_type_list[i];
                }
              }
            } else {
              designation_type = employmentdetail![6].ueDesignation!;
            }
            work_sector_id = employmentdetail![6].ueWorksector!;
            if (work_sector_id.isNotEmpty && int.parse(work_sector_id) > 0) {
              int a = int.parse(work_sector_id);
              for (int i = 0; i < work_sector_type_list.length; i++) {
                if ((a - 1) == i) {
                  work_sector_type = work_sector_type_list[i];
                }
              }
            }
            organisation_id = employmentdetail![6].ueOrgtype!;
            if (organisation_id.isNotEmpty && int.parse(organisation_id) > 0) {
              int a = int.parse(organisation_id);
              for (int i = 0; i < organization_type_list.length; i++) {
                if ((a - 1) == i) {
                  organization_type = organization_type_list[i];
                }
              }
            }
            _office_address_controller.text = employmentdetail![6].ueOfficeaddress!;
          }),
        }
      });
    } else if (widget.title == "Bank Details") {
      isBank = true;
      _networkCall.getbankDetails().then((value) => {
        if (value.bankdetail != null && value.bankdetail!.isNotEmpty) {
          for (int i = 0; i < value.bankdetail!.length; i++) {
            bankdetail!.add(value.bankdetail![i]),
          },
          setState((){
            ub_id = bankdetail![0].ubId!;
            _bank_name_controller.text = bankdetail![0].ubName!;
            _account_no_controller.text = bankdetail![0].ubAcnumber!;
            _confirm_account_no_controller.text = bankdetail![0].ubAcnumber!;
            _ifsc_code_controller.text = bankdetail![0].ubIfsccode!;
            _upi_id_controller.text = bankdetail![0].ubUpi!;
    }),
        }
      });
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
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
                          controller: _date_controller,
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
                              for (int i = 0; i < job_function_type_list.length; i++) {
                                if (job_function_type == job_function_type_list[i]) {
                                  int selected = i++;
                                  job_function_id = selected.toString();
                                }
                              }
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
                              for (int i = 0; i < work_sector_type_list.length; i++) {
                                if (work_sector_type == work_sector_type_list[i]) {
                                  int selected = i + 1;
                                  work_sector_id = selected.toString();
                                }
                              }
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
                              for (int i = 0; i < organization_type_list.length; i++) {
                                if (organization_type == organization_type_list[i]) {
                                  int selected = i + 1;
                                  organisation_id = selected.toString();
                                }
                              }
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
                          onPressed: () {
                            if (_employer_name_controller.text.isNotEmpty) {
                              if (_official_email_controller.text.isNotEmpty) {
                                if (_date_controller.text.isNotEmpty) {
                                  if (_net_monthly_salary_controller.text.isNotEmpty) {
                                    if (_office_address_controller.text.isNotEmpty) {
                                      final data = {
                                        "ue_id" : ue_id,
                                        "ue_userid" : Constants.userid,
                                        "ue_emptype" : emp_type == "Salaried" ? "1" : emp_type == "UnEmployed" ? "2" : "3",
                                        "ue_employername" : _employer_name_controller.text,
                                        "ue_officeemail" : _official_email_controller.text,
                                        "ue_workingsince" : _date_controller.text,
                                        "ue_monthsalary" : _net_monthly_salary_controller.text,
                                        "ue_salaryaccount" : salary_type,
                                        "ue_jobcategory" : job_function_id,
                                        "ue_designation" : designation_type,
                                        "ue_worksector" : work_sector_id,
                                        "ue_orgtype" : organisation_id,
                                        "ue_officeaddress" : _office_address_controller.text
                                      };
                                      final employmentdetail = [
                                        data
                                      ];
                                      _networkCall.update_employment(employmentdetail, context);
                                    } else {
                                      _createToast("Please enter work/office address");
                                    }
                                  } else {
                                    _createToast("Please enter net monthly salary");
                                  }
                                } else {
                                  _createToast("Please enter working since");
                                }
                              } else {
                                _createToast("Please enter official email");
                              }
                            } else {
                              _createToast("Please enter employer name");
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
                          onPressed: () {
                            if (_bank_name_controller.text.isNotEmpty) {
                              if (_account_no_controller.text.isNotEmpty) {
                                if (_confirm_account_no_controller.text.isNotEmpty) {
                                  if (_confirm_account_no_controller.text == _account_no_controller.text) {
                                    if (_ifsc_code_controller.text.isNotEmpty) {
                                      if (_upi_id_controller.text.isNotEmpty) {
                                        final data = {
                                          "ub_id" : ub_id,
                                          "ub_userid" : Constants.userid,
                                          "ub_name" : _bank_name_controller.text,
                                          "ub_acnumber" : _account_no_controller.text,
                                          "ub_ifsccode" : _ifsc_code_controller.text,
                                          "ub_upi" : _upi_id_controller.text
                                        };
                                        final bankDetails = [
                                          data
                                        ];
                                        _networkCall.update_bank(bankDetails, context);
                                      } else {
                                        _createToast("Please enter upi id");
                                      }
                                    } else {
                                      _createToast("Please enter IFSC code");
                                    }
                                  } else {
                                    _createToast("Account number does not match");
                                  }
                                } else {
                                  _createToast("Please confirm account number");
                                }
                              } else {
                                _createToast("Please enter account number");
                              }
                            } else {
                              _createToast("Please enter bank name");
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
                )
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
