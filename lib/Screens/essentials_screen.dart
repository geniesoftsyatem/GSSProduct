import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/service_list_model.dart';
import 'package:genie_money/Screens/enter_location_screen.dart';
import 'package:genie_money/Screens/sub_catagories_screen.dart';
import 'package:genie_money/Screens/sub_sub_categories_screen.dart';

class EssentialsScreen extends StatefulWidget {
  const EssentialsScreen({Key? key}) : super(key: key);

  @override
  _EssentialsScreenState createState() => _EssentialsScreenState();
}

class _EssentialsScreenState extends State<EssentialsScreen> {
  late List<ServiceModel> servicesList;

  @override
  void initState() {
    servicesList = [
      ServiceModel("General Store", "images/general_store.png", 0.0),
      ServiceModel("Vegetable Vendor", "images/vegetable_store.png", 0.0),
      ServiceModel("AC/ Appliance Repair", "images/appliance_repair.png", 0.0),
      ServiceModel("Electricians", "images/electrician.png", 0.0),
      ServiceModel("Plumber", "images/plumber.png", 0.0),
      ServiceModel("Carpenter", "images/carpenter.png", 0.0),
      ServiceModel("Car / Bike Mechanic", "images/mechanic.png", 0.0),
      ServiceModel("Cleaning", "images/cleaning.png", 0.0),
      ServiceModel("Tutor", "images/tutor.png", 0.0),
      ServiceModel("Maid", "images/maid.png", 0.0),
      ServiceModel("Laundry", "images/laundary.png", 0.0),
      ServiceModel("Cable Vendor", "images/cabel_vendor.png", 0.0),
      ServiceModel("Saloon, Spa, Massage", "images/salon.png", 0.0),
      ServiceModel("Home Painting", "images/home_painting.png", 0.0),
      ServiceModel("Pest Control", "images/pest_control.png", 0.0),
      ServiceModel("Medicine Shop", "images/medicine_shop.png", 0.0),
      ServiceModel("Emergency", "images/emergency.png", 0.0),
      ServiceModel("Gas/ Cylinder Vendor", "images/gas_cylinder_vendor.png", 0.0),
      ServiceModel("Internet Provider", "images/internet_provider.png", 0.0),
      ServiceModel("Restaurants", "images/resturant.png", 0.0),
      ServiceModel("Gardener", "images/gardener.png", 0.0),
    ];
    super.initState();
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
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search),
              color: const Color(0xFFFFAE00),
            ),
          ],
        ),
        body: Container(
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
