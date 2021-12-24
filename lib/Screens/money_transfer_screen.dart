import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class MoneyTransferScreen extends StatefulWidget{
  @override
  _MoneyTransferScreen createState() {
    // TODO: implement createState
    return _MoneyTransferScreen();
  }
}
class _MoneyTransferScreen extends State<MoneyTransferScreen>{
  final TextEditingController _mobile_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    bool containerVisible = true;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "Money Transfer",
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
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter sender mobile number",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xFFFFAE00),
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: TextField(
                //controller: _email_mobile_controller,
                keyboardType: TextInputType.phone,
                inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp("[0-9]"))],
                maxLength: 10,
                controller: _mobile_controller,
                onChanged: (content){
                    setState(() {
                      if(content.length==10) {
                        if(!containerVisible) {
                        //print('content length : $content.length');
                          containerVisible = true;
                        }
                      }
                    });
                },
                style: const TextStyle(color: Color(0xFFFFAE00)),
                cursorColor: const Color(0xFFFFAE00),
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
                  labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                  // hintText: 'Email / Mobile No.',
                  labelText: 'Mobile number',
                  isDense: true,
                ),
              ),
            ),
            Visibility(
              visible: containerVisible,
              child: Container(
                child: Column(
                  children: [
                    Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
                            cursorColor: const Color(0xFFFFAE00),
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
                              labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Sender first name',
                              isDense: true,
                            ),
                          ),
                        ),
                    Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
                            cursorColor: const Color(0xFFFFAE00),
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
                              labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Sender last name',
                              isDense: true,
                            ),
                          ),
                        ),
                    Container(
                          margin: EdgeInsets.only(
                            top: 20,
                          ),
                          child: TextField(
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
                            cursorColor: const Color(0xFFFFAE00),
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
                              labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Enter OTP',
                              isDense: true,
                            ),
                          ),
                        ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        setState(() {
                          containerVisible = false;
                        });
                      },
                      child: const Text(
                        "Resend OTP",
                        style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
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
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: (){},
                        child: Text(
                          "Add",
                          style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
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
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: (){
                          setState(() {
                            containerVisible = false;
                          });
                        },
                        child: Text(
                            "Cancel",
                          style: TextStyle(
                              color: Color(0xFF111111),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
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
                  ],
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

}