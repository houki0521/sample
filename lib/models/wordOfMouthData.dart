import 'package:json_annotation/json_annotation.dart';


part 'wordOfMouthData.g.dart';


@JsonSerializable()
class WordOfMouthData {
  int? id;
  String selectedItem;
  double number_of_ratings;
  String amount_spent;
  String wordOfMouthText;
  List<String> wordOfMouthPhot;
  String date_of_visit;
  List<String> photoImage;
  String store_name;

  WordOfMouthData({
    required this.id,
    required this.selectedItem,
    required this.number_of_ratings,
    required this.amount_spent,
    required this.wordOfMouthText,
    required this.wordOfMouthPhot,
    required this.date_of_visit,
    required this.photoImage,
    required this.store_name,
  });

  // // JSON -> StoreData
  factory WordOfMouthData.fromJson(Map<String, dynamic> json) => _$WordOfMouthDataFromJson(json);
  // // StoreData -> JSON
  Map<String, dynamic> toJson() => _$WordOfMouthDataToJson(this);
}

