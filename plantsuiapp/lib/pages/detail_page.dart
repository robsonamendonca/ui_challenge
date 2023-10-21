// ignore_for_file: no_leading_underscores_for_local_identifiers, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:plantsuiapp/constants.dart';
import 'package:plantsuiapp/models/plant-model.dart';
import 'package:plantsuiapp/pages/cart_page.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({Key? key, required this.plantId}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  //Toggle Favorite button
  bool toggleIsFavorated(bool isFavorited) {
    return !isFavorited;
  }

  //Toggle add remove from cart
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<PlantModel> _plantList = PlantModel.plantList;
    return Scaffold(
      backgroundColor: Constants.blackColor,
      body: Stack(
        children: [
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.blackColor.withOpacity(.15),
                    ),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Constants.primaryColor,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('favorite');
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Constants.blackColor.withOpacity(.15),
                    ),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const CartPage(
                                        addedToCartPlantModels: [],
                                        addedToCartPlants: [],
                                      )));
                        },
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: Constants.primaryColor,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: Container(
              width: size.width * .8,
              height: size.height * .8,
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Positioned(
                    top: 1,
                    left: 0,
                    child: SizedBox(
                      height: 350,
                      child: Image.asset(_plantList[widget.plantId].imageURL),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(top: 360, left: 5, right: 30),
                    height: size.height * .6,
                    width: size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _plantList[widget.plantId].plantName,
                                  style: TextStyle(
                                    color: Constants.primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        Expanded(
                          child: Text(
                            _plantList[widget.plantId].decription,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              height: 1.5,
                              fontSize: 14,
                              color: Constants.primaryColor.withOpacity(.7),
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              height: size.height * .3,
              width: size.width,
              decoration: BoxDecoration(
                color: Constants.blackColor6,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
              ),
              child: Positioned(
                top: 10,
                right: 0,
                child: SizedBox(
                  height: 200,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PlantFeature(
                        title: 'Height',
                        plantFeature: _plantList[widget.plantId].size,
                        icon: Icons.read_more,
                      ),
                      PlantFeature(
                        title: 'Temperature',
                        plantFeature: _plantList[widget.plantId].temperature,
                        icon: Icons.thermostat,
                      ),
                      PlantFeature(
                        title: 'Humidity',
                        plantFeature:
                            _plantList[widget.plantId].humidity.toString(),
                        icon: Icons.format_color_fill,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * .9,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
              width: 150,
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total Price',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22.0,
                    ),
                  ),
                  Text(
                    r'$' + _plantList[widget.plantId].price.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.blackColor3.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, 1),
                        blurRadius: 5,
                        color: Constants.blackColor3.withOpacity(0.1),
                      )
                    ]),
                child: const Center(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PlantFeature extends StatelessWidget {
  final String plantFeature;
  final String title;
  final IconData icon;
  const PlantFeature({
    Key? key,
    required this.plantFeature,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: Constants.blackColor,
            size: 40,
          ),
          onPressed: () {},
        ),
        Text(
          title,
          style: TextStyle(
            color: Constants.blackColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          plantFeature,
          style: TextStyle(
            color: Constants.blackColor,
            fontSize: 18.0,
          ),
        )
      ],
    );
  }
}
