import 'package:json_annotation/json_annotation.dart';


part 'store_data.g.dart';

@JsonSerializable()
class StoreData {
  List<String> storeImages;
  String storeName;
  String prText;
  String featureText;
  List<String> fastidiousnessImages;
  List<String> fastidiousnessText;
  List<String> seatImages;
  List<String> seatText;
  List<String> coursImages;
  List<String> coursText;
  List<String> menuText;
  List<String> drinkText;

  StoreData({
    required this.storeImages,
    required this.storeName,
    required this.prText,
    required this.featureText,
    required this.fastidiousnessImages,
    required this.fastidiousnessText,
    required this.seatImages,
    required this.seatText,
    required this.coursImages,
    required this.coursText,
    required this.menuText,
    required this.drinkText,
  });

  // // JSON -> StoreData
  factory StoreData.fromJson(Map<String, dynamic> json) => _$StoreDataFromJson(json);
  // // StoreData -> JSON
  Map<String, dynamic> toJson() => _$StoreDataToJson(this);
}

