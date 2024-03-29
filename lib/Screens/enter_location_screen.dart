import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/pincode_model.dart';
import 'package:genie_money/utils/location_finder.dart';
import 'package:genie_money/utils/network.dart';
import 'package:geocoding/geocoding.dart';
import 'package:location/location.dart';

class EnterLocation extends StatefulWidget {
  const EnterLocation({Key? key}) : super(key: key);

  @override
  _EnterLocationState createState() => _EnterLocationState();
}

class _EnterLocationState extends State<EnterLocation> {
  final TextEditingController _address_1_controller = TextEditingController();
  final TextEditingController _address_2_controller = TextEditingController();
  final TextEditingController _pin_code_controller = TextEditingController();
  final TextEditingController _city_controller = TextEditingController();
  final TextEditingController _state_controller = TextEditingController();

  late String _currentAddress = "";

  // late final Geolocator geolocator;

  late String longitude = '00.00000';
  late String latitude = '00.00000';
  late PermissionStatus permission;
  late bool serviceEnabled = false;
  late bool useCurrent = false;

  Future<void> GetAddressFromLatLong() async {
    if (_currentAddress.isEmpty) {
      LocationFinder locationFinder = LocationFinder();
      LocationData locationData = await locationFinder.getLocation();
      double longitude = locationData.longitude ?? 0.0000;
      double latitude = locationData.latitude ?? 0.0000;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      setState(() {
        if (_currentAddress.isEmpty) {
          _currentAddress =
              '${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.thoroughfare}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';
        }
      });
      print(_currentAddress);
    }
  }

  late Future<Pincode_model> pincode_model;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    GetAddressFromLatLong();
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: const Text(
            "Enter Location",
            style: TextStyle(
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
                InkWell(
                  onTap: () {
                    setState(() {
                      if (useCurrent) {
                        useCurrent = false;
                      } else {
                        useCurrent = true;
                      }
                    });
                  },
                  child: Card(
                    color: const Color(0xFF3A3A3A),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                      side: BorderSide(
                        color: Color(0xFFFFAE00),
                        width: 2.0,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.my_location,
                            color: Color(0xFFFFAE00),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: const Text(
                              "Use My Current Location",
                              style: TextStyle(
                                  color: Color(0xFFFFAE00), fontSize: 16.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: useCurrent,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      _currentAddress,
                      style: const TextStyle(
                        color: Color(0xFFFFAE00),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: const Text(
                    "OR",
                    style: TextStyle(
                      color: Color(0xFFFFAE00),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: width,
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    "Enter Address",
                    style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.number,
                    controller: _pin_code_controller,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
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
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Pin Code',
                      isDense: true,
                    ),
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        if (text.length == 6) {
                          NetworkCall networkCall = NetworkCall();
                          networkCall
                              .getStateAndCity(
                                  _pin_code_controller.text, context)
                              .then((value) => {
                                    setState(() {
                                      _state_controller.text = value.postOffice
                                              ?.elementAt(0)
                                              .state ??
                                          "";
                                      _city_controller.text = value.postOffice
                                              ?.elementAt(0)
                                              .district ??
                                          "";
                                    })
                                  });
                        } else if (text.length > 6) {
                          _createToast("Please enter valid pin code");
                        }
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.streetAddress,
                    controller: _state_controller,
                    maxLines: 1,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
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
                      // hintText: 'Email / Mobile No.',
                      labelText: 'State',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.streetAddress,
                    controller: _city_controller,
                    maxLines: 1,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
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
                      // hintText: 'Email / Mobile No.',
                      labelText: 'City',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.streetAddress,
                    controller: _address_1_controller,
                    minLines: 1,
                    maxLines: 10,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
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
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Address Line 1',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.streetAddress,
                    controller: _address_2_controller,
                    minLines: 1,
                    maxLines: 10,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
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
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Address Line 2',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0),
                  child: ElevatedButton(
                    onPressed: () async {},
                    child: const Text(
                      "Submit",
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
