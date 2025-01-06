// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreData _$StoreDataFromJson(Map<String, dynamic> json) => StoreData(
      storeImages: (json['storeImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      storeName: json['storeName'] as String,
      prText: json['prText'] as String,
      featureText: json['featureText'] as String,
      commitment: json['commitment'] as String,
      seatImages: (json['seatImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      seatText:
          (json['seatText'] as List<dynamic>).map((e) => e as String).toList(),
      coursImages: (json['coursImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      coursText:
          (json['coursText'] as List<dynamic>).map((e) => e as String).toList(),
      menuImages: (json['menuImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      menuText:
          (json['menuText'] as List<dynamic>).map((e) => e as String).toList(),
      drinkImages: (json['drinkImages'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      drinkText:
          (json['drinkText'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$StoreDataToJson(StoreData instance) => <String, dynamic>{
      'storeImages': instance.storeImages,
      'storeName': instance.storeName,
      'prText': instance.prText,
      'featureText': instance.featureText,
      'commitment': instance.commitment,
      'seatImages': instance.seatImages,
      'seatText': instance.seatText,
      'coursImages': instance.coursImages,
      'coursText': instance.coursText,
      'menuImages': instance.menuImages,
      'menuText': instance.menuText,
      'drinkImages': instance.drinkImages,
      'drinkText': instance.drinkText,
    };
