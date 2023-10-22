// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers

class PlantModel {
  final int plantId;
  final double price;
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
        price: 12.99,
        category: 'Indoor',
        plantName: 'Snoke Plants',
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
        price: 12.99,
        category: 'Outdoor',
        plantName: 'Lucy Jade Plants',
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
        price: 12.99,
        category: 'Indoor',
        plantName: 'Peperomia Plants',
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
        plantName: 'Big Bluestem Plants',
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
        plantName: 'Big Bluestem Plants',
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
        plantName: 'Meadow Sage Plants',
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
        plantName: 'Plumbago Plants',
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
        price: 12.99,
        category: 'Garden',
        plantName: 'Small Plant',
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
        plantName: 'Tritonia Plants',
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
    PlantModel(
        plantId: 9,
        price: 23.05,
        category: 'Recommended',
        plantName: 'Aningapara Plants',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/Aningapara.png',
        isFavorated: false,
        decription:
            'It is a tropical species that grows quickly and is easy to handle.',
        isSelected: false),
    PlantModel(
        plantId: 10,
        price: 21.90,
        category: 'Recommended',
        plantName: 'Imbé Plants',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/Imbé.png',
        isFavorated: false,
        decription:
            'Medium-sized that adapts to different regions, in addition to being very easy to grow. Wins over more and more people.',
        isSelected: false),
    PlantModel(
        plantId: 11,
        price: 46,
        category: 'Recommended',
        plantName: 'Zamioculca Plant',
        size: 'Medium',
        rating: 4.7,
        humidity: 46,
        temperature: '21 - 25',
        imageURL: 'assets/Zamioculca.png',
        isFavorated: false,
        decription:
            'Despite blooming in spring, it stays beautiful and green all year round.',
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
