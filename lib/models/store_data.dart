import 'package:hive/hive.dart';

part 'store_data.g.dart';

@HiveType(typeId: 0)
class StoreData extends HiveObject {
  @HiveField(0)
  List<String> storeImages;

  @HiveField(1)
  String storeName;

  @HiveField(2)
  String prText;

  @HiveField(3)
  String featureText;

  @HiveField(4)
  String commitment;

  @HiveField(5)
  List<String> seatImages;

  @HiveField(6)
  String seatText;

  @HiveField(7)
  List<String> coursImages;

  @HiveField(8)
  String coursText;

  @HiveField(9)
  List<String> menuImages;

  @HiveField(10)
  String menuText;

  @HiveField(11)
  List<String> drinkImages;

  @HiveField(12)
  String drinkText;

  StoreData({
    required this.storeImages,
    required this.storeName,
    required this.prText,
    required this.featureText,
    required this.commitment,
    required this.seatImages,
    required this.seatText,
    required this.coursImages,
    required this.coursText,
    required this.menuImages,
    required this.menuText,
    required this.drinkImages,
    required this.drinkText,
  });

  @override
  String toString() {
    return 'StoreData(storeImages: $storeImages, storeName: $storeName, prText: $prText, featureText: $featureText, '
           'commitment: $commitment,seetImages: $seatImages, seatText: $seatText,coursImages: $coursImages, coursText: $coursText, '
           'menuImages: $menuImages, menuText: $menuText,drinkImges: $drinkImages ,drinkText: $drinkText)';
  }
}
