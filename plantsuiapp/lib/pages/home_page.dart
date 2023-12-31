// ignore_for_file: no_leading_underscores_for_local_identifiers, sized_box_for_whitespace, unused_field

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:plantsuiapp/constants.dart';
import 'package:plantsuiapp/models/plant-model.dart';
import 'package:plantsuiapp/pages/detail_page.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantsuiapp/pages/onboarding_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}

class _HomePageState extends State<HomePage> {
  List<PlantModel> _plantList = PlantModel.plantList;
  List<PlantModel> _plantListFilter = [];
  String labelResult = "";

  @override
  void initState() {
    super.initState();
    setState(() {
      _plantListFilter = _plantList;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    //Toggle Favorite button
    bool toggleIsFavorated(bool isFavorited) {
      return !isFavorited;
    }

    return Scaffold(
        backgroundColor: Constants.blackColor,
        appBar: appBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _searchField(),
              const SizedBox(
                height: 4,
              ),
              Container(
                margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
                padding: const EdgeInsets.all(20),
                child: SizedBox(
                  height: size.height * 0.8,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, // Defina 2 para exibir 2 cards por linha
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio:
                          0.6, // Ajuste o valor para alterar a altura em relação à largura
                    ),
                    itemCount: _plantList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: DetailPage(
                                plantId: _plantList[index].plantId,
                              ),
                              type: PageTransitionType.bottomToTop,
                            ),
                          );
                        },
                        child: Container(
                          height: 300, // Ajuste a altura conforme necessário
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                top: 218,
                                right: 15,
                                child: Container(
                                  height: 28,
                                  width: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        bool isFavorited = toggleIsFavorated(
                                            _plantList[index].isFavorated);
                                        _plantList[index].isFavorated =
                                            isFavorited;
                                      });
                                    },
                                    icon: Icon(
                                      _plantList[index].isFavorated == true
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.white,
                                    ),
                                    iconSize: 14,
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 30,
                                right: 30,
                                top: 10,
                                bottom: 80,
                                child: Image.asset(
                                  _plantList[index].imageURL,
                                  height: 120,
                                ),
                              ),
                              Positioned(
                                bottom: 65,
                                left: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _plantList[index].plantName,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                bottom: 20,
                                left: 20,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '\$${_plantList[index].price}',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Container _searchField() {
    final _debouncer = Debouncer();
    return Container(
      margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: const Color(0xff1D1617).withOpacity(0.05),
            blurRadius: 40,
            spreadRadius: 0.0)
      ]),
      child: Column(
        children: [
          TextField(
            onChanged: (string) {
              _debouncer.run(() {
                setState(() {
                  _plantList = _plantListFilter
                      .where(
                        (u) => (u.plantName.toLowerCase().contains(
                              string.toLowerCase(),
                            )),
                      )
                      .toList();
                  labelResult = _plantList.isNotEmpty
                      ? "Found ${_plantList.length} Results"
                      : "";
                  if (string.isEmpty) {
                    _plantList = PlantModel.plantList;
                    labelResult = "";
                  }
                });
              });
            },
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.all(15),
                hintText: 'Search...',
                hintStyle:
                    TextStyle(color: Constants.primaryColor, fontSize: 14),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12),
                  child: IconButton(
                    icon: const Icon(Icons.search_sharp),
                    onPressed: () => {},
                  ),
                ),
                suffixIcon: Container(
                  width: 100,
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        VerticalDivider(
                          color: Constants.primaryColor,
                          indent: 10,
                          endIndent: 10,
                          thickness: 0.1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: IconButton(
                            icon: const Icon(Icons.tune),
                            onPressed: () => {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none)),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            labelResult,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

AppBar appBar(context) {
  return AppBar(
    title: const Text(
      'Search Produtcs',
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.normal,
      ),
    ),
    backgroundColor: Constants.blackColor,
    centerTitle: true,
    elevation: 0.0,
    automaticallyImplyLeading: false,
    leading: Container(
      margin: const EdgeInsets.all(10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Constants.blackColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        color: Colors.black,
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => {
          Navigator.push(
            context,
            PageTransition(
              child: const OnboardingScreen(),
              type: PageTransitionType.rightToLeft,
            ),
          )
        },
      ),
    ),
    actions: [
      Container(
        margin: const EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Constants.blackColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Container(
          height: 64,
          width: 64,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/avatar.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),
    ],
  );
}
