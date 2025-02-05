import 'package:json_annotation/json_annotation.dart';


part 'store_data.g.dart';

@JsonSerializable()
class StoreData {
  int? id;
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
  List<String> officialPhotoImage;

  StoreData({
    required this.id,
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
    required this.officialPhotoImage
  });

  // // JSON -> StoreData
  factory StoreData.fromJson(Map<String, dynamic> json) => _$StoreDataFromJson(json);
  // // StoreData -> JSON
  Map<String, dynamic> toJson() => _$StoreDataToJson(this);
}

