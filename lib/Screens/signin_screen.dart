import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:genie_shield/Screens/signup_screen.dart';
import 'package:genie_shield/utils/screen_sizes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreen createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal! * 90;
    double height = SizeConfig.blockSizeVertical! * 50;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFF111111),
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            CustomPaint(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ],
                ),
              ),
              painter: HeaderCurvedContainer(),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: height / 6.5, left: width / 18, right: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Welcome to",
                          style: TextStyle(
                              color: Color(0xFF111111), fontSize: 15.0),
                        ),
                        const Text(
                          'GSS Product',
                          style: TextStyle(
                            fontSize: 25.0,
                            letterSpacing: 1.5,
                            color: Color(0xFF111111),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          'Please Login To Continue',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Color(0xFF111111),
                          ),
                        ),
                        Container(
                            margin: const EdgeInsets.only(right: 10.0, top: 20.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Email / Username',
                              ),
                            )),
                        Container(
                            margin: const EdgeInsets.only(right: 10.0, top: 20.0),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                hintText: 'Password',
                              ),
                              obscureText: true,
                            )),
                        Container(
                          margin: const EdgeInsets.only(
                              right: 10.0, top: 30.0),
                          child: ElevatedButton(
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(width, height / 7),
                              primary: const Color(0xFF111111),
                              shadowColor: const Color(0xFFFFAE00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(builder: (context) => const SignupScreen()));
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              "FORGOT PASSWORD ?",
                              style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: height/3.5,
                        ),
                        const Center(
                          child: Text("OR", style: TextStyle(color: Color(0xFFFFAE00), fontWeight: FontWeight.bold, fontSize: 15.0),),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              right: 10.0, top: 30.0),
                          child: ElevatedButton(
                            child: const Text(
                              "SIGN UP",
                              style: TextStyle(
                                  color: Color(0xFF111111),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(width, height / 7),
                              primary: const Color(0xFFFFAE00),
                              shadowColor: const Color(0xFFFFAE00),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => const SignupScreen()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = const Color(0xFFFFAE00);
    Path path = Path()
      ..relativeLineTo(0, 400)
      ..quadraticBezierTo(size.width / 2, 500.0, size.width, 400)
      ..relativeLineTo(0, -400)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
