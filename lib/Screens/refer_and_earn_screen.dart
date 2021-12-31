import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class ReferAndEarnScreen extends StatefulWidget {
  const ReferAndEarnScreen({Key? key}) : super(key: key);

  @override
  _ReferAndEarnScreenState createState() => _ReferAndEarnScreenState();
}

class _ReferAndEarnScreenState extends State<ReferAndEarnScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: const Text(
            "Refer & Earn",
            style: TextStyle(color: Color(0xFFFFAE00)),
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    "REFER MORE, EARN MORE",
                    style: TextStyle(color: Color(0xFFFFAE00), fontSize: 20.0),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Image(
                    image: AssetImage("images/refer_and_earn_screen.png"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: const Text(
                    "Earn ₹300 on every invited friend's first",
                    style: TextStyle(color: Color(0xFFFFAE00), fontSize: 17.0),
                  ),
                ),
                const Text(
                  "benefit while your friends enjoy",
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 17.0),
                ),
                const Text(
                  "50% off on processing fee.",
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 17.0),
                ),
                Container(
                  margin: EdgeInsets.only(top: height * 0.10),
                  width: width * 0.70,
                  child: Row(
                    children: [
                      const Icon(
                        Icons.lightbulb_sharp,
                        color: Color(0xFFFFAE00),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10.0),
                        child: const Text(
                          "Pro Tip to earn assured reward",
                          style: TextStyle(
                            color: Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Card(
                    color: const Color(0xFF3A3A3A),
                    child: Column(
                      children: [
                        Container(
                          width: width,
                          margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                          child: const Text("Refer someone who:", style: TextStyle(color: Color(0xFFFFAE00)),
                          textAlign: TextAlign.left,),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 5.0, right: 5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFFFAE00),
                                    width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage("images/user_salaried.png"),
                                        width: 30,
                                          height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "is Salaried",
                                              style:
                                                  TextStyle(color: Color(0xFFFFAE00)),
                                              textAlign: TextAlign.left,
                                            ),
                                            Text(
                                              "full-time",
                                              style:
                                              TextStyle(color: Color(0xFFFFAE00)),
                                              textAlign: TextAlign.left,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFFFAE00),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage("images/earns_atleast.png"),
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "earns atleast",
                                              style:
                                              TextStyle(color: Color(0xFFFFAE00)),
                                            ),
                                            Text(
                                              "₹12000/month",
                                              style:
                                              TextStyle(color: Color(0xFFFFAE00)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0, left: 5.0, right: 5.0, bottom: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFFFAE00),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage("images/above_21.png"),
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "is above",
                                              style:
                                              TextStyle(color: Color(0xFFFFAE00)),
                                            ),
                                            Text(
                                              "21 yrs of age",
                                              style:
                                              TextStyle(color: Color(0xFFFFAE00)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: width * 0.438,
                                child: Container(
                                  padding: const EdgeInsets.all(6.0),
                                  // margin: const EdgeInsets.all(2.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xFFFFAE00),
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      const Image(
                                        image: AssetImage("images/cheque_payment_receives.png"),
                                        width: 30,
                                        height: 30,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: const [
                                            Text(
                                              "receives salary",
                                              style:
                                              TextStyle(color: Color(0xFFFFAE00)),
                                            ),
                                            Text(
                                              "via cheque/bank",
                                              style:
                                              TextStyle(color: Color(0xFFFFAE00)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
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
                Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: Color(0xFF3A3A3A),
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  margin: const EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin:const EdgeInsets.only(top: 10.0, left: 10.0, bottom: 10.0),
                          child: Text("ZZ9727F",style: TextStyle(color: Color(0xFFFFAE00))),
                      ),
                      Container(
                          margin:const EdgeInsets.only(top: 10.0, right: 10.0, bottom: 10.0),
                          child: Text("Copy", textAlign: TextAlign.right, style: TextStyle(color: Color(0xFFFFAE00)),))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text(
                            "Referal Status",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 16.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            side: BorderSide(
                              width: 2.0,
                              color: Color(0xFFFFAE00),
                            ),
                            fixedSize: Size(width * 0.40, 40.0),
                            primary: const Color(0xFF111111),
                            shadowColor: const Color(0xFF111111),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {

                          },
                          child: const Text(
                            "Invite",
                            style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 16.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width * 0.40, 40.0),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
