import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/pincode_model.dart';
import 'package:genie_money/utils/location_finder.dart';
import 'package:genie_money/utils/network.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class PortfolioScreen extends StatefulWidget {
  const PortfolioScreen({Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _name_controller = TextEditingController();
  final TextEditingController _mobile_no_controller = TextEditingController();
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _address_controller = TextEditingController();
  final TextEditingController _pin_code_controller = TextEditingController();
  final TextEditingController _state_controller = TextEditingController();
  final TextEditingController _city_controller = TextEditingController();
  final TextEditingController _address_1_controller = TextEditingController();
  final TextEditingController _address_2_controller = TextEditingController();
  final TextEditingController _about_us_controller = TextEditingController();
  final TextEditingController _facebook_controller = TextEditingController();
  final TextEditingController _whatsapp_controller = TextEditingController();
  final TextEditingController _youtube_controller = TextEditingController();
  final TextEditingController _twitter_controller = TextEditingController();

  bool useCurrent = false;
  late String _currentAddress = "";
  late String longitude = '00.00000';
  late String latitude = '00.00000';
  late PermissionStatus permission;
  late bool serviceEnabled = false;

  late List<File> pageviewList = [];

  late AnimationController _animationController;
  late Animation<double> _nextPage;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

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
  var _adsImage;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    //Add listener to AnimationController for know when end the count and change to the next page
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reset(); //Reset the controller
        const int page = 4; //Number of pages in your PageView
        if (_currentPage < page) {
          _currentPage++;
          _pageController.animateToPage(_currentPage,
              duration: const Duration(milliseconds: 5000),
              curve: Curves.easeInSine);
        } else {
          _currentPage = 0;
        }
      }
    });
    setState(() {
      _name_controller.text = "Sharad Yadav";
      _mobile_no_controller.text = "9873523232";
      _email_controller.text = "sharadyadav@gmail.com";
      _about_us_controller.text = "I am retailer";
      _facebook_controller.text = "https://m.facebook.com";
      _whatsapp_controller.text = "https://api.whatsapp.com";
      _youtube_controller.text = "https://m.youtube.com/channel";
      _twitter_controller.text = "https://mobile.twitter.com";
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    GetAddressFromLatLong();
    if (pageviewList.length > 0) {
      _animationController.forward(); //Start controller with widget
      print(_nextPage.value);
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: const Icon(Icons.share),
            color: Colors.white,
            onPressed: () {},
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(CupertinoIcons.pencil_circle),
              color: Colors.white,
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.40,
                child: pageviewList.length > 0
                    ? PageView.builder(
                        itemCount: pageviewList.length,
                        scrollDirection: Axis.horizontal,
                        controller: _pageController,
                        onPageChanged: (value) {
                          //When page change, start the controller
                          _animationController.forward();
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Container(
                              constraints: const BoxConstraints.expand(
                                height: 200.0,
                              ),
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(
                                  left: 16.0, bottom: 8.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: FileImage(
                                    pageviewList[index],
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _showPicker(context);
                                    },
                                    icon:
                                        const Icon(Icons.cloud_upload_outlined),
                                    color: Colors.white,
                                    iconSize: 40.0,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      _showPicker(context);
                                    },
                                    icon: const Icon(Icons.delete_outline),
                                    color: Colors.white,
                                    iconSize: 40.0,
                                  ),
                                ],
                              ),
                            ),
                          );
                        })
                    : Container(
                        constraints: const BoxConstraints.expand(
                          height: 200.0,
                        ),
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.only(left: 16.0, bottom: 8.0),
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/image_not_available.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: IconButton(
                          onPressed: () {
                            _showPicker(context);
                          },
                          icon: const Icon(Icons.cloud_upload_outlined),
                          color: Colors.white,
                          iconSize: 40.0,
                        ),
                      ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.person_alt_circle,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _name_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Name",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.phone,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _mobile_no_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Mobile No.",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.mail,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Email",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.location,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        minLines: 1,
                        maxLines: 5,
                        readOnly: true,
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _address_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Address",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                        onTap: () {
                          _showDialog(width);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.person_alt_circle,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _about_us_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "About us",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("images/facebook.png"),
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _facebook_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Facebook",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("images/whatsapp.png"),
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _whatsapp_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Whatsapp",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("images/youtube.png"),
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _youtube_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Youtube",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("images/twitter.png"),
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _twitter_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Twitter",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
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

  _showDialog(double width) {
    showDialog<String>(
      context: context,
      builder: (context) =>
          StatefulBuilder(builder: (BuildContext context, setState) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(5.0),
          content: Container(
            margin: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (useCurrent) {
                          useCurrent = false;
                          // setVisibility(false);
                        } else {
                          useCurrent = true;
                          // setVisibility(true);
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
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: useCurrent == true ? true : false,
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
                  Visibility(
                    visible: useCurrent == false ? true : false,
                    child: Column(
                      children: [
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
                            style: TextStyle(
                                color: Color(0xFFFFAE00), fontSize: 18.0),
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
                                              _state_controller.text = value
                                                      .postOffice
                                                      ?.elementAt(0)
                                                      .state ??
                                                  "";
                                              _city_controller.text = value
                                                      .postOffice
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
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Address Line 2',
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (useCurrent) {
                          setState(() {
                            _address_controller.text = _currentAddress;
                          });
                        } else {
                          setState(() {
                            _address_controller.text =
                                _address_1_controller.text +
                                    ", " +
                                    _address_2_controller.text +
                                    ", " +
                                    _city_controller.text +
                                    ", " +
                                    _state_controller.text +
                                    ", " +
                                    _pin_code_controller.text;
                          });
                        }
                        Navigator.of(context).pop();
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
        );
      }),
    );
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Gallery'),
                    onTap: () {
                      _imgFromGallery();
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera();
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    _adsImage = image == null ? null : File(image.path);
    setState(() {
      pageviewList.add(_adsImage);
    });
  }

  _imgFromGallery() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    _adsImage = image == null ? null : File(image.path);
    setState(() {
      pageviewList.add(_adsImage);
    });
  }
}
