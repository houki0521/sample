// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoreData _$StoreDataFromJson(Map<String, dynamic> json) => StoreData(
      id: (json['id'] as num?)?.toInt(),
      storeImages: (json['storeImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
      storeName: json['storeName'] as String ?? '',
      prText: json['prText'] as String ?? '',
      featureText: json['featureText'] as String ?? '',
      fastidiousnessImages: (json['fastidiousnessImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
      fastidiousnessText: (json['fastidiousnessText'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
      seatImages: (json['seatImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
      seatText: (json['seatText'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
      coursImages: (json['coursImages'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
      coursText: (json['coursText'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
      menuText: (json['menuText'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
      drinkText: (json['drinkText'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
      officialPhotoImage: (json['officialPhotoImage'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [], // nullの場合は空リストを設定
    );


Map<String, dynamic> _$StoreDataToJson(StoreData instance) => <String, dynamic>{
      'id': instance.id,
      'storeImages': instance.storeImages,
      'storeName': instance.storeName,
      'prText': instance.prText,
      'featureText': instance.featureText,
      'fastidiousnessImages': instance.fastidiousnessImages,
      'fastidiousnessText': instance.fastidiousnessText,
      'seatImages': instance.seatImages,
      'seatText': instance.seatText,
      'coursImages': instance.coursImages,
      'coursText': instance.coursText,
      'menuText': instance.menuText,
      'drinkText': instance.drinkText,
      'officialPhotoImage': instance.officialPhotoImage,
    };
