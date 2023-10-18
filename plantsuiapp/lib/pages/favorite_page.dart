import 'package:flutter/material.dart';
import 'package:plantsuiapp/constants.dart';
import 'package:plantsuiapp/models/plant-model.dart';
import 'package:plantsuiapp/shared/plant_widget.dart';

class FavoritePage extends StatefulWidget {
  final List<PlantModel> favoritedPlantModels;
  const FavoritePage(
      {Key? key,
      required this.favoritedPlantModels,
      required List<PlantModel> favoritedPlantModelModels,
      required List favoritedPlants})
      : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: widget.favoritedPlantModels.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset('assets/favorited.png'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Your favorited PlantModels',
                    style: TextStyle(
                      color: Constants.primaryColor,
                      fontWeight: FontWeight.w300,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            )
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 30),
              height: size.height * .5,
              child: ListView.builder(
                  itemCount: widget.favoritedPlantModels.length,
                  scrollDirection: Axis.vertical,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    return PlantWidget(
                        index: index, plantList: widget.favoritedPlantModels);
                  }),
            ),
    );
  }
}
