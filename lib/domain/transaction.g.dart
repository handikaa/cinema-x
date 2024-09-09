// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionImpl _$$TransactionImplFromJson(Map<String, dynamic> json) =>
    _$TransactionImpl(
      id: json['id'] as String?,
      uid: json['uid'] as String,
      transactionTime: (json['transactionTime'] as num?)?.toInt(),
      transactionImage: json['transactionImage'] as String?,
      title: json['title'] as String,
      seat:
          (json['seat'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      teatherName: json['teatherName'] as String?,
      watchingTime: (json['watchingTime'] as num?)?.toInt(),
      ticketAmount: (json['ticketAmount'] as num?)?.toInt(),
      ticketPrcie: (json['ticketPrcie'] as num?)?.toInt(),
      adminFee: (json['adminFee'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'transactionTime': instance.transactionTime,
      'transactionImage': instance.transactionImage,
      'title': instance.title,
      'seat': instance.seat,
      'teatherName': instance.teatherName,
      'watchingTime': instance.watchingTime,
      'ticketAmount': instance.ticketAmount,
      'ticketPrcie': instance.ticketPrcie,
      'adminFee': instance.adminFee,
      'total': instance.total,
    };
