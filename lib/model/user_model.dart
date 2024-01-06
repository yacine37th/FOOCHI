class UserModel {
  late String? uID;
  late String? email;
  late String? name;
  late List<dynamic> foodFavoris;
  late var latitude;
  late var longitude;
  UserModel({
    required this.uID,
    required this.email,
    required this.name,
    required this.foodFavoris,
    required this.latitude,
    required this.longitude,
  });
}
