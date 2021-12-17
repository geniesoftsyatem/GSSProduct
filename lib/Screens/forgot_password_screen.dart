import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:genie_shield/utils/screen_sizes.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForgotPassword();
  }
}

class _ForgotPassword extends State<ForgotPassword> {
  TextEditingController _email_mobile_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeHorizontal! * 100;
    double height = SizeConfig.blockSizeVertical! * 65;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFAE00),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  color: const Color(0xFF3A3A3A),
                  shadowColor: const Color(0xFF3A3A3A),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Center(
                          child: Text(
                            "Forgot Password ?",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 30.0,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: const Center(
                          child: Text(
                            "Enter Your Registered Email id / Mobile No",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 20.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10.0),
                        child: TextField(
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _email_mobile_controller,
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
                            // hintText: 'Email / Mobile No.',
                            labelText: 'Email / Mobile No.',
                            labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                            isDense: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                  child: ElevatedButton(
                    child: const Text(
                      "Submit",
                      style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
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
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const Home()));
                    },
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