// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wordOfMouthData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WordOfMouthData _$WordOfMouthDataFromJson(Map<String, dynamic> json) =>
    WordOfMouthData(
      id: (json['id'] as num?)?.toInt(),
      selectedItem: json['selectedItem'] as String ?? '',
      number_of_ratings: (json['number_of_ratings'] as num).toDouble() ?? 0.0,
      amount_spent: json['amount_spent'] as String ?? '',
      wordOfMouthText: json['wordOfMouthText'] as String ?? '',
      wordOfMouthPhot: (json['wordOfMouthPhot'] as List<dynamic>)
          .map((e) => e as String)
          .toList() ?? [],
      date_of_visit: json['date_of_visit'] as String ?? '',
       photoImage: (json['photoImage'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ?? [], // nullチェックと空リスト設定
      store_name: json['store_name'] as String ?? '',
    );

Map<String, dynamic> _$WordOfMouthDataToJson(WordOfMouthData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'selectedItem': instance.selectedItem,
      'number_of_ratings': instance.number_of_ratings,
      'amount_spent': instance.amount_spent,
      'wordOfMouthText': instance.wordOfMouthText,
      'wordOfMouthPhot': instance.wordOfMouthPhot,
      'date_of_visit': instance.date_of_visit,
      'photoImage': instance.photoImage,
      'store_name': instance.store_name,
    };
