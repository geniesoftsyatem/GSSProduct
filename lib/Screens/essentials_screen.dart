import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/service_list_model.dart';
import 'package:genie_money/Screens/enter_location_screen.dart';
import 'package:genie_money/Screens/sub_catagories_screen.dart';
import 'package:genie_money/Screens/sub_sub_categories_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EssentialsScreen extends StatefulWidget {
  const EssentialsScreen({Key? key}) : super(key: key);

  @override
  _EssentialsScreenState createState() => _EssentialsScreenState();
}

class _EssentialsScreenState extends State<EssentialsScreen> {
  late List<ServiceModel> servicesList;
  String type="";
  String postAdd="Yes";
  @override
  void initState() {
    servicesList = [
      ServiceModel("General Store", "images/general_store.png", 0.0),
      ServiceModel("Medicine Shop", "images/medicine_shop.png", 0.0),
      ServiceModel("Vegetable Vendor", "images/vegetable_store.png", 0.0),
      ServiceModel("Meat shop", "images/medicine_shop.png", 0.0),
      ServiceModel("Cable Vendor", "images/cabel_vendor.png", 0.0),
      ServiceModel("Internet Provider", "images/internet_provider.png", 0.0),
      ServiceModel("Tutor", "images/tutor.png", 0.0),
      ServiceModel("House Maid", "images/maid.png", 0.0),
      ServiceModel("Laundry", "images/laundary.png", 0.0),
      ServiceModel("Gardener", "images/gardener.png", 0.0),
      ServiceModel("Home Painting", "images/home_painting.png", 0.0),
      ServiceModel("Pest Control", "images/pest_control.png", 0.0),
      ServiceModel("House Cleaning", "images/cleaning.png", 0.0),
      ServiceModel("AC/ Appliance Repair", "images/appliance_repair.png", 0.0),
      ServiceModel("Electrician", "images/electrician.png", 0.0),
      ServiceModel("Plumber", "images/plumber.png", 0.0),
      ServiceModel("Carpenter", "images/carpenter.png", 0.0),
      ServiceModel("Car / Bike Mechanic", "images/mechanic.png", 0.0),
      ServiceModel("Saloon, Spa, Massage", "images/salon.png", 0.0),
      ServiceModel("Emergency", "images/emergency.png", 0.0),
      ServiceModel("Gas/ Cylinder Vendor", "images/gas_cylinder_vendor.png", 0.0),
      ServiceModel("Restaurants", "images/resturant.png", 0.0),


    ];
    getUserType();
    super.initState();

      Future.delayed(Duration.zero,()=>
      showRegistrationDailog()
      );


  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: const Text(
            "Essentials",
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
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Route route = MaterialPageRoute(builder: (context) => const EnterLocation());
                Navigator.push(context, route);
              },
              icon: const Icon(Icons.location_on),
              color: const Color(0xFFFFAE00),
            ),
            /*IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search),
              color: const Color(0xFFFFAE00),
            ),*/
          ],
        ),
        body: Column(
          children: [

            Container(
              margin: EdgeInsets.all(10),
                child: TextFormField(
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                    cursorColor: const Color(0xFFFFAE00),
                    keyboardType: TextInputType.emailAddress,
                    //controller: _email_controller,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xFFFFAE00)),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(
                          color: Color(0xFFFFAE00)),
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Pincode',
                      isDense: true,
                    )
                ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          if (servicesList[index].name == "AC/ Appliance Repair") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubCatagoriesScreen(
                                        servicesList[index].name)));
                          } else if (servicesList[index].name == "General Store") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubSubCategoriesScreen(
                                        servicesList[index].name)));
                          }
                          else {
                            _alertDialog();
                          }
                        },
                        child: Card(
                          color: const Color(0xFF3A3A3A),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 10.0, top: 10.0, bottom: 10.0),
                                child: Row(
                                  children: [
                                    Image(
                                      image: AssetImage(servicesList[index].image),
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, top: 10.0, bottom: 10.0),
                                      child: Text(
                                        servicesList[index].name,
                                        style: const TextStyle(
                                            color: Color(0xFFFFAE00), fontSize: 18.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Icon(
                                Icons.navigate_next,
                                color: Color(0xFFFFAE00),
                                size: 40.0,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: servicesList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future _alertDialog() {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          contentText: 'Coming Soon',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }

  Future getUserType()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = (prefs.get("type")?? "Customer").toString();
    });

  }

  showRegistrationDailog(){
    bool otpVisibility = false;
    TextEditingController otpController = TextEditingController();
    FocusNode otpFocusNode = FocusNode();
    List<String> category = ["category"];
    String selected_type = category.first;

    print("type"+type);
    Dialog alterDialog = Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      backgroundColor: Color(0xFF3A3A3A),
      child: StatefulBuilder(builder: (context,setState){
        return Container(
          //height: 240,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        child: Text(
                          "Register New Vendor",
                          style: TextStyle(fontSize: 18,color: Color(0xFFFFAE00),fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    IconButton(
                      icon:Icon(Icons.clear,color: Color(0xFFFFAE00)),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.emailAddress,
                      //controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Email ID',
                        isDense: true,
                      )
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      //controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Mobile Number',
                        isDense: true,
                      )
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Color(0xFFFFAE00))
                  ),
                  margin: EdgeInsets.all(10),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: selected_type,
                      isDense: true,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFFFFAE00),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                      onChanged: ( data) {
                        setState(() {
                          selected_type = data.toString();
                        });
                      },
                      dropdownColor: Color(0xFF3A3A3A),
                      items:category
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),

                    ),
                  ),
                ),

                Container(
                    margin: EdgeInsets.all(10),
                  child:Text('Post Advertisement',style: TextStyle(color:Color(0xFFFFAE00)),),
                ),
                Container(
                  child: Row(
                    children: [
                        Row(
                          children: [
                            Radio(
                              value: "Yes",
                              groupValue: postAdd,
                              activeColor: Color(0xFFFFAE00),
                              onChanged: (value) {
                                setState(() {
                                  postAdd = value.toString();
                                });
                              },
                            ),
                            Text('Yes',style: TextStyle(color:Color(0xFFFFAE00)),),
                          ],
                        ),
                        Row(children: [

                          Radio(
                            value: "No",
                            groupValue: postAdd,
                            activeColor: Color(0xFFFFAE00),
                            onChanged: (value) {
                              setState(() {
                                postAdd = value.toString();
                              });
                            },
                          ),
                          Text('No',style: TextStyle(color:Color(0xFFFFAE00)),),
                        ],
                        )

                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.text,
                      //controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Address 1',
                        isDense: true,
                      )
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.text,
                      //controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Address 2',
                        isDense: true,
                      )
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.text,
                      //controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Taluka/Teshil',
                        isDense: true,
                      )
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.text,
                      //controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'District',
                        isDense: true,
                      )
                  ),
                ),

                Container(
                  margin: EdgeInsets.all(10),
                  child: TextFormField(
                    //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.text,
                      //controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'State',
                        isDense: true,
                      )
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                  child: TextFormField(
                    //controller: _email_mobile_controller,
                      style: const TextStyle(color: Color(0xFFFFAE00)),
                      cursorColor: const Color(0xFFFFAE00),
                      keyboardType: TextInputType.number,
                      maxLength: 6,
                      //controller: _email_controller,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xFFFFAE00)),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00)),
                        // hintText: 'Email / Mobile No.',
                        labelText: 'Pin Code',
                        isDense: true,
                      )
                  ),
                ),

                Container(
                  height: 40,
                  margin: EdgeInsets.all(10),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        //Navigator.pop(context);
                        setState((){
                          otpVisibility = true;
                          otpFocusNode.requestFocus();
                        });
                      },
                      child: Text("Get OTP",
                        style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                        primary: const Color(0xFFFFAE00),
                        shadowColor: const Color(0xFFFFAE00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),

                Visibility(
                  visible: otpVisibility,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: TextFormField(
                              controller: otpController,
                              focusNode: otpFocusNode,
                              style: const TextStyle(color: Color(0xFFFFAE00)),
                              cursorColor: const Color(0xFFFFAE00),
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              //controller: _email_controller,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFFFAE00)),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                labelStyle: const TextStyle(
                                    color: Color(0xFFFFAE00)),
                                // hintText: 'Email / Mobile No.',
                                labelText: 'OTP',
                                isDense: true,
                              )
                          ),
                        ),

                        Container(
                          height: 40,
                          margin: EdgeInsets.all(10),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Submit",
                                style: TextStyle(color: Colors.black,fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                                primary: const Color(0xFFFFAE00),
                                shadowColor: const Color(0xFFFFAE00),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          ),
        );
      },),
    );

    if(type!="Customer") {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => alterDialog
      );
    }


  }

}

class DataSearch extends SearchDelegate<String> {
  final services = [
    "General Store",
    "Vegetable Vendor",
    "AC/ Appliance Repair",
    "Electricians",
    "Plumber",
    "Carpenter",
    "Car / Bike Mechanic",
    "Cleaning",
    "Tutor",
    "Maid",
    "Laundry",
    "Cable Vendor",
    "Saloon, Spa, Massage",
    "Home Painting",
    "Pest Control",
    "Medicine Shop",
    "Emergency",
    "Gas/ Cylinder Vendor",
    "Internet Provider",
    "Restaurants",
    "Gardener"
  ];

  final recentSearches = [
    "General Store",
    "Vegetable Vendor",
    "AC/ Appliance Repair",
    "Electricians"
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    // actions for the app bar
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // leading icon on the left of app bar
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }
  
  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }
  
  @override
  Widget buildSuggestions(BuildContext context) {
    // show when some one searches for something
    final suggestionList = query.isEmpty
        ? recentSearches
        : services
            .where((p) => p.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          if (suggestionList[index] == "AC/ Appliance Repair") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SubCatagoriesScreen(suggestionList[index])));
          } else if (suggestionList[index] == "General Store") {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SubSubCategoriesScreen(suggestionList[index])));
          }
          else {
            _alertDialog(context);
          }
        },
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color(0xFF3A3A3A),
        );
      },
    );
  }

  Future _alertDialog(BuildContext context) {
    return showAnimatedDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          contentText: 'Coming Soon',
          onPositiveClick: () {
            Navigator.of(context).pop();
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
}
