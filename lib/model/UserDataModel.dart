enum SkinType { oily, dry, combination, sensitive, normal }

enum HairType { straight, wavy, curly, coily }

enum Humidity { low, medium, high }

enum Dryness { low, medium, high }

class UserDataModel {
  String name;
  String gender;
  int age;
  String livingPlaceClimate;
  double temperature;
  Dryness dryness;
  Humidity humidity;
  String typeOfOccupation;
  HairType hairType;
  SkinType skinType;
  String description;

  UserDataModel({
    required this.name,
    required this.gender,
    required this.age,
    required this.livingPlaceClimate,
    required this.temperature,
    required this.dryness,
    required this.humidity,
    required this.typeOfOccupation,
    required this.hairType,
    required this.skinType,
    required this.description,
  });

  factory UserDataModel.fromJson(Map<String, dynamic> json) {
    return UserDataModel(
      name: json['name'],
      gender: json['gender'],
      age: json['age'],
      livingPlaceClimate: json['livingPlaceClimate'],
      temperature: json['temperature'],
      dryness: json['dryness'],
      humidity: json['humidity'],
      typeOfOccupation: json['typeOfOccupation'],
      hairType: json['hairType'],
      skinType: json['skinType'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'gender': gender,
      'age': age,
      'livingPlaceClimate': livingPlaceClimate,
      'temperature': temperature,
      'dryness': dryness,
      'humidity': humidity,
      'typeOfOccupation': typeOfOccupation,
      'hairType': hairType,
      'skinType': skinType,
      'description': description,
    };
  }
}
