import 'dart:io';

import '../../domain/result.dart';

import '../../domain/user.dart';

abstract interface class UserRepository {
  Future<Result<User>> createUser({
    required String uid,
    required String email,
    required String name,
    String? photoUrl,
    int balance = 0,
  });

  Future<Result<User>> getUSer({required String uid});
  Future<Result<User>> updateUSer({required User user});
  Future<Result<int>> getUserBalance({required String uid});
  Future<Result<User>> updateUserBalance(
      {required String uid, required int balance});
  Future<Result<User>> uploadProfilePict(
      {required User user, required File imageFile});
}
