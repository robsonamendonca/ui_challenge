// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

class PlantModel {
  final int plantId;
  final int price;
  final String size;
  final double rating;
  final int humidity;
  final String temperature;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorated;
  final String decription;
  bool isSelected;

  PlantModel(
      {required this.plantId,
      required this.price,
      required this.category,
      required this.plantName,
      required this.size,
      required this.rating,
      required this.humidity,
      required this.temperature,
      required this.imageURL,
      required this.isFavorated,
      required this.decription,
      required this.isSelected});

  //List of PlantModels data
  static List<PlantModel> plantList = [
    PlantModel(
        plantId: 0,
        price: 22,
        category: 'Indoor',
        plantName: 'Sanseviera',
        size: 'Small',
        rating: 4.5,
        humidity: 34,
        temperature: '23 - 34',
        imageURL: 'assets/plant-one.png',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    PlantModel(
        plantId: 1,
        price: 11,
        category: 'Outdoor',
        plantName: 'Philodendron',
        size: 'Medium',
        rating: 4.8,
        humidity: 56,
        temperature: '19 - 22',
        imageURL: 'assets/plant-two.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    PlantModel(
        plantId: 2,
        price: 18,
        category: 'Indoor',
        plantName: 'Beach Daisy',
        size: 'Large',
        rating: 4.7,
        humidity: 34,
        temperature: '22 - 25',
        imageURL: 'assets/plant-three.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    PlantModel(
        plantId: 3,
        price: 30,
        category: 'Outdoor',
        plantName: 'Big Bluestem',
        size: 'Small',
        rating: 4.5,
        humidity: 35,
        temperature: '23 - 28',
        imageURL: 'assets/plant-one.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    PlantModel(
        plantId: 4,
        price: 24,
        category: 'Recommended',
        plantName: 'Big Bluestem',
        size: 'Large',
        rating: 4.1,
        humidity: 66,
        temperature: '12 - 16',
        imageURL: 'assets/plant-four.png',
        isFavorated: true,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    PlantModel(
        plantId: 5,
        price: 24,
        category: 'Outdoor',
        plantName: 'Meadow Sage',
        size: 'Medium',
        rating: 4.4,
        humidity: 36,
        temperature: '15 - 18',
        imageURL: 'assets/plant-five.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    PlantModel(
        plantId: 6,
        price: 19,
        category: 'Garden',
        plantName: 'Plumbago',
        size: 'Small',
        rating: 4.2,
        humidity: 46,
        temperature: '23 - 26',
        imageURL: 'assets/plant-six.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    PlantModel(
        plantId: 7,
        price: 23,
        category: 'Garden',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.5,
        humidity: 34,
        temperature: '21 - 24',
        imageURL: 'assets/plant-seven.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
    PlantModel(
        plantId: 8,
        price: 46,
        category: 'Recommended',
        plantName: 'Tritonia',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/plant-eight.png',
        isFavorated: false,
        decription:
            'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
            'even the harshest weather condition.',
        isSelected: false),
  ];

  //Get the favorated items
  static List<PlantModel> getFavoritedPlantModels() {
    List<PlantModel> _travelList = PlantModel.plantList;
    return _travelList.where((element) => element.isFavorated == true).toList();
  }

  //Get the cart items
  static List<PlantModel> addedToCartPlantModels() {
    List<PlantModel> _selectedPlantModels = PlantModel.plantList;
    return _selectedPlantModels
        .where((element) => element.isSelected == true)
        .toList();
  }
}
