import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';

import 'optionsfile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomeClass();
  }
}

class MyHomeClass extends State<HomeScreen> {
  int _currentPosition = 0;

  late List<HomePageList> homepageList;

  List<String> imgList = [
    "images/banner1.png",
    "images/banner2.png",
    "images/banner3.png",
    "images/banner4.png"
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {
    // TODO: implement initState
    homepageList = [
      HomePageList(id: "7", name: "Finance", image: "images/finance.png"),
      HomePageList(
          id: "1",
          name: "Personal Security",
          image: "images/personal_security.png"),
      HomePageList(
          id: "5",
          name: "Device Security",
          image: "images/device_security.png"),
      HomePageList(
          id: "2", name: "Value Addition", image: "images/valueaddition.png"),
      HomePageList(
          id: "6", name: "Entertainment", image: "images/entertainment.png"),
      HomePageList(
          id: "3",
          name: "Privilage Offer",
          image: "images/privilage_offer.png"),
      // HomePageList(
      //     id: "4",
      //     name: "Recharge/Bill Payment",
      //     image: "images/Rechargebillpayment.png")
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "Genie Money",
          style: TextStyle(color: Color(0xFFFFAE00)),
        ),
        leading: InkWell(
          onTap: () => ZoomDrawer.of(context)!.toggle(),
          child: const Icon(
            Icons.sort,
            color: Color(0xFFFFAE00),
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(Icons.search,
                    size: 26.0, color: Color(0xFFFFAE00)),
              )),
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.notifications,
                  color: Color(0xFFFFAE00),
                ),
              ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: height * 0.25,
                  viewportFraction: 0.85,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(seconds: 3),
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentPosition = index;
                    });
                  },
                ),
                items: imgList
                    .map(
                      (e) => ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            InkWell(
                              child: Image(
                                image: AssetImage(e),
                                width: width,
                                height: height,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: map<Widget>(
                imgList,
                (index, url) {
                  return Container(
                    width: 5.0,
                    height: 5.0,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 2.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPosition == index
                          ? const Color(0xFFFFAE00)
                          : Colors.grey,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: homepageList.map((e) {
                  return GestureDetector(
                    onTap: () {
                      ZoomDrawer.of(context)!.isOpen()
                          ? ZoomDrawer.of(context)!.toggle()
                          : Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AllOptions(e.name)));
                    },
                    child: Card(
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                          side: BorderSide(
                            color: Color(0xFFFFAE00),
                            width: 2.0,
                          )),
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      color: const Color(0xFF444444),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Ink(
                              decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x63FFAE00),
                                    blurRadius: 30.0,
                                    spreadRadius: 5.0,
                                  ),
                                ],
                              ),
                              child: Image(
                                image: AssetImage(e.image),
                                width: 70.0,
                                height: 70.0,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              child: Text(
                                e.name,
                                style: const TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 15.0,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
