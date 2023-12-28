class UserModel {
  late String? uID;
  late String? email;
  late String? name;
  late List<dynamic> foodFavoris;
  UserModel({
    required this.uID,
    required this.email,
    required this.name,
    required this.foodFavoris,
  });
}
