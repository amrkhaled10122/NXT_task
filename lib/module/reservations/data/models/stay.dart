import 'room.dart';

class Stay {
  String address;
  String amenities;
  String checkIn;
  String checkOut;
  String description;
  String lat;
  Object lng;
  String name;
  List<Room> rooms;
  int stars;
  List<String> stayImages;

  Stay({
    required this.address,
    required this.amenities,
    required this.checkIn,
    required this.checkOut,
    required this.description,
    required this.lat,
    required this.lng,
    required this.name,
    required this.rooms,
    required this.stars,
    required this.stayImages,
  });

  factory Stay.fromJson(Map<String, dynamic> json) {
    return Stay(
      address: json['address'],
      amenities: json['amenities'],
      checkIn: json['check_in'],
      checkOut: json['check_out'],
      description: json['description'],
      lat: json['lat'] ?? 0,
      lng: json['lng'] ?? 0,
      name: json['name'],
      rooms: json['rooms'] != null ? (json['rooms'] as List).map((i) => Room.fromJson(i)).toList() : [],
      stars: json['stars'],
      stayImages: json['stay_images'] != null ? List<String>.from(json['stay_images']) : [],
    );
  }
}
