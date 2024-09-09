import 'dart:io';

import '../../../domain/result.dart';
import '../../../domain/usecase/get_logged_user/get_logged_user.dart';
import '../../../domain/usecase/register/register.dart';
import '../../../domain/usecase/register/register_params.dart';
import '../../../domain/usecase/top_up/top_up.dart';
import '../../../domain/usecase/top_up/top_up_param.dart';
import '../../../domain/usecase/upload_profile_picture/upload_profile_picture.dart';
import '../../../domain/usecase/upload_profile_picture/upload_profile_picture_param.dart';
import '../movie/now_playing_provider.dart';
import '../movie/upcoming_provider.dart';
import '../transaction_data_provider/transactio_data_provider.dart';
import '../usecase/get_logged_user/get_logged_user_provider.dart';
import '../usecase/login_provier/login_provider.dart';
import '../usecase/logout_provider/logout_provider.dart';
import '../usecase/register_provider/register_provider.dart';
import '../usecase/top_up/top_up_provider.dart';
import '../usecase/upload_profile_picture/upload_profile_picture_provider.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/usecase/login/login.dart';
import '../../../domain/user.dart';

part 'user_data_provider.g.dart';

@Riverpod(keepAlive: true)
class UserData extends _$UserData {
  @override
  Future<User?> build() async {
    GetLoggedUser getLoggedUser = ref.read(getLoggedUserProvider);

    var userResult = await getLoggedUser(null);

    switch (userResult) {
      case Success(value: final user):
        _getMovie();
        return user;
      case Failed(message: _):
        return null;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    state = const AsyncLoading();

    Login login = ref.read(loginProvider);

    var result = await login(
      LoginParams(email: email, pasword: password),
    );

    switch (result) {
      case Success(value: final user):
        _getMovie();

        state = AsyncData(user);

        await ref
            .read(transactioDataProvider.notifier)
            .refreshTransactionData();
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    String? imgUrl,
  }) async {
    state = const AsyncLoading();

    Register register = ref.read(registerProvider);

    var result = await register(
      RegisterParams(
          name: name, email: email, password: password, photoUrl: imgUrl),
    );

    switch (result) {
      case Success(value: final user):
        _getMovie();
        state = AsyncData(user);
      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = const AsyncData(null);
    }
  }

  Future<void> refreshUserData() async {
    GetLoggedUser getLoggedUser = ref.read(getLoggedUserProvider);

    var result = await getLoggedUser(null);

    if (result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }

  Future<void> topUp(int amount) async {
    TopUp topUp = ref.read(topUpProvider);

    String? uid = state.valueOrNull?.uid;
    print('uid $uid');

    if (uid != null) {
      var result = await topUp(TopUpParam(amount: amount, uid: uid));

      if (result.isSuccess) {
        refreshUserData();
        ref.read(transactioDataProvider.notifier).refreshTransactionData();
      }
    }
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    var logout = ref.read(logoutProvider);

    var result = await logout(null);
    switch (result) {
      case Success(value: _):
        // await ref.read(transactioDataProvider.notifier).deleteTransactionData();
        ref.invalidate(transactioDataProvider);
        state = const AsyncData(null);

      case Failed(:final message):
        state = AsyncError(FlutterError(message), StackTrace.current);
        state = AsyncData(state.valueOrNull);
    }
  }

  Future<void> uploadProfilePicture(
      {required User user, required File image}) async {
    UploadProfilePicture uploadProfilePicture =
        ref.read(uploadProfilePictureProvider);

    var result = await uploadProfilePicture(
      UploadProfilePictureParam(user: user, imageFile: image),
    );

    if (result case Success(value: final user)) {
      state = AsyncData(user);
    }
  }

  void _getMovie() async {
    ref.read(nowPlayingProvider.notifier).getMovies();
    ref.read(upcomingProvider.notifier).getMovies();
  }
}
