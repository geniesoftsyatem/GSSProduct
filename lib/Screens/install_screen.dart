import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_apps/device_apps.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:genie_shield/utils/screen_sizes.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class InstallApps extends StatefulWidget {
  String name;

  InstallApps(this.name, {Key? key}) : super(key: key);

  @override
  _InstallApps createState() {
    // TODO: implement createState
    return _InstallApps();
  }
}

class _InstallApps extends State<InstallApps> {
  late List<String> image_list;
  late String _fileUrl = "";
  late String _fileName = "";
  late String open_path = "";
  final Dio _dio = Dio();

  late double _progress = 0.0;
  late int percentage = 0;
  late String display_percent = "";
  bool install_visible = true;
  bool progress_visible = false;
  bool open_visible = false;
  late String app_package_name;
  late String title;
  late String description;

  @override
  void initState() {
    if (widget.name == "Spy Camera" || widget.name == "Life Saver" || widget.name == "Secure Chat" || widget.name == "Anti Hacking" || widget.name == "Anti Virus" || widget.name == "Anti Theft" || widget.name == "Wi-Fi Protect") {
      image_list = [
        "images/notification_gs.png",
        "images/securechat_gs.png",
        "images/info_gs.png",
        "images/antitheft_gs.png",
        "images/lock_gs.png",
      ];
      _fileUrl = "http://143.110.176.111/genieshield/security.apk";
      _fileName = "security.apk";
      app_package_name = "com.gss.genieshield";
      title = "Install the App to Secure you and your device..";
      description = "Some features are:- \n Spy Camera, Life Saver, Secure Chat, Scan, Anti Phishing, Secure, Permission, Social Media Checker, Device Status, Password Safe, Pay Safe, Hidden App Detector, Ad Detector, Full Scan, Application Scan, Battery Save, Phone Cooler, Alarm Alert, SMS Alert, Email Alert, Data Access Alert, Restart Alert, Plug-in / Plug-Out, Motion Alert, Pocket Alert, List, Alarm Alert, Device Location, Format Device, Photo Front Camera, Photo Back Camera, Show Message on Screen, Record Video Front Camera, Record Video Back Camera, Lock Device, Get Contact List, Get Call Log, Torch Light On, Torch Light Off, Location History, Call Filter, Privacy Protection & more…";
    } else if (widget.name == "YouTube Video"){
      image_list = [
        "images/youtube_gs_1.png",
        "images/youtube_gs_2.png",
        "images/youtube_gs_3.png",
        "images/youtube_gs_4.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/youtube.apk";
      _fileName = "youtube.apk";
      app_package_name = "com.vanced.android.youtube";
      title = "Youtube Video";
      description = "Enjoy the Ad-free youtube videos and also play when offline.";
    } else {
      image_list = [
        "images/youtube_music_gs_1.png",
        "images/youtube_music_gs_2.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/youtubemusic.apk";
      _fileName = "youtubemusic.apk";
      app_package_name = "com.vanced.android.apps.youtube.music";
      title = "Youtube Music";
      description = "Enjoy the Ad-free youtube music and also play when offline.";
    }
    _getPackageStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    String option = widget.name;
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal! * 90;
    double height = SizeConfig.blockSizeVertical! * 40;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          option,
          style: const TextStyle(
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
          margin: EdgeInsets.only(top: height / 5, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlay: true,
                    // onPageChanged: (index, reason) {
                    //   setState(() {
                    //     _currentPosition = index;
                    //   });
                    // },
                  ),
                  items: image_list
                      .map(
                        (e) => ClipRRect(
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  child: Image(
                                    image: AssetImage(e),
                                    width: width,
                                    height: height,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: Center(
                          child: Text(
                            title,
                            style: const TextStyle(
                                color: Color(0xFFFFAE00),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30.0),
                        child: const Text(
                          "Some features are:- \n Spy Camera, Life Saver, Secure Chat, Scan, Anti Phishing, Secure, Permission, Social Media Checker, Device Status, Password Safe, Pay Safe, Hidden App Detector, Ad Detector, Full Scan, Application Scan, Battery Save, Phone Cooler, Alarm Alert, SMS Alert, Email Alert, Data Access Alert, Restart Alert, Plug-in / Plug-Out, Motion Alert, Pocket Alert, List, Alarm Alert, Device Location, Format Device, Photo Front Camera, Photo Back Camera, Show Message on Screen, Record Video Front Camera, Record Video Back Camera, Lock Device, Get Contact List, Get Call Log, Torch Light On, Torch Light Off, Location History, Call Filter, Privacy Protection & more…",
                          style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: install_visible,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: ElevatedButton(
                    child: const Text(
                      "Install",
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 18.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 25.0),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      _download();
                    },
                  ),
                ),
              ),
              Visibility(
                visible: progress_visible,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: FAProgressBar(
                    backgroundColor: const Color(0xFF3A3A3A),
                    maxValue: 100,
                    progressColor: const Color(0xFFFFAE00),
                    displayText: display_percent+ "%",
                    currentValue: percentage,
                  ),
                ),
              ),
              Visibility(
                visible: open_visible,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                  child: ElevatedButton(
                    child: const Text(
                      "Open",
                      style: TextStyle(
                        color: Color(0xFF111111),
                        fontSize: 18.0,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width, 25.0),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () async {
                      if(open_path.isEmpty) {
                        bool isInstalled = await DeviceApps.isAppInstalled(app_package_name);
                        if(isInstalled) {
                          DeviceApps.openApp(app_package_name);
                        }
                      } else {
                        OpenFile.open(open_path);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Directory?> _getDownloadDirectory() async {
    if (Platform.isAndroid) {
      final baseStorage = await getExternalStorageDirectory();

      return baseStorage;
    }

    // in this example we are using only Android and iOS so I can assume
    // that you are not trying it for other platforms and the if statement
    // for iOS is unnecessary

    // iOS directory visible to user
    return await getApplicationDocumentsDirectory();
  }

  Future<bool> _requestPermissions() async {
    var status = await Permission.storage.request();

    if (status.isGranted) {
      return status.isGranted;
    } else {
      return status.isDenied;
    }
  }

  Future<void> _download() async {
    final dir = await _getDownloadDirectory();
    final isPermissionStatusGranted = await _requestPermissions();

    if (isPermissionStatusGranted) {
      final savePath = path.join(dir!.path, _fileName);
      await _startDownload(savePath);
    } else {
      // handle the scenario when user declines the permissions
    }
  }

  Future<void> _startDownload(String savePath) async {
    open_path = savePath;
    final response = await _dio.download(_fileUrl, savePath,
        onReceiveProgress: onReceiveProgress);
  }

  void onReceiveProgress(int received, int total) {
    if (total != -1) {
      int a = (received / total * 100).truncate();
      setState(() {
        if (a == 100.0) {
          setState(() {
            install_visible = false;
            progress_visible = false;
            open_visible = true;
            percentage = a;
          });
        } else {
          setState(() {
            install_visible = false;
            progress_visible = true;
            open_visible = false;
            percentage = a;
          });
        }
      });
    }
  }

  _getPackageStatus() async {
    Application? app = await DeviceApps.getApp(app_package_name);
    bool isInstalled = await DeviceApps.isAppInstalled(app_package_name);
    if(isInstalled) {
      setState(() {
        install_visible = false;
        progress_visible = false;
        open_visible = true;
      });
    } else {
      setState(() {
        install_visible = true;
        progress_visible = false;
        open_visible = false;
      });
    }
  }
}
