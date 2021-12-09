import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie_shield/utils/screen_sizes.dart';

class SignupScreen extends StatefulWidget{
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreen createState() {
    // TODO: implement createState
    return _SignupScreen();
  }


}

class _SignupScreen extends State<SignupScreen>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;;
    return Scaffold(
        backgroundColor: const Color(0xFFFFAE00),
        body: SafeArea(
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      height: double.infinity,
                      child: Align(
                        alignment : Alignment(-1,1),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Existing user?",
                                style: TextStyle(color: Color(0xFF111111), fontSize: 14.0,fontWeight: FontWeight.bold),
                              ),
                              ElevatedButton(
                                  onPressed: () {  },
                                  child: const Text(
                                    "LOGIN",
                                    style: TextStyle(
                                        color: Color(0xFFFFAE00),
                                        fontSize: 16.0,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(width, 30.0),
                                    primary: const Color(0xFF111111),
                                    shadowColor: const Color(0xFF111111),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: const EdgeInsets.only(
                                      left: 12.0,
                                      right: 12.0
                                    ),
                                  )
                              )]
                        ),
                      ),
                    ),
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 40.0,
                          bottom: 20.0
                          ) ,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xFF111111),
                        borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(
                                MediaQuery.of(context).size.width, 120.0)),
                      ),
                      child: Align(
                          alignment : Alignment(-1,1),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Sign up with",
                                style: TextStyle(color: Color(0xFFFFAE00), fontSize: 14.0,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height:10),
                              Text(
                                "PRODUCT",
                                style: TextStyle(color: Color(0xFFFFAE00), fontSize: 24.0,fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height:20),
                              TextField(
                                obscureText: true,
                                style: TextStyle(color: Color(0xFFFFAE00)),
                                decoration: InputDecoration(
                                    hintText: 'Enter Email',
                                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                    fillColor: Color(0xFF3A3A3A),
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),

                                    )

                                ),
                              ),
                              SizedBox(height:10),
                              TextField(
                                obscureText: true,
                                style: TextStyle(color: Color(0xFFFFAE00)),
                                decoration: InputDecoration(
                                    hintText: 'Mobile number',
                                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                    fillColor: Color(0xFF3A3A3A),
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),

                                    )

                                ),
                              ),
                              SizedBox(height:10),
                              TextField(
                                obscureText: true,
                                style: TextStyle(color: Color(0xFFFFAE00)),
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                    fillColor: Color(0xFF3A3A3A),
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),

                                    )
                                ),
                              ),
                              SizedBox(height:10),
                              TextField(
                                obscureText: true,
                                style: TextStyle(color: Color(0xFFFFAE00)),
                                decoration: InputDecoration(
                                    hintText: 'Re-confirm Password',
                                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                                    fillColor: Color(0xFF3A3A3A),
                                    filled: true,
                                    contentPadding: const EdgeInsets.only(
                                        left: 16.0,
                                        right: 16.0
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),

                                    )
                                ),
                              ),
                              SizedBox(height:10),
                              ElevatedButton(
                                  onPressed: () {  },
                                  child: const Text(
                                    "SIGN UP",
                                    style: TextStyle(
                                      color: Color(0xFF111111),
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(width, 30.0),
                                    primary: const Color(0xFFFFAE00),
                                    shadowColor: const Color(0xFFFFAE00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    padding: const EdgeInsets.only(
                                        left: 12.0,
                                        right: 12.0
                                    ),
                                  )
                              ),
                              SizedBox(height:10),
                            ],
                          ),
                        )

                      ),
                      //color: const Color(0xFFFFAE00),
                    ))
              ],
            )),
    );
  }
}