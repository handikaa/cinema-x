// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Transaction _$TransactionFromJson(Map<String, dynamic> json) {
  return _Transaction.fromJson(json);
}

/// @nodoc
mixin _$Transaction {
  String? get id => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  int? get transactionTime => throw _privateConstructorUsedError;
  String? get transactionImage => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  List<String> get seat => throw _privateConstructorUsedError;
  String? get teatherName => throw _privateConstructorUsedError;
  int? get watchingTime => throw _privateConstructorUsedError;
  int? get ticketAmount => throw _privateConstructorUsedError;
  int? get ticketPrcie => throw _privateConstructorUsedError;
  int get adminFee => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionCopyWith<Transaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCopyWith<$Res> {
  factory $TransactionCopyWith(
          Transaction value, $Res Function(Transaction) then) =
      _$TransactionCopyWithImpl<$Res, Transaction>;
  @useResult
  $Res call(
      {String? id,
      String uid,
      int? transactionTime,
      String? transactionImage,
      String title,
      List<String> seat,
      String? teatherName,
      int? watchingTime,
      int? ticketAmount,
      int? ticketPrcie,
      int adminFee,
      int total});
}

/// @nodoc
class _$TransactionCopyWithImpl<$Res, $Val extends Transaction>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? transactionTime = freezed,
    Object? transactionImage = freezed,
    Object? title = null,
    Object? seat = null,
    Object? teatherName = freezed,
    Object? watchingTime = freezed,
    Object? ticketAmount = freezed,
    Object? ticketPrcie = freezed,
    Object? adminFee = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTime: freezed == transactionTime
          ? _value.transactionTime
          : transactionTime // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionImage: freezed == transactionImage
          ? _value.transactionImage
          : transactionImage // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      seat: null == seat
          ? _value.seat
          : seat // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teatherName: freezed == teatherName
          ? _value.teatherName
          : teatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      watchingTime: freezed == watchingTime
          ? _value.watchingTime
          : watchingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      ticketAmount: freezed == ticketAmount
          ? _value.ticketAmount
          : ticketAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      ticketPrcie: freezed == ticketPrcie
          ? _value.ticketPrcie
          : ticketPrcie // ignore: cast_nullable_to_non_nullable
              as int?,
      adminFee: null == adminFee
          ? _value.adminFee
          : adminFee // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionImplCopyWith<$Res>
    implements $TransactionCopyWith<$Res> {
  factory _$$TransactionImplCopyWith(
          _$TransactionImpl value, $Res Function(_$TransactionImpl) then) =
      __$$TransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String uid,
      int? transactionTime,
      String? transactionImage,
      String title,
      List<String> seat,
      String? teatherName,
      int? watchingTime,
      int? ticketAmount,
      int? ticketPrcie,
      int adminFee,
      int total});
}

/// @nodoc
class __$$TransactionImplCopyWithImpl<$Res>
    extends _$TransactionCopyWithImpl<$Res, _$TransactionImpl>
    implements _$$TransactionImplCopyWith<$Res> {
  __$$TransactionImplCopyWithImpl(
      _$TransactionImpl _value, $Res Function(_$TransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? uid = null,
    Object? transactionTime = freezed,
    Object? transactionImage = freezed,
    Object? title = null,
    Object? seat = null,
    Object? teatherName = freezed,
    Object? watchingTime = freezed,
    Object? ticketAmount = freezed,
    Object? ticketPrcie = freezed,
    Object? adminFee = null,
    Object? total = null,
  }) {
    return _then(_$TransactionImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTime: freezed == transactionTime
          ? _value.transactionTime
          : transactionTime // ignore: cast_nullable_to_non_nullable
              as int?,
      transactionImage: freezed == transactionImage
          ? _value.transactionImage
          : transactionImage // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      seat: null == seat
          ? _value._seat
          : seat // ignore: cast_nullable_to_non_nullable
              as List<String>,
      teatherName: freezed == teatherName
          ? _value.teatherName
          : teatherName // ignore: cast_nullable_to_non_nullable
              as String?,
      watchingTime: freezed == watchingTime
          ? _value.watchingTime
          : watchingTime // ignore: cast_nullable_to_non_nullable
              as int?,
      ticketAmount: freezed == ticketAmount
          ? _value.ticketAmount
          : ticketAmount // ignore: cast_nullable_to_non_nullable
              as int?,
      ticketPrcie: freezed == ticketPrcie
          ? _value.ticketPrcie
          : ticketPrcie // ignore: cast_nullable_to_non_nullable
              as int?,
      adminFee: null == adminFee
          ? _value.adminFee
          : adminFee // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionImpl implements _Transaction {
  const _$TransactionImpl(
      {this.id,
      required this.uid,
      this.transactionTime,
      this.transactionImage,
      required this.title,
      final List<String> seat = const [],
      this.teatherName,
      this.watchingTime,
      this.ticketAmount,
      this.ticketPrcie,
      required this.adminFee,
      required this.total})
      : _seat = seat;

  factory _$TransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionImplFromJson(json);

  @override
  final String? id;
  @override
  final String uid;
  @override
  final int? transactionTime;
  @override
  final String? transactionImage;
  @override
  final String title;
  final List<String> _seat;
  @override
  @JsonKey()
  List<String> get seat {
    if (_seat is EqualUnmodifiableListView) return _seat;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_seat);
  }

  @override
  final String? teatherName;
  @override
  final int? watchingTime;
  @override
  final int? ticketAmount;
  @override
  final int? ticketPrcie;
  @override
  final int adminFee;
  @override
  final int total;

  @override
  String toString() {
    return 'Transaction(id: $id, uid: $uid, transactionTime: $transactionTime, transactionImage: $transactionImage, title: $title, seat: $seat, teatherName: $teatherName, watchingTime: $watchingTime, ticketAmount: $ticketAmount, ticketPrcie: $ticketPrcie, adminFee: $adminFee, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.transactionTime, transactionTime) ||
                other.transactionTime == transactionTime) &&
            (identical(other.transactionImage, transactionImage) ||
                other.transactionImage == transactionImage) &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._seat, _seat) &&
            (identical(other.teatherName, teatherName) ||
                other.teatherName == teatherName) &&
            (identical(other.watchingTime, watchingTime) ||
                other.watchingTime == watchingTime) &&
            (identical(other.ticketAmount, ticketAmount) ||
                other.ticketAmount == ticketAmount) &&
            (identical(other.ticketPrcie, ticketPrcie) ||
                other.ticketPrcie == ticketPrcie) &&
            (identical(other.adminFee, adminFee) ||
                other.adminFee == adminFee) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      uid,
      transactionTime,
      transactionImage,
      title,
      const DeepCollectionEquality().hash(_seat),
      teatherName,
      watchingTime,
      ticketAmount,
      ticketPrcie,
      adminFee,
      total);

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      __$$TransactionImplCopyWithImpl<_$TransactionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionImplToJson(
      this,
    );
  }
}

abstract class _Transaction implements Transaction {
  const factory _Transaction(
      {final String? id,
      required final String uid,
      final int? transactionTime,
      final String? transactionImage,
      required final String title,
      final List<String> seat,
      final String? teatherName,
      final int? watchingTime,
      final int? ticketAmount,
      final int? ticketPrcie,
      required final int adminFee,
      required final int total}) = _$TransactionImpl;

  factory _Transaction.fromJson(Map<String, dynamic> json) =
      _$TransactionImpl.fromJson;

  @override
  String? get id;
  @override
  String get uid;
  @override
  int? get transactionTime;
  @override
  String? get transactionImage;
  @override
  String get title;
  @override
  List<String> get seat;
  @override
  String? get teatherName;
  @override
  int? get watchingTime;
  @override
  int? get ticketAmount;
  @override
  int? get ticketPrcie;
  @override
  int get adminFee;
  @override
  int get total;

  /// Create a copy of Transaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionImplCopyWith<_$TransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
