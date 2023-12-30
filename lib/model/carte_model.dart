class CarteModel {
  late String? id;
  late String? imageUrl;
  late String? foodID;
  late int qte;
  late int foodPrice;
  late String? foodName;
  late String? userID;
  late bool? isConfirm;
  CarteModel({
    required this.id,
    required this.foodID,
    required this.qte,
    required this.imageUrl,
    required this.foodPrice,
    required this.foodName,
    // required this.foodPrice,
    // required this.foodName,
    required this.userID,
    required this.isConfirm,
  });
}
