import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:genie_money/Model/service_list_model.dart';
import 'package:genie_money/Screens/sub_sub_categories_screen.dart';

class SubCatagoriesScreen extends StatefulWidget {
  String title;

  SubCatagoriesScreen(this.title, {Key? key}) : super(key: key);

  @override
  _SubCatagoriesScreenState createState() => _SubCatagoriesScreenState();
}

class _SubCatagoriesScreenState extends State<SubCatagoriesScreen> {
  late List<ServiceModel> servicesList;

  @override
  void initState() {
    servicesList = [
      ServiceModel("Air Conditioner", "images/appliance_repair.png", 0.0),
      ServiceModel("Chimney", "images/chimney.png", 0.0),
      ServiceModel("Geyser", "images/geyser.png", 0.0),
      ServiceModel("Microwave", "images/microwave.png", 0.0),
      ServiceModel("Television", "images/tv.png", 0.0),
      ServiceModel("Washing Machine", "images/washing_maching.png", 0.0),
      ServiceModel("Water Purifier", "images/water_purifier.png", 0.0)
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
          title: Text(
            widget.title,
            style: const TextStyle(
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
                showSearch(context: context, delegate: DataSearch());
              },
              icon: const Icon(Icons.search),
              color: const Color(0xFFFFAE00),
            )
          ],
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    if (servicesList[index].name == "Air Conditioner") {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SubSubCategoriesScreen(
                                  servicesList[index].name)));
                    } else {
                      _alertDialog(context);
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

class DataSearch extends SearchDelegate<String> {
  final services = [
    "Air Conditioner",
    "Chimney",
    "Geyser",
    "Microwave",
    "Refrigerator",
    "Television",
    "Washing Machine",
    "Water Purifier",
    "Appliance Protection Plan"
  ];

  final recentSearches = [
    "Air Conditioner",
    "Geyser",
    "Refrigerator",
    "Washing Machine"
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
        onTap: () {
          if (suggestionList[index] == "Air Conditioner") {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SubSubCategoriesScreen(
                        suggestionList[index])));
          } else {
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
